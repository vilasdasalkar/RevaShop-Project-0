<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Product</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="css/changes.css">
</head>
<body style="background-color: #f2f2f2;">

    <%-- Checking the user credentials --%>
    <%
        String userType = (String) session.getAttribute("usertype");
        String userName = (String) session.getAttribute("username");
        String password = (String) session.getAttribute("password");

        if (userType == null || !userType.equals("admin")) {
            response.sendRedirect("login.jsp?message=Access Denied, Login as admin!!");
        } else if (userName == null || password == null) {
            response.sendRedirect("login.jsp?message=Session Expired, Login Again!!");
        }
    %>

    <jsp:include page="header.jsp" />

    <%
        String message = request.getParameter("message");
    %>

    <div class="container">
        <div class="row" style="margin-top: 50px;">
            <form action="./AddProductServlet" method="post" enctype="multipart/form-data" class="col-md-6 col-md-offset-3"
                style="border: 1px solid #ccc; border-radius: 10px; background-color: #ffffff; padding: 30px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);">
                <div class="text-center" style="margin-bottom: 20px;">
                    <h2 style="color: #333; font-family: 'Arial', sans-serif; font-weight: bold;">Product Addition Form</h2>
                    <% if (message != null) { %>
                        <p style="color: red; font-weight: bold;">
                            <%=message%>
                        </p>
                    <% } %>
                </div>

                <div class="row">
                    <div class="col-md-6 form-group">
                        <label for="product_name" style="font-weight: bold; color: #555;">Product Name</label>
                        <input type="text" placeholder="Enter Product Name" name="name" class="form-control" id="product_name" required
                            style="border-radius: 5px; padding: 10px; border: 1px solid #ccc;">
                    </div>
                    <div class="col-md-6 form-group">
                        <label for="producttype" style="font-weight: bold; color: #555;">Product Type</label>
                        <select name="type" id="producttype" class="form-control" required
                            style="border-radius: 5px; padding: 10px; border: 1px solid #ccc;">
                            <option value="mobile">MOBILE</option>
                            <option value="tv">TV</option>
                            <option value="camera">CAMERA</option>
                            <option value="laptop">LAPTOP</option>
                            <option value="tablet">TABLET</option>
                            <option value="speaker">SPEAKER</option>
                            <option value="other">Some Other Appliances</option>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label for="product_description" style="font-weight: bold; color: #555;">Product Description</label>
                    <textarea name="info" class="form-control" id="product_description" required
                        style="border-radius: 5px; padding: 10px; border: 1px solid #ccc;"></textarea>
                </div>

                <div class="row">
                    <div class="col-md-6 form-group">
                        <label for="unit_price" style="font-weight: bold; color: #555;">Unit Price</label>
                        <input type="number" placeholder="Enter Unit Price" name="price" class="form-control" id="unit_price" required
                            style="border-radius: 5px; padding: 10px; border: 1px solid #ccc;">
                    </div>
                    <div class="col-md-6 form-group">
                        <label for="stock_quantity" style="font-weight: bold; color: #555;">Stock Quantity</label>
                        <input type="number" placeholder="Enter Stock Quantity" name="quantity" class="form-control" id="stock_quantity" required
                            style="border-radius: 5px; padding: 10px; border: 1px solid #ccc;">
                    </div>
                </div>

                <div class="form-group">
                    <label for="product_image" style="font-weight: bold; color: #555;">Product Image</label>
                    <input type="file" name="image" class="form-control" id="product_image" required
                        style="border-radius: 5px; padding: 10px; border: 1px solid #ccc;">
                </div>

                <div class="row text-center">
                    <div class="col-md-6" style="margin-bottom: 10px;">
                        <button type="reset" class="btn btn-danger" style="padding: 10px 20px; border-radius: 5px;">Reset</button>
                    </div>
                    <div class="col-md-6">
                        <button type="submit" class="btn btn-primary" style="padding: 10px 20px; border-radius: 5px;">Add Product</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <%@ include file="footer.html"%>

</body>
</html>
