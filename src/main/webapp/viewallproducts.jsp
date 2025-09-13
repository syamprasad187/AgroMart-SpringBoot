<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View All Products</title>
    <!-- Link to Tailwind CSS CDN -->
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100">

    <!-- Sidebar -->
    <aside class="fixed top-0 left-0 w-64 h-full bg-gray-800 text-white shadow-lg flex flex-col justify-between transform transition-all duration-500 ease-in-out">
        <div class="py-6 px-6">
            <h2 class="text-2xl font-bold mb-6 text-center">Farmer Menu</h2>
            <ul class="space-y-4">
                <li>
                    <a href="farmerhome" class="block bg-blue-100 hover:bg-blue-200 text-gray-800 px-4 py-2 rounded-lg transition duration-300">
                        Home
                    </a>
                </li>
                <li>
                    <a href="addproducts" class="block bg-blue-100 hover:bg-blue-200 text-gray-800 px-4 py-2 rounded-lg transition duration-300">
                        Add Products
                    </a>
                </li>
                <li>
                    <a href="viewallproducts" class="block bg-blue-100 hover:bg-blue-200 text-gray-800 px-4 py-2 rounded-lg transition duration-300">
                        View All Products
                    </a>
                </li>
                <li>
                    <a href="displayfarmersbyproducts" class="block bg-blue-100 hover:bg-blue-200 text-gray-800 px-4 py-2 rounded-lg transition-all duration-300 ease-in-out">
                        View Farmers by Products
                    </a>
                </li>
            </ul>
        </div>
    </aside>

    <!-- Main Content Area -->
    <div class="flex-1 flex flex-col ml-64">
        
        <!-- Navbar -->
        <nav class="bg-white dark:bg-gray-900 w-full z-20 top-0 left-0 border-b border-gray-200 dark:border-gray-600 p-4 fixed">
            <div class="max-w-screen-xl mx-auto flex items-center justify-between">
                <a href="farmerhome.jsp" class="text-2xl font-semibold text-blue-700">Farmer Home</a>
                <ul class="flex items-center space-x-4">
                    <li>
                        <a href="farmerlogout" class="text-gray-900 hover:text-blue-700">Logout</a>
                    </li>
                </ul>
            </div>
        </nav>

        <!-- Page Content -->
        <div class="container mx-auto py-8 mt-24"> <!-- mt-24 is to push content below navbar -->
            <h3 class="text-2xl font-semibold text-center mb-6 underline">View All Products</h3>
            <div class="w-full mb-6">
                <input type="text" id="myInput" onkeyup="myFunction()" placeholder="Enter Product Name"
                    class="w-full p-4 text-gray-700 rounded-lg shadow-md focus:outline-none focus:ring-2 focus:ring-blue-500" />
            </div>

            <div id="myTableContainer" class="grid gap-6 lg:grid-cols-3 md:grid-cols-2 sm:grid-cols-1">
                <c:forEach items="${plist}" var="products">
                    <div class="card bg-white rounded-lg shadow-md overflow-hidden p-4">
                        <!-- Product Image -->
                        <div class="w-full h-48 bg-gray-200 rounded-t-lg overflow-hidden">
                            <img src="displayproductimage?id=${products.id}" alt="${products.name}" 
                                class="w-full h-full object-cover object-center">
                        </div>

                        <div class="p-4 text-center">
                            <h4 class="text-lg font-semibold mb-2 text-gray-800">
                                <c:out value="${products.name}" />
                            </h4>
                            <p class="text-green-600 font-bold text-xl mb-2">&#8377;<c:out value="${products.cost}" /></p>
                            <p class="text-blue-500 mb-2">
                                <a href="${products.url}" target="_blank" class="underline">Product Link</a>
                            </p>
                            <p class="text-gray-600 mb-4"><c:out value="${products.description}" /></p>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>

    <script>
        // Search functionality for product names
        function myFunction() {
            var input, filter, cards, cardTitle, cardDescription, cardCost, i, txtValue;
            input = document.getElementById("myInput");
            filter = input.value.toUpperCase();
            cards = document.getElementById("myTableContainer").getElementsByClassName("card");

            for (i = 0; i < cards.length; i++) {
                cardTitle = cards[i].getElementsByTagName("h4")[0];  
                cardDescription = cards[i].getElementsByTagName("p")[1]; 
                cardCost = cards[i].getElementsByTagName("p")[0]; 

                if (cardTitle || cardDescription || cardCost) {
                    txtValue = 
                        (cardTitle ? cardTitle.textContent || cardTitle.innerText : "") +
                        (cardDescription ? cardDescription.textContent || cardDescription.innerText : "") +
                        (cardCost ? cardCost.textContent || cardCost.innerText : "");

                    cards[i].style.display = txtValue.toUpperCase().indexOf(filter) > -1 ? "" : "none";
                }
            }
        }
    </script>

</body>
</html>
