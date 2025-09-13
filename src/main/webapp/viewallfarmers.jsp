<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View All Farmers - Admin Panel</title>
    <!-- Tailwind CSS -->
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100 h-screen flex">

    <!-- Sidebar -->
    <aside class="fixed top-0 left-0 w-64 h-full bg-gray-800 text-white shadow-md flex flex-col justify-between transition-all duration-500 ease-in-out transform">
        <div class="py-4 px-6">
            <h2 class="text-xl font-bold mb-6">Admin Menu</h2>
            <ul class="space-y-4">
                <li>
                    <a href="adminhome" class="block bg-blue-100 hover:bg-blue-200 text-gray-800 px-4 py-2 rounded-lg transition-all duration-300 ease-in-out">Home</a>
                </li>
                <li>
                    <a href="addfarmer" class="block bg-blue-100 hover:bg-blue-200 text-gray-800 px-4 py-2 rounded-lg transition-all duration-300 ease-in-out">Add Farmers</a>
                </li>
                <li>
                    <a href="viewallfarmers" class="block bg-blue-100 hover:bg-blue-200 text-gray-800 px-4 py-2 rounded-lg transition-all duration-300 ease-in-out">View All Farmers</a>
                </li>
                  <li><a href="updatefarmerstatus" class="block bg-blue-100 hover:bg-blue-200 text-gray-800 px-4 py-2 rounded-lg">Update Farmer Status</a></li>
                   
            </ul>
        </div>
    </aside>

    <!-- Main Content Area -->
    <div class="flex-1 flex flex-col ml-64">
        <!-- Navbar -->
        <nav class="bg-white dark:bg-gray-900 w-full z-20 top-0 left-0 border-b border-gray-200 dark:border-gray-600 p-4 fixed">
            <div class="max-w-screen-xl mx-auto flex items-center justify-between">
                <a href="adminhome.jsp" class="text-2xl font-semibold text-blue-700">Admin Home</a>
                <ul class="flex items-center space-x-4">
                    <li>
                        <a href="adminlogout" class="text-gray-900 hover:text-blue-700">Logout</a>
                    </li>
                </ul>
            </div>
        </nav>

        <!-- Page Content -->
        <div class="flex-1 p-6 mt-16">
            <div class="w-full max-w-6xl mx-auto bg-white rounded-lg shadow-lg p-6">
                <h3 class="text-center text-2xl font-bold underline mb-4">View All Farmers</h3>
                  <p class="text-center mb-4">Total Farmers = <c:out value="${farmercount}"></c:out></p>
              
                <div class="overflow-x-auto">
                    <table class="min-w-full border-collapse">
                        <thead>
                            <tr class="bg-black text-white">
                             <th class="border border-black p-2">ID</th>
                                <th class="border border-black p-2">NAME</th>
                                <th class="border border-black p-2">Email ID</th>
                                <th class="border border-black p-2">Password</th>
                                <th class="border border-black p-2">Address</th>
                                <th class="border border-black p-2">Farm Size</th>
                                <th class="border border-black p-2">Type Of Products</th>
                                <th class="border border-black p-2">CONTACT</th>
                                <th class="border border-black p-2">STATUS</th>
                                <th class="border border-black p-2">ACTION</th>
                                
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${flist}" var="farmer">
                                <tr class="border-b border-gray-300">
                                    <td class="border border-black p-2"><c:out value="${farmer.id}"/></td>             
                                    <td class="border border-black p-2"><c:out value="${farmer.name}"/></td>
                                    <td class="border border-black p-2"><c:out value="${farmer.email}"/></td>
                                    <td class="border border-black p-2"><c:out value="${farmer.password}"/></td>
                                    <td class="border border-black p-2"><c:out value="${farmer.address}"/></td>
                                    <td class="border border-black p-2"><c:out value="${farmer.farmsize}"/></td>
                                    <td class="border border-black p-2"><c:out value="${farmer.productsProduced}"/></td>       
                                    <td class="border border-black p-2"><c:out value="${farmer.contact}"/></td>
                                    <td class="border border-black p-2"><c:out value="${farmer.status}"/></td>
                                    <td class="border border-black p-2">
                                        <a href='<c:url value="delete?id=${farmer.id}"></c:url>' class="text-red-500 hover:underline">Delete</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

</body>
</html>
