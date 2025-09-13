<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Spring Boot MVC SDP Project</title>
    <!-- Tailwind CSS -->
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <!-- Font Awesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
<body class="bg-gray-100 h-screen flex">

    <!-- Sidebar -->
    <aside class="fixed top-0 left-0 w-64 h-full bg-gray-800 text-white shadow-md flex flex-col justify-between transition-all duration-500 ease-in-out transform">
        <!-- Sidebar Menu -->
        <div class="py-4 px-6">
            <h2 class="text-xl font-bold mb-6">Customer Menu</h2>
            <ul class="space-y-4"> <!-- Vertical gap between the list items -->
                <br>
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

    <!-- Main Content Area -->
    <div class="flex-1 flex flex-col ml-64">
        <!-- Navbar -->
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

        <!-- Page Content -->
        <div class="mt-20 p-6">
          Welcome to Customer Home Page...
        </div>
    </div>

</body>
</html>
