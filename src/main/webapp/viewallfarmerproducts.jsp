<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View All Farmer Products</title>
   
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
<body class="bg-gray-100">

    <aside class="fixed top-0 left-0 w-64 h-full bg-gray-800 text-white shadow-md flex flex-col justify-between transition-all duration-500 ease-in-out transform">
        <div class="py-4 px-6">
            <h2 class="text-xl font-bold mb-6">Customer Menu</h2>
            <ul class="space-y-4"> <!-- Vertical gap between the list items -->
                <li>
                    <a href="customerhome" class="block bg-blue-100 hover:bg-blue-200 text-gray-800 px-4 py-2 rounded-lg transition-all duration-300 ease-in-out">
                        Home
                    </a>
                </li>
                <li>
                    <a href="viewallfarmerproducts" class="block bg-blue-100 hover:bg-blue-200 text-gray-800 px-4 py-2 rounded-lg transition-all duration-300 ease-in-out">
                        View All Products
                    </a>
                </li>
            </ul>
        </div>
    </aside>

    <div class="flex-1 flex flex-col ml-64">
        
        <nav class="bg-white dark:bg-gray-900 w-full z-20 top-0 left-0 border-b border-gray-200 dark:border-gray-600 p-4 fixed">
            <div class="max-w-screen-xl mx-auto flex items-center justify-between">
                <a href="customerhome.jsp" class="text-2xl font-semibold text-blue-700">Customer Home</a>
                <ul class="flex items-center space-x-4">
                  <li>
                        <a href="wishlist.jsp" class="flex items-center text-gray-900 hover:text-blue-700">
                            <i class="fas fa-heart mr-2"></i>
                            Wishlist
                        </a>
                    </li>
                    <li>
                        <a href="cartpage" class="flex items-center text-gray-900 hover:text-blue-700">
                            <i class="fas fa-shopping-cart mr-2"></i>
                            Cart
                        </a>
                    </li>
                    <li>
                        <a href="customerlogout" class="text-gray-900 hover:text-blue-700">Logout</a>
                    </li>
                </ul>
            </div>
        </nav>

        <div class="container mx-auto py-8">
            <h3 class="text-2xl font-semibold text-center mb-6 underline">View All Farmer Products</h3>
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
                            
                            <!-- Add to Cart Button -->
                            <form action="addtocart" method="post" class="inline-block">
                                <input type="hidden" name="productId" value="${products.id}" />
                                <button type="submit" class="px-4 py-2 bg-blue-600 text-white rounded-lg shadow hover:bg-blue-700 transition duration-300">
                                    Add to Cart
                                </button>
                            </form>

                            <!-- Add to Wishlist Button -->
                            <form action="addtowishlist" method="post" class="inline-block" onsubmit="return redirectToWishlist()">
                                <input type="hidden" name="productId" value="${products.id}" />
                                <input type="hidden" name="productImage" value="${products.image}" /> <!-- Pass product image URL -->
                                <button type="submit" class="px-4 py-2 bg-green-600 text-white rounded-lg shadow hover:bg-green-700 transition duration-300">
                                    Add to Wishlist
                                </button>
                            </form>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>

    </div>

    <script>
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

        function redirectToWishlist() {
            window.location.href = "wishlist.jsp";  
            return false; 
        }
    </script>

</body>
</html>
