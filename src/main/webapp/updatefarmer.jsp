<%@page import="com.klef.jfsd.springboot.model.Admin"%>
<%@page import="com.klef.jfsd.springboot.model.Farmer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
Farmer farmer = (Farmer)  session.getAttribute("farmer");
if(farmer==null)
{
	response.sendRedirect("farmersessionexpiry");
	return;
}

 
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Farmer</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="flex min-h-screen bg-gray-100">

    <!-- Sidebar -->
    <aside class="fixed top-0 left-0 w-64 h-full bg-gray-800 text-white shadow-md flex flex-col justify-between">
        <!-- Sidebar Menu -->
        <div class="py-4 px-6">
            <h2 class="text-xl font-bold mb-6">Admin Menu</h2>
            <ul class="space-y-4">
                <li><a href="adminhome" class="block bg-blue-100 hover:bg-blue-200 text-gray-800 px-4 py-2 rounded-lg">Home</a></li>
                <li><a href="addfarmer" class="block bg-blue-100 hover:bg-blue-200 text-gray-800 px-4 py-2 rounded-lg">Add Farmers</a></li>
                <li><a href="viewallfarmers" class="block bg-blue-100 hover:bg-blue-200 text-gray-800 px-4 py-2 rounded-lg">View All Farmers</a></li>
                <li><a href="updatefarmer" class="block bg-blue-100 hover:bg-blue-200 text-gray-800 px-4 py-2 rounded-lg">Update Farmer</a></li>
            </ul>
        </div>
    </aside>

    <!-- Main Content Area -->
    <div class="flex-1 flex flex-col ml-64">
        <!-- Navbar -->
        <nav class="bg-white border-b border-gray-200 w-full fixed top-0 left-0 p-4 z-20">
            <div class="max-w-screen-xl mx-auto flex items-center justify-between">
                <a href="adminhome.jsp" class="text-2xl font-semibold text-blue-700">Admin Home</a>
                <ul class="flex items-center space-x-4">
                    <li><a href="adminlogout" class="text-gray-900 hover:text-blue-700">Logout</a></li>
                </ul>
            </div>
        </nav>

        <!-- Main Content -->
        <main class="flex-grow pt-20 px-8">
            <h4 class="text-center text-red-500">
                <c:out value="${message}"></c:out>
            </h4>
            
            <h3 class="text-center text-lg font-semibold underline mb-6">Update Farmer</h3>
            <div class="max-w-lg mx-auto bg-white p-6 rounded-lg shadow-lg">
                <form method="post" action="updatefarmerprofile" class="space-y-4">
                    <div>
                        <label for="fid" class="block font-medium">Employee ID</label>
                        <input type="number" id="fid" name="fid" class="w-full px-4 py-2 border border-gray-300 rounded-md" value="<%= farmer.getId() %>" readonly required/>
                    </div>
                    <div>
                        <label for="fname" class="block font-medium">Enter Name</label>
                        <input type="text" id="fname" name="fname" value="<%= farmer.getName() %>" class="w-full px-4 py-2 border border-gray-300 rounded-md" required/>
                    </div>
                    <div>
                        <label for="faddress" class="block font-medium">Enter Address</label>
                        <input type="text" id="faddress" name="faddress" value="<%= farmer.getAddress() %>" class="w-full px-4 py-2 border border-gray-300 rounded-md" required/>
                    </div>
                    <div>
                        <label for="ffarmsize" class="block font-medium">Enter Farm Size</label>
                        <input type="text" id="ffarmsize" name="ffarmsize" value="<%= farmer.getFarmsize() %>" class="w-full px-4 py-2 border border-gray-300 rounded-md" required/>
                    </div>
                    <div>
                        <label for="fproducts" class="block font-medium">Select Type of Products</label>
                        <select id="fproducts" name="fproducts" class="w-full px-4 py-2 border border-gray-300 rounded-md" required>
                            <option value="">-- Select Product Type --</option>
                            <option value="Processed Foods" <%= farmer.getProductsProduced().equals("Processed Foods") ? "selected" : "" %>>Processed Foods</option>
                            <option value="Handmade Goods" <%= farmer.getProductsProduced().equals("Handmade Goods") ? "selected" : "" %>>Handmade Goods</option>
                            <option value="Organic Fertilizers" <%= farmer.getProductsProduced().equals("Organic Fertilizers") ? "selected" : "" %>>Organic Fertilizers</option>
                            <option value="Dairy and Animal Products" <%= farmer.getProductsProduced().equals("Dairy and Animal Products") ? "selected" : "" %>>Dairy and Animal Products</option>
                            <option value="Packaging and Byproducts" <%= farmer.getProductsProduced().equals("Packaging and Byproducts") ? "selected" : "" %>>Packaging and Byproducts</option>
                        </select>
                    </div>
                    <div>
                        <label for="fcontact" class="block font-medium">Enter Contact</label>
                        <input type="number" id="fcontact" name="fcontact" value="<%= farmer.getContact() %>" class="w-full px-4 py-2 border border-gray-300 rounded-md" required/>
                    </div>
                    <div class="flex space-x-4 pt-4">
                        <input type="submit" value="Update" class="bg-blue-500 hover:bg-blue-600 text-white font-semibold py-2 px-4 rounded-md"/>
                        <input type="reset" value="Clear" class="bg-red-500 hover:bg-red-600 text-white font-semibold py-2 px-4 rounded-md"/>
                    </div>
                </form>
            </div>
        </main>
    </div>

</body>
</html>
