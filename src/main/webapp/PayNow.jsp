<%@ page import="java.util.List" %>
<%@ page import="com.entity.Book_details" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Payment Options</title>

<link rel="stylesheet" href="style.css"> 
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/css/all.min.css">

<script>
function validateCardForm() {
    let cardNumber = document.getElementById("cardNumber").value;
    let expiryDate = document.getElementById("expiryDate").value;
    let cvv = document.getElementById("cvv").value;
    let cardName = document.getElementById("cardName").value;
    let currentDate = new Date();
    let enteredDate = new Date(expiryDate);

    let cardRegex = /^[0-9]{16}$/;
    let cvvRegex = /^[0-9]{3}$/;
    let nameRegex = /^[A-Za-z\s]{2,}$/;

    if (!cardRegex.test(cardNumber)) {
        alert("Invalid Card Number! Must be 16 digits.");
        return false;
    }
    if (enteredDate <= currentDate) {
        alert("Invalid Expiry Date! Must be a future date.");
        return false;
    }
    if (!cvvRegex.test(cvv)) {
        alert("Invalid CVV! Must be 3 digits.");
        return false;
    }
    if (!nameRegex.test(cardName)) {
        alert("Invalid Cardholder Name! Only letters allowed.");
        return false;
    }
    return true;
}

function validateUpiForm() {
    let upiId = document.getElementById("upiId").value;
    let upiRegex = /^[a-zA-Z0-9]+@[a-zA-Z]+$/;

    if (!upiRegex.test(upiId)) {
        alert("Invalid UPI ID! Format should be example@upi.");
        return false;
    }
    return true;
}
</script>

</head>
<body>

<%@ include file="navbar2.jsp" %>
<%@ include file="navbar.jsp" %>

<div class="container mt-5">
    <h2 class="text-center text-success">Choose Your Payment Method</h2>
    <hr>

    <div class="card p-4 mb-3">
        <h4>Final Price Details</h4>
        <%
            List<Book_details> cartList = (List<Book_details>) session.getAttribute("cart");
            double totalBookPrice = 0;

            if (cartList != null) {
                for (Book_details book : cartList) {
                    totalBookPrice += book.getBookprice();
                }
            }
            double tax = totalBookPrice * 0.10;
            double deliveryCharges = totalBookPrice * 0.05;
            double finalPrice = totalBookPrice + tax + deliveryCharges;
        %>
        <p>Books Total Price: $<%= String.format("%.2f", totalBookPrice) %></p>
        <p>Tax (10%): $<%= String.format("%.2f", tax) %></p>
        <p>Delivery Charges (5%): $<%= String.format("%.2f", deliveryCharges) %></p>
        <hr>
        <h4>Final Amount: $<%= String.format("%.2f", finalPrice) %></h4>
    </div>
    
    <!-- Credit/Debit Card Payment -->
    <div class="card p-4 mb-3">
        <h4><i class="bi bi-credit-card"></i> Pay via Credit/Debit Card</h4>
        <form action="paymentSuccess.jsp" method="post" onsubmit="return validateCardForm()">
            <div class="mb-3">
                <label for="cardNumber" class="form-label">Card Number</label>
                <input type="text" class="form-control" id="cardNumber" placeholder="Enter card number" required>
            </div>

            <div class="row">
                <div class="col-md-6">
                    <label for="expiryDate" class="form-label">Expiry Date</label>
                    <input type="month" class="form-control" id="expiryDate" required>
                </div>
                <div class="col-md-6">
                    <label for="cvv" class="form-label">CVV</label>
                    <input type="password" class="form-control" id="cvv" placeholder="***" maxlength="3" required>
                </div>
            </div>

            <div class="mb-3 mt-3">
                <label for="cardName" class="form-label">Cardholder Name</label>
                <input type="text" class="form-control" id="cardName" placeholder="Enter name on card" required>
            </div>

            <div class="text-center">
                <button type="submit" class="btn btn-success">Pay Now</button>
            </div>
        </form>
    </div>

    <!-- Cash on Delivery -->
    <div class="card p-4 mb-3">
        <h4><i class="bi bi-cash"></i> Cash on Delivery (COD)</h4>
        <p>The customer will be asked to pay the full amount at the time of delivery.</p>
        <div class="text-center">
            <a href="paymentSuccess.jsp" class="btn btn-success">Confirm COD Order</a>
        </div>
    </div>

    <!-- UPI Payment -->
    <div class="card p-4">
        <h4><i class="bi bi-upc-scan"></i> Pay via UPI</h4>
        <form action="paymentSuccess.jsp" method="post" onsubmit="return validateUpiForm()">
            <div class="mb-3">
                <label for="upiId" class="form-label">Enter Your UPI ID</label>
                <input type="text" class="form-control" id="upiId" placeholder="example@upi" required>
            </div>

            <div class="text-center">
                <button type="submit" class="btn btn-success">Pay Using UPI</button>
            </div>
        </form>
    </div>
</div>

<%@ include file="ourPartners.jsp" %>
</body>
</html>
