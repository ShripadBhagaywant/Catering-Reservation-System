<%@ page import="java.sql.*" %>
<%@ include file="connect.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>Admin Login</title>
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
            background-color:Violet;
            color: #f9f9f9;
            font-size: 14px;
            padding: 10px;
            width: 100%;
            border: none;
            margin-top: 15px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div class="login-form">
        <h2>ADMIN-LOGIN</h2>
        <form method="POST">
            <input type="text" placeholder="USERNAME" name="ad_name">
            <input type="password" placeholder="PASSWORD" name="ad_pass">
            <a href="home.html">
            <i class="fa fa-home">HOME</i>
            <button type="submit" name="sigin">LOGIN</button>
        </form>
    </div>
</body>
</html>
<%
String ad_name = "";
String ad_pass = "";

if (request.getParameter("sigin") != null) 
{
    ad_name = request.getParameter("ad_name");
    ad_pass = request.getParameter("ad_pass");

   try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ad_log","root", "");
	
			PreparedStatement ps = con.prepareStatement("select * from ad_login where ad_name=? and ad_pass=?");
			ps.setString(1, ad_name);
			ps.setString(2, ad_pass);
	
			ResultSet rs = ps.executeQuery();

			if (rs.next()) 
			{
				session.setAttribute("AdminLoginId", ad_name);
				response.sendRedirect("Admin Panel.jsp");
			} 
			else 
			{
				out.println("<script>alert('Incorrect Password')</script>");
			}

			con.close();
		} 
		catch (Exception e) 
		{
			out.println(e);
		}
}
%>