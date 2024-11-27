<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="connect.jsp" %>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<title>order</title>
	<style>
		body 
		{
			background-color: #fff;
			font-family: monospace;
			font-size: 14px;
			line-height: 1.5;
			margin: 0;
			padding: 0;
		}
		h2
			{
				
				background-color:#40e0d0;
				
				color: #f9f9f9;
			}
		.login-form 
		{
			max-width: 400px;
			margin: auto;
			background-color: #f9f9f9;
			padding: 20px;
			box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.2);
		}

		.login-form h2 
		{
			margin-bottom: 15px;
			font-size: 18px;
			font-weight: 500;
			text-align: center;
		}

		.login-form input[type="text"],
		.login-form input[type="password"] 
		{
			width: 100%;
			margin-bottom: 15px;
			padding: 10px;
			box-sizing: border-box;
			border: 1px solid #ccc;
			outline: none;
			font-size: 14px;
		}

		.login-form button 
		{
			background-color:#40e0d0;
			color: #f9f9f9;
			font-size: 14px;
			padding: 10px;
			width: 30%;
			border: none;
			margin-left:0px;
			margin-top: 15px;
			cursor: pointer;
		}
	</style>
</head>
	<div class="login-form">
		<h2>ORDER</h2>
		<form method="POST">
			<input type="text" placeholder="Name" name="name">
			<input type="text" placeholder="Last-name" name="lname">
			<input type="text" placeholder="Address" name="address">
			<input type="text" placeholder="Contact-No" name="phone">
			<input type="text" placeholder="Email" name="email">
			<marquee  style="color:#40e0d0;">NOTE:The Order Is Successful Than Fil The Regravation From</marquee>
		
			<button type="submit" name="order">Order</button>
			<button><a href="home.html" style="color:white; text-decoration:none;">Home</button>
			
		</form>
	</div>
	<%
	
	// Check if the form was submitted
	
	if(request.getParameter("order") != null)
	{
		// Get the form values and escape them to prevent SQL injection
		String name = request.getParameter("name");
		String lname = request.getParameter("lname");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
	
		
		// sql query
		String sql = "INSERT INTO ca_rg (name, lname, address, phone, email) VALUES ('" + name + "', '" + lname + "', '" + address + "', '" + phone + "', '" + email + "')";
	
		try {
				Statement stmt = conn.createStatement();
				stmt.executeUpdate(sql);
				// Display a success message
				out.println("<script>alert('Order successful!')</script>");
			} 
			catch(Exception e) 
			{
				// Display an error message if the query fails
				out.println("<div class='error'>Error: " + sql + "<br>" + e.getMessage() + "</div>");
			}
	}
%>

</body>
</html>