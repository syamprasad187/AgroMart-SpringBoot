<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Cart</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        h2 {
            text-align: center;
            margin-top: 20px;
            color: #333;
        }

        .cart-container {
            width: 80%;
            margin: 0 auto;
            padding-top: 20px;
        }

        .cart-item {
            display: flex;
            align-items: center;
            justify-content: space-between;
            background-color: white;
            padding: 15px;
            margin: 10px 0;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .cart-item img {
            width: 100px;
            height: auto;
            border-radius: 5px;
        }

        .cart-item-details {
            flex-grow: 1;
            margin-left: 20px;
        }

        .cart-item-details h3 {
            margin: 0;
            font-size: 18px;
        }

        .cart-item-details p {
            margin: 5px 0;
            color: #555;
        }

        .cart-item-actions {
            text-align: right;
        }

        .cart-item-actions button {
            background-color: #28a745;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .cart-item-actions button:hover {
            background-color: #218838;
        }

        .message {
            color: #28a745;
            text-align: center;
            font-size: 18px;
            margin: 20px 0;
        }

        .empty-cart {
            text-align: center;
            font-size: 18px;
            color: #888;
        }
    </style>
</head>
<body>

    <h2>Your Cart</h2>

    <!-- Displaying the success or error message -->
    <div class="message">
        <c:if test="${not empty message}">
            ${message}
        </c:if>
    </div>

    <!-- If the cart is empty -->
    <c:if test="${empty cartProducts}">
        <div class="empty-cart">
            <p>Your cart is empty. Start shopping!</p>
        </div>
    </c:if>

    <!-- Display cart items -->
    <div class="cart-container">
        <c:forEach var="product" items="${cartProducts}">
    <div class="product">
        <h3>${product.name}</h3>
        <p>${product.description}</p>
        <p>${product.price}</p>
        
        <!-- Displaying image dynamically -->
        <img src="<c:url value='/displayfarmerproductimage?id=${product.id}' />" alt="Product Image" />
    </div>
</c:forEach>
        
    </div>

</body>
</html>
