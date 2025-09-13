<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Farmer - Spring Boot MVC SDP Project</title>
    <!-- Tailwind CSS -->
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Custom form styles */
        .form-container {
            max-width: 450px;
            margin: 50px auto;
            padding: 30px;
            background: linear-gradient(120deg, #f3e5f5, #e1bee7);
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s;
        }
        .form-container:hover {
            transform: scale(1.02);
        }
        h3 {
            text-align: center;
            margin-bottom: 20px;
            color: #2c3e50;
        }
        .btn-primary {
            background: linear-gradient(45deg, #6ab04c, #1dd1a1);
            border: none;
            color: white;
        }
        .btn-secondary {
            background: linear-gradient(45deg, #ff6b6b, #f79d00);
            border: none;
            color: white;
        }
    </style>
</head>
<body class="bg-gradient-to-r from-red-400 via-orange-400 via-yellow-400 via-green-400 via-blue-400 to-purple-400 font-sans min-h-screen flex flex-col">
    <!-- Sidebar -->
    <aside class="fixed top-16 left-0 w-64 h-full bg-gray-800 text-white shadow-md flex flex-col justify-between transition-all duration-500 ease-in-out transform">
        <div class="py-6 px-6">
            <h2 class="text-xl font-bold mb-6">Admin Menu</h2>
            <ul class="space-y-4">
                <li><a href="adminhome" class="block bg-blue-100 hover:bg-blue-200 text-gray-800 px-4 py-2 rounded-lg">Home</a></li>
                <li><a href="addfarmer" class="block bg-blue-100 hover:bg-blue-200 text-gray-800 px-4 py-2 rounded-lg">Add Farmers</a></li>
                <li><a href="viewallfarmers" class="block bg-blue-100 hover:bg-blue-200 text-gray-800 px-4 py-2 rounded-lg">View All Farmers</a></li>
                  <li><a href="updatefarmerstatus" class="block bg-blue-100 hover:bg-blue-200 text-gray-800 px-4 py-2 rounded-lg">Update Farmer Status</a></li>
                   
            </ul>
        </div>
    </aside>

    <!-- Main Content Area -->
    <div class="flex-1 flex flex-col ml-64">
        <!-- Navbar -->
        <nav class="bg-white w-full z-20 top-0 left-0 border-b border-gray-200 p-4 fixed">
            <div class="max-w-screen-xl mx-auto flex items-center justify-between">
                <a href="adminhome.jsp" class="text-2xl font-semibold text-blue-700">Admin Home</a>
                <ul class="flex items-center space-x-4">
                    <li><a href="adminlogout" class="text-gray-900 hover:text-blue-700">Logout</a></li>
                </ul>
            </div>
        </nav>

        <!-- Page Content with Form -->
        <div class="mt-20 p-6">
            <div class="form-container">
                <h3><u>Add Farmer</u></h3>
                <form method="post" action="insertfarmer" onsubmit="return validatePassword();">
                    <div class="form-group">
                        <label for="fname">Enter Name</label>
                        <input type="text" class="form-control" id="fname" name="fname" required/>
                    </div>
                    <div class="form-group">
                        <label for="femail">Enter Email ID</label>
                        <input type="email" class="form-control" id="femail" name="femail" required/>
                    </div>
                    <div class="form-group">
                        <label for="fpwd">Enter Password</label>
                        <input type="password" class="form-control" id="fpwd" name="fpwd" required/>
                        <small class="form-text text-danger">
                            <i><b>Your password must be at least 8 characters long, contain at least one uppercase letter, one lowercase letter, one special character, and one number.</b></i>
                        </small>
                    </div>
                    <div class="form-group">
                        <label for="fadd">Enter Address</label>
                        <input type="text" class="form-control" id="fadd" name="fadd" required/>
                    </div>
                    <div class="form-group">
                        <label for="ffarmsize">Enter Farm Size</label>
                        <input type="number" class="form-control" id="ffarmsize" name="ffarmsize" required/>
                    </div>
                    <div class="form-group">
                        <label for="fprod">Select Type of Products</label><br/>
                        <select class="form-control" id="fprod" name="fprod" required>
                            <option value="">-- Select Product Type --</option>
                            <option value="Processed Foods">Processed Foods</option>
                            <option value="Handmade Goods">Handmade Goods</option>
                            <option value="Organic Fertilizers">Organic Fertilizers</option>
                            <option value="Dairy and Animal Products">Dairy and Animal Products</option>
                            <option value="Packaging and Byproducts">Packaging and Byproducts</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="fcontact">Enter Contact</label>
                        <input type="number" class="form-control" id="fcontact" name="fcontact" required/>
                    </div>
                    <div class="form-group text-center">
                        <input type="submit" class="btn btn-primary" value="Register"/>
                        <input type="reset" class="btn btn-secondary" value="Clear"/>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script>
        function validatePassword() {
            const password = document.getElementById("fpwd").value;
            const regex = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@$!%*?&#])[A-Za-z\d@$!%*?&#]{8,}$/;
            if (!regex.test(password)) {
                alert("Password must be at least 8 characters long, contain at least one uppercase letter, one lowercase letter, one special character, and one number.");
                return false; 
            }
            return true; 
        }
    </script>
</body>
</html>
