<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login</title>
    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>
    <!-- Framer Motion -->
    <script src="https://unpkg.com/framer-motion@6/dist/framer-motion.umd.js"></script>
</head>
<body class="bg-gradient-to-r from-blue-500 via-indigo-400 to-teal-400 font-sans min-h-screen flex flex-col">
   
  <%@include file="mainnavbar.jsp" %>
 
   <div class="flex-grow flex items-start justify-center mt-16">  
    <div id="login-card" class="w-full max-w-sm bg-gray-100 rounded-lg shadow-lg p-6 space-y-4 transform transition-all duration-500">
        <h3 class="text-center text-xl font-semibold text-gray-800 underline">Admin Login</h3>
        
        <form method="post" action="checkadminlogin" class="space-y-4">
            <div>
                <label for="auname" class="block text-gray-700">Enter Username</label>
                <input type="text" id="auname" name="auname" class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-teal-400" required />
            </div>
            <div>
                <label for="apwd" class="block text-gray-700">Enter Password</label>
                <input type="password" id="apwd" name="apwd" class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-teal-400" required />
            </div>
            <div class="flex justify-between items-center">
                <button type="submit" class="bg-teal-500 hover:bg-teal-600 text-white font-semibold py-2 px-4 rounded-md focus:outline-none">Login</button>
                <input type="reset" value="Clear" class="bg-purple-500 hover:bg-purple-600 text-white font-semibold py-2 px-4 rounded-md focus:outline-none"/>
            </div>
        </form>
    </div>
  </div>

  <script>
      const { motion } = window["framer-motion"];

      const loginCard = document.getElementById("login-card");

      motion(loginCard, {
          initial: { opacity: 0, scale: 0.8 },
          animate: { opacity: 1, scale: 1 },
          transition: { duration: 0.5 }
      }).start();
  </script>
</body>
</html>
