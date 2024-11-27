<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
	<title>Catering Registration Page</title>
	<link rel="stylesheet" type="text/css" href="style.css">
	
<style>
body
	{
		font-family: monospace;
	}
.container 
	{
		max-width: 400px;
		margin: 0 auto;
		padding: 20px;
		background-color: #f2f2f2;
		border-radius: 5px;
		box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
	}

h1 {
		text-align: center;
		margin-bottom: 20px;
		background-color:MediumSeaGreen;
		color: #f9f9f9;		
	}
label 
	{
		display: block;
		margin-bottom: 5px;
		font-weight: bold;
	}

input[type="text"],
input[type="email"],
input[type="number"],
select,
textarea 
	{
		width: 100%;
		padding: 10px;
		margin-bottom: 20px;
		border-radius: 5px;
		border: none;
		box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.1);
	}

input[type="submit"], 
input[type="Reset"]{
	background-color:MediumSeaGreen;
	color: white;
	padding: 10px 20px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	font-size: 16px;
}

input[type="submit"],input[type="Reset"]:hover {
	background-color: MediumSeaGreen;
}
.container button {
			background-color:MediumSeaGreen;
			color: #f9f9f9;
			font-size: 14px;
			padding: 10px;
			width: 30%;
			border: none;
			margin-left:0px;
			margin-top: 15px;
			cursor: pointer;
			border-radius: 5px;
			font-weight:10px;
		}
		
</style>
</head>
<body>
	<div class="container">
		<h1> RESERVATION-HER</h1>
		<form method="post">
			<label for="name">NAME:</label>
			<input type="text" name="name" required>

			<label for="email">EMAIL:</label>
			<input type="email" name="email" required>

			<label for="phone">PHONE:</label>
			<input type="text" name="phone" required>

			<label for="event">EVENT TYPE:</label>
			<select name="event" required>
				<option value="wedding">Wedding</option>
				<option value="birthday">Birthday Party</option>
				<option value="other">Other</option>
			</select>
			

			<label for="attendees">NUMBER OF ATTENDEES:</label>
			<input type="number" name="attendance" required>

			<label for="date">EVENT DATE:</label>
			<input type="date" name="date" required>

			<label for="message">STAFF BUFFET &  OR VEG & NON-VEG CATRING-SPECIAL:</label>
			<textarea name="message"></textarea>
			
			<marquee style="color:MediumSeaGreen;">Per-Person:20RS</marquee>

			
			<input type="submit" name="submit" value="Submit">
			<button><a href="home.html" style="color:white; text-decoration:none;">Home</button>
			
		</form>
	</div>
</body>
</html>
<%
	if(request.getParameter("submit") != null)
	{
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String event = request.getParameter("event");
		String attendance = request.getParameter("attendance");
		String event_date = request.getParameter("date");
		String message = request.getParameter("message");
		// Insert user data into the database
		String sql = "INSERT INTO ca_rs (name, email, phone, event, attendance, event_date, message) VALUES ('" + name + "', '" + email + "', '" + phone + "', '" + event + "', '" + attendance + "', '" + event_date + "', '" + message + "')";

	try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ad_log", "root", "");
			Statement stmt = conn.createStatement();
			int result = stmt.executeUpdate(sql);
			
			if(result > 0) 
			{
				out.println("<script>alert('Reservation successful!')</script>");
			}
			else 
			{
				out.println("<div class='error'>Error: " + sql + "</div>");
			}
			conn.close();
		} 
		catch (Exception e) 
		{
			out.println("<div class='error'>Error: " + e.getMessage() + "</div>");
		}
	}
%>