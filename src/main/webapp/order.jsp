<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Payment</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  </head>
  <body>
    <div class="container" >
    <h1>Payment Gateway</h1>
    
    <table>
    	<tr>
    		<td>Enter Name: </td>
    		<td>
    			<input type="text" name="name" id="name" class="form-control" />
    		</td>
    	</tr>
    	<tr>
    		<td>Enter Email: </td>
    		<td>
    			<input type="email" name="email" id="email" class="form-control" required />
    		</td>
    	</tr>
    	<tr>
    		<td>Phone Number: </td>
    		<td>
    			<input type="number" name="phno" id="phno" class="form-control" required />
    		</td>
    	</tr>
    	
    	<!-- Orders in Option Tags -->
    	
    	<tr>
    		<td>Amount: </td>
    		<td>
    			<input type="number" name="amount" id="amount" class="form-control" required />
    		</td>
    	</tr>
    	
    	<tr>
    		<td></td>
    		<td><button id="rzp-button1" class="btn btn-primary" >Proceed To Pay</button></td>
    	</tr>
    	
    </table>
    </div>
    
    <script type="text/javascript" >
    	async function createOrder(){
    		console.log("---Order-Creation-Started---");
    		const response = await fetch('http://localhost:2532/create-order', {
    			method : 'POST',
    			header : {
    				'Content-Type' : 'application/json'
    			},
    			body : JSON.stringify({
    				name : document.getElementById('name').value,
    				email : document.getElementById('email').value,
    				phno : document.getElementById('phno').value,
    				amount : document.getElementById('amount').value,
    				currency : 'INR'
    			})
    		});
    	}
    </script>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
  </body>
</html>