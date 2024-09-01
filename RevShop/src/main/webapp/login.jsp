<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Login</title>
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
            <form action="./LoginServlet" method="post" class="col-md-4 col-md-offset-4 col-sm-8 col-sm-offset-2"
                style="border: 1px solid #ccc; border-radius: 10px; background-color: #ffffff; padding: 30px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);">
                <div class="text-center">
                    <h2 style="color: #333; font-family: 'Arial', sans-serif; font-weight: bold;">Login Form</h2>
                    <% if (message != null) { %>
                        <p style="color: red; font-weight: bold;">
                            <%=message%>
                        </p>
                    <% } %>
                </div>
                
                <div class="form-group">
                    <label for="username" style="font-weight: bold; color: #555;">Username</label>
                    <input type="email" placeholder="Enter Username" name="username" class="form-control" id="username" required
                        style="border-radius: 5px; padding: 10px; border: 1px solid #ccc;">
                </div>
                
                <div class="form-group">
                    <label for="password" style="font-weight: bold; color: #555;">Password</label>
                    <input type="password" placeholder="Enter Password" name="password" class="form-control" id="password" required
                        style="border-radius: 5px; padding: 10px; border: 1px solid #ccc;">
                </div>
                
                <div class="form-group">
                    <label for="userrole" style="font-weight: bold; color: #555;">Login As</label>
                    <select name="usertype" id="userrole" class="form-control" required
                        style="border-radius: 5px; padding: 10px; border: 1px solid #ccc;">
                        <option value="customer" selected>CUSTOMER</option>
                        <option value="admin">ADMIN</option>
                    </select>
                </div>
                
                <div class="text-center">
                    <button type="submit" class="btn btn-primary" style="padding: 10px 20px; border-radius: 5px;">Login</button>
                </div>
            </form>
        </div>
    </div>

    <%@ include file="footer.html"%>

</body>
</html>
