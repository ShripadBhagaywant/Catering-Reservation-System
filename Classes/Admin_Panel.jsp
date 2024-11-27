<%
	session = request.getSession();
	
	if(session.getAttribute("AdminLoginId") == null)
	{
		response.sendRedirect("adminlog.jsp");
	}
%>
<!DOCTYPE html>
<html>
<head>
	<title>Admin Dashboard</title>
	
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous"><link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
	<style type="text/css">
		body
		{
			margin: 0;
			background-color: #eee;
			font-family: monospace;
		}
		.container
		{
			margin: auto;
			max-width: 1200px;
			background-color: #fff;
			box-shadow: 0px 0px 5px #999;
			padding: 20px;
		}
		.header
		{
			background-color: #212121;
			padding:15px;
			color: #fff;
			text-align: center;
		}
		.content
		{
			padding: 20px;
		}
		.card
		{
			background-color: Violet;
			box-shadow: 0px 0px 5px #999;
			margin: 10px;
			padding: 10px;
		}
		.card-header
		{
			background-color:Violet;
			padding: 10px;
			color: #fff;
			text-align: center;
		}
		.card-body
		{
			padding: 10px;
		}
		.card-footer
		{
			background-color:Tomato;
			padding: 10px;
			color: #fff;
			text-align: center;
		}
		.mybutton 
		{
			font-size: 1.0rem;
			padding: 2px 2px;
			background-color:blue=-;
			color: #ff;
			border-radius: 4px;
			border: none;
			outline: none;
			cursor: pointer;
		}
</style>
</head>
<body>
	<div class="container">
		<div class="header">
			<h1>ADMIN DASHBOARD <?php echo $_SESSION['AdminLoginId']?></h1>
			<form method="POST">
				<button class="btn btn-primary" name="Logout">LOG-OUT</button>
			</form>
		</div>
		<div class="content">
			<div class="card">
				<div class="card-header">
					<h2>ORDER DETAILS</h2>
				</div>
				<div class="card-body">
				</div>
				<div class="card-footer">
					<button class="btn btn-denger"><a href="display.jsp" class="text-light" style="text-decoration:none;">CHECK-HERE</button>
				</div>
			</div>
			<div class="card">
				<div class="card-header">
					<h2>RESERVATION DETAILS</h2>
				</div>
				<div class="card-body">
				</div>
				<div class="card-footer">
					<button class="btn btn-denger"><a href="display2.jsp" class="text-light" style="text-decoration:none;">CHECK-HERE</button>
				</div>
			</div>
		</div>
	</div>
<%
	if(request.getParameter("Logout") != null)
	{
	
		response.sendRedirect("adminlog.jsp");
	}
%>
</body>
</html>