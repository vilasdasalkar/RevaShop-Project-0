<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.revature.service.dao.*, com.revature.service.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Logout Header</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" href="css/changes.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	
</head>
<body style="background-color: #01ff12;font-family: Verdana, sans-serif;">
	<!--Company Header Starting  -->
<div class="left"
    style="margin-top: 45px; background-color: #d811df; color: #10bababa; padding: 20px; border-radius: 10px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); max-width: 900px; margin: 45px auto;">
    <div style="display: flex; justify-content: space-between; align-items: center;">
        <!-- Left side: Search items -->
        <div style="flex: 1; margin-right: 20px;">
            <h2 style="font-family: 'Arial', sans-serif; color: white;">RevShop</h2>
            <h6 style="font-family: 'Arial', sans-serif; color: #f3f3f3;">RevaElectronics Product</h6>
<form class="form-inline" action="index.jsp" method="get">
    <div class="input-group" style="display: flex; width: 100%; align-items: center;">
        <input type="text" class="form-control" name="search"
            placeholder="Search Items" required
            style="flex: 1; border-radius: 30px 0 0 30px; padding: 10px; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); border: 1px solid #ccc; height: 45px;">

        <input type="submit" class="btn btn-danger" value="Search"
            style="border-radius: 0 30px 30px 0; padding: 10px 20px; background-color: #f44336; border-color: #f44336; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); cursor: pointer; height: 45px;">
    </div>
</form>

        </div>
        
        <!-- Right side: Special Deals -->
        <div style="flex: 1; background-color: #ff5722; color: white; padding: 10px; border-radius: 10px; text-align: center;">
            <h3 style="margin: 0; font-family: 'Arial', sans-serif;">Special Deals</h3>
            <p style="margin: 5px 0;">Up to 50% off on selected items!</p>
            <p style="margin: 5px 0;">Free Home Delivery Available</p>
        </div>
    </div>
    <p align="right"
        style="color: orange; font-weight: bold; margin-top: 10px; margin-bottom: 5px; font-family: 'Arial', sans-serif;"
        id="message"></p>
</div>


	
	<!-- Company Header Ending -->

	<%
	/* Checking the user credentials */
	String userType = (String) session.getAttribute("usertype");
	if (userType == null) { //LOGGED OUT
	%>

	<!-- Starting Navigation Bar -->
<nav class="navbar navbar-default navbar-fixed-top navbar-custom">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="index.jsp">RevShop</a>
        </div>
        <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="register.jsp">Register</a></li>
                <li><a href="login.jsp">Login</a></li>
                <li><a href="index.jsp">Products</a></li>
                <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Category <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="index.jsp?type=mobile">Mobiles</a></li>
                        <li><a href="index.jsp?type=tv">TVs</a></li>
                        <li><a href="index.jsp?type=laptop">Laptops</a></li>
                        <li><a href="index.jsp?type=camera">Camera</a></li>
                        <li><a href="index.jsp?type=speaker">Speakers</a></li>
                        <li><a href="index.jsp?type=tablet">Tablets</a></li>
                    </ul>
                </li>
            </ul>
            <!-- New div for discount text -->
            <div class="navbar-text" style="color: orange; margin-left: 10px;">
                <strong>Get 20% off on all electronics! Use code: SAVE20</strong>
            </div>
        </div>
    </div>
</nav>


	<%
	} else if ("customer".equalsIgnoreCase(userType)) { 

	int notf = new CartServiceImpl().getCartCount((String) session.getAttribute("username"));
	%>
	<nav class="navbar navbar-default navbar-fixed-top">

		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="userHome.jsp"><span
					class="glyphicon glyphicon-home">&nbsp;</span>RevShop</a>
			</div>

			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="userHome.jsp"><span
							class="glyphicon glyphicon-home">Products</span></a></li>
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#">Category <span class="caret"></span>
					</a>
						<ul class="dropdown-menu">
							<li><a href="userHome.jsp?type=mobile">Mobiles</a></li>
							<li><a href="userHome.jsp?type=tv">TV</a></li>
							<li><a href="userHome.jsp?type=laptop">Laptops</a></li>
							<li><a href="userHome.jsp?type=camera">Camera</a></li>
							<li><a href="userHome.jsp?type=speaker">Speakers</a></li>
							<li><a href="userHome.jsp?type=tablet">Tablets</a></li>
						</ul></li>
					<%
					if (notf == 0) {
					%>
					<li><a href="cartDetails.jsp"> <span
							class="glyphicon glyphicon-shopping-cart"></span>Cart
					</a></li>

					<%
					} else {
					%>
					<li><a href="cartDetails.jsp"
						style="margin: 0px; padding: 0px;" id="mycart"><i
							data-count="<%=notf%>"
							class="fa fa-shopping-cart fa-3x icon-white badge"
							style="background-color: #333; margin: 0px; padding: 0px; padding-bottom: 0px; padding-top: 5px;">
						</i></a></li>
					<%
					}
					%>
					<li><a href="orderDetails.jsp">Orders</a></li>
					<li><a href="userProfile.jsp">Profile</a></li>
					<li><a href="./LogoutServlet">Logout</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<%
	} else {
	%>
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="adminViewProduct.jsp"><span
					class="glyphicon glyphicon-home">&nbsp;</span>RevShop</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="adminViewProduct.jsp">Products</a></li>
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#">Category <span class="caret"></span>
					</a>
						<ul class="dropdown-menu">
							<li><a href="adminViewProduct.jsp?type=mobile">Mobiles</a></li>
							<li><a href="adminViewProduct.jsp?type=tv">Tvs</a></li>
							<li><a href="adminViewProduct.jsp?type=laptop">Laptops</a></li>
							<li><a href="adminViewProduct.jsp?type=camera">Camera</a></li>
							<li><a href="adminViewProduct.jsp?type=speaker">Speakers</a></li>
							<li><a href="adminViewProduct.jsp?type=tablet">Tablets</a></li>
						</ul></li>
					<li><a href="adminStock.jsp">Stock</a></li>
					<li><a href="shippedItems.jsp">Shipped</a></li>
					<li><a href="unshippedItems.jsp">Orders</a></li>
					<!-- <li><a href=""> <span class="glyphicon glyphicon-shopping-cart"></span>&nbsp;Cart</a></li> -->
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#">Update Items <span
							class="caret"></span>
					</a>
						<ul class="dropdown-menu">
							<li><a href="addProduct.jsp">Add Product</a></li>
							<li><a href="removeProduct.jsp">Remove Product</a></li>
							<li><a href="updateProductById.jsp">Update Product</a></li>
						</ul></li>
					<li><a href="./LogoutServlet">Logout</a></li>

				</ul>
			</div>
		</div>
	</nav>
	<%
	}
	%>
	<!-- End of Navigation Bar -->
</body>
</html>