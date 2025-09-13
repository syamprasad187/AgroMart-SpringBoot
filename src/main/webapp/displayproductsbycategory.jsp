<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Spring Boot Project</title>
    <!-- Tailwind CSS CDN -->
    <script src="https://cdn.tailwindcss.com"></script>
    
    <script>
        function myFunction() {
            var input, filter, cards, card, name, i, txtValue;
            input = document.getElementById("myInput");
            filter = input.value.toUpperCase();
            cards = document.getElementsByClassName("product-card");
            for (i = 0; i < cards.length; i++) {
                name = cards[i].getElementsByClassName("product-name")[0];
                if (name) {
                    txtValue = name.textContent || name.innerText;
                    if (txtValue.toUpperCase().indexOf(filter) > -1) {
                        cards[i].style.display = "";
                    } else {
                        cards[i].style.display = "none";
                    }
                }       
            }
        }
    </script>
</head>

<body class="bg-gray-100 font-sans">

    <!-- Heading -->
    <div class="text-center py-8">
        <h3 class="text-3xl font-semibold text-gray-800 underline">View All Products By Category</h3>
    </div>

    <!-- Search Input -->
    <div class="flex justify-center mb-6">
        <input type="text" id="myInput" onkeyup="myFunction()" placeholder="Enter Product Name" class="w-4/5 p-3 border border-gray-300 rounded-md shadow-md focus:outline-none focus:ring-2 focus:ring-green-500" />
    </div>

    <!-- Product Cards -->
    <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-6 px-4">
        <c:forEach items="${productlist}" var="product">
            <div class="product-card bg-white p-6 rounded-lg shadow-lg hover:shadow-xl transition duration-300 ease-in-out">
                <img src="displayproductimage?id=${product.id}" alt="${product.name}" class="w-full h-48 object-cover rounded-md mb-4" />
                <h2 class="product-name text-xl font-semibold text-gray-800 mb-2">${product.name}</h2>
                <p class="text-sm text-gray-600 mb-4">${product.description}</p>
                <p class="text-lg font-bold text-gray-700">Cost: ${product.cost}</p>
                <p class="mt-4">
                    <a href="<c:url value='${product.url}'></c:url>" class="text-green-500 font-semibold hover:underline">
                        Click Here
                    </a>
                </p>
            </div>
        </c:forEach>
    </div>

</body>

</html>
