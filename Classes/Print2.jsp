<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="connect.jsp" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>

<html>
<head>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<title>
		RESERVATION DETAILS
</title>
<script>
  $( function() {
    var dateFormat = "dd/mm/yy",
      from = $( "#from" )
        .datepicker({
          defaultDate: "+1w",
          changeMonth: true,
          numberOfMonths: 1,
		   dateFormat : "dd/mm/yy",
        })
        .on( "change", function() {
          to.datepicker( "option", "minDate", getDate( this ) );
        }),
      to = $( "#to" ).datepicker({
        defaultDate: "+1w",
        changeMonth: true,
        numberOfMonths: 1,
		 dateFormat : "dd/mm/yy",
      })
      .on( "change", function() {
        from.datepicker( "option", "maxDate", getDate( this ) );
      });
 
    function getDate( element ) {
      var date;
      try {
        date = $.datepicker.parseDate( dateFormat, element.value );
      } catch( error ) {
        date = null;
      }
 
      return date;
    }
  } );
  </script>
</head>

<body>
		<form method="POST">
		<div class="container">
		<button class="btn btn-primary my-5"><a href="rs.jsp" class="text-light" style="text-decoration:none;">View</a>
		</button>
		<button class="btn btn-primary my-5"><a href="Admin Panel.jsp" class="text-light" style="text-decoration:none;">Back</a>
		</button>
		<button  onclick="window.print()"  class="btn btn-primary my-5">Print
		</button>
		<table class="table">
		<div>
		<br>
		<label for="from">From</label>
		<input type="text" id="from" name="from" required>
		<label for="to">to</label>
		<input type="text" id="to" name="to" required>
		
		<input type="submit"  name="submit" value="FILTER">
		</br>
		</div>
		</form>
		
		
  <thead>
    <tr>
      <th scope="col">sr.no</th>
      <th scope="col">First</th>
      <th scope="col">Email</th>
      <th scope="col">Phone</th>
	  <th scope="col">Event</th>
	  <th scope="col">Attandance</th>
	  <th scope="col">Date</th>
	  <th scope="col">Message</th>
	  <!--<th scope="col">Operation</th>--->
    </tr>
  </thead>
  <tbody>
 <%
		String sub_sql="";
		if(request.getParameter("submit")!=null)
		{
			String FR=request.getParameter("from");
				String[] formArr=FR.split("/");
			String from=formArr[2]+"-"+formArr[1]+"-"+formArr[0];
				//from=from+"00:00:00";

				String TO=request.getParameter("to");
				String[] toArr=TO.split("/");
				String to=toArr[2]+"-"+toArr[1]+"-"+toArr[0];
					//to=to+"23:59:59";

			sub_sql="where event_date >= '"+from+"' && event_date <= '"+to+"' ";
		}


		String sql = "SELECT * FROM ca_rs  "+sub_sql+" order by id desc";
		
	try {
		
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(sql);
		while (rs.next()) 
		{
			int id = rs.getInt("id");
			String name = rs.getString("name");
			String email = rs.getString("email");
			String phone = rs.getString("phone");
			String event = rs.getString("event");
			String attendance = rs.getString("attendance");
			String event_date = rs.getString("event_date");
			String message = rs.getString("message");
			out.println("<tr>");
			out.println("<th scope='row'>" + id + "</th>");
			out.println("<td>" + name + "</td>");
			out.println("<td>" + email + "</td>");
			out.println("<td>" + phone + "</td>");
			out.println("<td>" + event + "</td>");
			out.println("<td>" + attendance + "</td>");
			out.println("<td>" + event_date + "</td>");
			out.println("<td>" + message + "</td>");
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