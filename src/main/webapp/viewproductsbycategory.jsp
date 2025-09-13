<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page contentType="text/html; charset=ISO-8859-1" isELIgnored="false"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Spring Boot Project</title>
    <!-- Include Tailwind CSS from CDN -->
    <script src="https://cdn.tailwindcss.com"></script>

</head>

<body class="bg-gray-100 font-sans">

    <!-- Main Content -->
    <div class="container mx-auto p-8">

        <!-- Heading -->
        <h3 class="text-3xl text-center font-semibold mb-6 text-gray-800">
            <u>View Products by Category</u>
        </h3>

        <!-- Form Section -->
        <div class="bg-white p-6 rounded-lg shadow-lg max-w-lg mx-auto">
            <form action="displayproductsbycategory" method="post">
                <!-- Category Selection -->
                <div class="mb-4">
                    <label for="category" class="block text-gray-700 text-lg font-medium mb-2">Category</label>
                    <select name="category" id="category" class="w-full p-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500" required>
                        <option value="">---Select---</option>
                        <option value="Processed Foods">Processed Foods</option>
                        <option value="Handmade Goods">Handmade Goods</option>
                        <option value="Organic Fertilizers">Organic Fertilizers</option>
                        <option value="Dairy and Animal Products">Dairy and Animal Products</option>
                    </select>
                </div>

                <!-- Submit Button -->
                <div class="text-center">
                    <button type="submit" class="w-full py-3 bg-green-500 text-white font-semibold rounded-lg hover:bg-green-600 focus:outline-none focus:ring-2 focus:ring-green-500">
                        View Products
                    </button>
                </div>
            </form>
        </div>

    </div>

</body>

</html>
