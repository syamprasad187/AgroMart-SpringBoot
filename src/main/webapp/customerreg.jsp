<!DOCTYPE html>
<html>
<head>
    <title>Registration</title>
    <!-- Include Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<style>
   /* Custom styles */
body {
    background-color: #e3f2fd; /* Light blue background for the page */
}
.form-container {
    max-width: 450px; /* Container width */
    margin: 50px auto; /* Center the form */
    padding: 30px;
    background: linear-gradient(120deg, #bbdefb, #90caf9); /* Blue gradient */
    border-radius: 20px; /* More rounded corners */
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1); /* Softer shadow */
    transition: transform 0.3s; /* Smooth transform on hover */
}
.form-container:hover {
    transform: scale(1.02); /* Slightly scale up on hover */
}
h3 {
    text-align: center; /* Center the header */
    margin-bottom: 20px; /* Space below the header */
    color: #0d47a1; /* Dark blue color for header */
}
.btn-primary {
    background: linear-gradient(45deg, #42a5f5, #1e88e5); /* Blue gradient for primary button */
    border: none; /* Remove border */
    color: white; /* White text for better contrast */
}
.btn-secondary {
    background: linear-gradient(45deg, #ef5350, #e53935); /* Red gradient for secondary button */
    border: none; /* Remove border */
    color: white; /* White text for better contrast */
}

</style>

</head>
<body>
  <%@include file="mainnavbar.jsp" %>
  
  <div class="form-container">
      <h3><u>Customer Registration</u></h3>
      <form method="post" action="insertcustomer">
          <div class="form-group">
              <label for="cname">Enter Name</label>
              <input type="text" class="form-control" id="cname" name="cname" required/>
          </div>
          <div class="form-group">
              <label>Select Gender</label><br/>
              <div class="form-check form-check-inline">
                  <input class="form-check-input" type="radio" id="male" name="cgender" value="MALE" required/>
                  <label class="form-check-label" for="male">Male</label>
              </div>
              <div class="form-check form-check-inline">
                  <input class="form-check-input" type="radio" id="female" name="cgender" value="FEMALE" required/>
                  <label class="form-check-label" for="female">Female</label>
              </div>
              <div class="form-check form-check-inline">
                  <input class="form-check-input" type="radio" id="others" name="cgender" value="OTHERS" required/>
                  <label class="form-check-label" for="others">Others</label>
              </div>
          </div>
          <div class="form-group">
              <label for="cdob">Enter Date of Birth</label>
              <input type="date" class="form-control" id="cdob" name="cdob" required/>
          </div>
          <div class="form-group">
              <label for="cemail">Enter Email ID</label>
              <input type="email" class="form-control" id="cemail" name="cemail" required/>
          </div>
          <div class="form-group">
              <label for="cpwd">Enter Password</label>
              <input type="password" class="form-control" id="cpwd" name="cpwd" required/>
               <small id="passwordHelpBlock" class="form-text" style="color: red !important;">
            <i><b>Your password must be at least 8 characters long, contain at least one uppercase letter, one lowercase letter, one special character, and one number.</b></i>
                </small>
          </div>
          <div class="form-group">
              <label for="clocation">Enter Location</label>
              <input type="text" class="form-control" id="clocation" name="clocation" required/>
          </div>
          <div class="form-group">
              <label for="ccontact">Enter Contact</label>
              <input type="number" class="form-control" id="ccontact" name="ccontact" required/>
          </div>
          <div class="form-group text-center">
              <input type="submit" class="btn btn-primary" value="Register"/>
              <input type="reset" class="btn btn-secondary" value="Clear"/>
          </div>
      </form>
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
