<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="connect.jsp" %>
<html>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<title>
		ORDER DETALIS
</title>
<body>
		<div class="container">
		<button class="btn btn-primary my-5"><a href="Order.jsp" class="text-light"  style="text-decoration:none;">VIEW</a>
		</button>
		<button class="btn btn-primary my-5"><a href="Admin Panel.jsp" class="text-light"  style="text-decoration:none;">ADMIN</a>
		</button>
		<button  onclick="window.print()"  class="btn btn-primary my-5"  style="text-decoration:none;">REPORT</button>
		<table class="table">
  <thead>
    <tr>
      <th scope="col">sr.no</th>
      <th scope="col">First</th>
      <th scope="col">Last Name</th>
      <th scope="col">Address</th>
	  <th scope="col">Phone</th>
	  <th scope="col">Email</th>
	  <!--<th scope="col">Operation</th>-->
    </tr>
  </thead>
  <tbody>
 <%
		String sql = "SELECT * FROM ca_rg";
		
	try {
		
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(sql);
				while (rs.next()) 
			{
				int id = rs.getInt("id");
				String name = rs.getString("name");
				String lname = rs.getString("lname");
				String address = rs.getString("address");
				String phone = rs.getString("phone");
				String email = rs.getString("email");
				out.println("<tr>");
				out.println("<th scope='row'>" + id + "</th>");
				out.println("<td>" + name + "</td>");
				out.println("<td>" + lname + "</td>");
				out.println("<td>" + address + "</td>");
				out.println("<td>" + phone + "</td>");
				out.println("<td>" + email + "</td>");
				out.println("</tr>");
			}
				rs.close();
				stmt.close();
				conn.close();
		} 
		catch (Exception e) 
		{
			out.println("<div class='error'>Error: " + e.getMessage() + "</div>");
		}
%>	
  </tbody>
</table>
</body>
</html>