<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Agromart</title>
<!-- Include Bootstrap CSS -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<style>
    /* Custom styles */
    body, html {
        margin: 0;
        padding: 0;
        height: 100%;
        width: 100%;
    }

    .background-image {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        object-fit: cover; /* Ensures the image covers the whole page */
        z-index: -1; /* Places the image in the background */
        filter: blur(10px); /* Apply a slight blur */
    }

    .container {
        display: flex;
        justify-content: flex-start;  /* Align to the left */
        align-items: center;
        min-height: 100vh;
        position: relative;
        z-index: 1;  
        padding-left: 50px; 
       padding-bottom: 10%; 
    }

    .content-box {
        background-color: rgba(255, 255, 255, 0.8); /* Semi-transparent white background */
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1); /* Subtle shadow */
        margin: 20px 0;
        transition: transform 0.3s ease, box-shadow 0.3s ease; /* Smooth scaling and shadow effect */
    }

    /* Hover effect for inward movement */
    .content-box:hover {
        transform: scale(0.95); /* Shrink slightly on hover */
        box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2); /* Stronger shadow on hover */
    }

    ol li {
        margin-bottom: 10px;
        font-size: 18px;
        color: black; /* White text for better contrast */
    }
</style>
</head>
<body>

<%@include file="mainnavbar.jsp" %>

<!-- Full-page background image -->
<img src="bg.jpg" alt="Background Image" class="background-image">

<div class="container">
    <div class="content-box">
        <h2>Welcome to the Page</h2>
        <p>Login And Buy Products</p>
        <ol>
            <li>Processes Food </li>
            <li>Organic Fertilizers</li>
            <li>Dairy and Animal Products ...</li>
        </ol>
    </div>
</div>

</body>
</html>
