<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Register</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/changes.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>

<body style="background-color: #f5f5f5;">

    <%@ include file="header.jsp"%>

    <%
        String message = request.getParameter("message");
    %>

    <div class="container">
        <div class="row" style="margin-top: 50px;">
            <form action="./RegisterServlet" method="post" class="col-md-6 col-md-offset-3"
                style="border: 1px solid #ccc; border-radius: 10px; background-color: #ffffff; padding: 30px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);">
                <div class="text-center">
                    <h2 style="color: #333; font-family: 'Arial', sans-serif; font-weight: bold;">Registration Form</h2>
                    <% if (message != null) { %>
                        <p style="color: red; font-weight: bold;">
                            <%=message%>
                        </p>
                    <% } %>
                </div>

                <div class="row">
                    <div class="col-md-6 form-group">
                        <label for="first_name" style="font-weight: bold; color: #555;">Name</label>
                        <input type="text" name="username" class="form-control" id="first_name" required
                            style="border-radius: 5px; padding: 10px; border: 1px solid #ccc;">
                    </div>
                    <div class="col-md-6 form-group">
                        <label for="email" style="font-weight: bold; color: #555;">Email</label>
                        <input type="email" name="email" class="form-control" id="email" required
                            style="border-radius: 5px; padding: 10px; border: 1px solid #ccc;">
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="address" style="font-weight: bold; color: #555;">Address</label>
                    <textarea name="address" class="form-control" id="address" required
                        style="border-radius: 5px; padding: 10px; border: 1px solid #ccc;"></textarea>
                </div>
                
                <div class="row">
                    <div class="col-md-6 form-group">
                        <label for="mobile" style="font-weight: bold; color: #555;">Mobile</label>
                        <input type="number" name="mobile" class="form-control" id="mobile" required
                            style="border-radius: 5px; padding: 10px; border: 1px solid #ccc;">
                    </div>
                    <div class="col-md-6 form-group">
                        <label for="pincode" style="font-weight: bold; color: #555;">Pin Code</label>
                        <input type="number" name="pincode" class="form-control" id="pincode" required
                            style="border-radius: 5px; padding: 10px; border: 1px solid #ccc;">
                    </div>
                </div>
                
                <div class="row">
                    <div class="col-md-6 form-group">
                        <label for="password" style="font-weight: bold; color: #555;">Password</label>
                        <input type="password" name="password" class="form-control" id="password" required
                            style="border-radius: 5px; padding: 10px; border: 1px solid #ccc;">
                    </div>
                    <div class="col-md-6 form-group">
                        <label for="confirmPassword" style="font-weight: bold; color: #555;">Confirm Password</label>
                        <input type="password" name="confirmPassword" class="form-control" id="confirmPassword" required
                            style="border-radius: 5px; padding: 10px; border: 1px solid #ccc;">
                    </div>
                </div>
                
                <div class="row text-center">
                    <div class="col-md-6" style="margin-bottom: 10px;">
                        <button type="reset" class="btn btn-danger" style="padding: 10px 20px; border-radius: 5px;">Reset</button>
                    </div>
                    <div class="col-md-6">
                        <button type="submit" class="btn btn-primary" style="padding: 10px 20px; border-radius: 5px;">Register</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <%@ include file="footer.html"%>

</body>
</html>
