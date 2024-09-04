package com.revature.servlets;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.io.InputStream;

import com.revature.service.dao.ProductServiceImpl;

@WebServlet("/AddProductServlet")
@MultipartConfig(maxFileSize = 16177215) // 16MB
public class AddProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String userType = (String) session.getAttribute("usertype");
        String userName = (String) session.getAttribute("username");
        String password = (String) session.getAttribute("password");

        if (userType == null || !userType.equals("admin")) {
            response.sendRedirect("login.jsp?message=Access Denied!");
            return;
        } else if (userName == null || password == null) {
            response.sendRedirect("login.jsp?message=Session Expired, Login Again to Continue!");
            return;
        }

        String status = "Product Registration Failed!";
        try {
            String prodName = request.getParameter("name");
            String prodType = request.getParameter("type");
            String prodInfo = request.getParameter("info");
            double prodPrice = Double.parseDouble(request.getParameter("price"));
            int prodQuantity = Integer.parseInt(request.getParameter("quantity"));

            Part part = request.getPart("image");
            InputStream prodImage = part.getInputStream();

            ProductServiceImpl productService = new ProductServiceImpl();
            status = productService.addProduct(prodName, prodType, prodInfo, prodPrice, prodQuantity, prodImage);

        } catch (Exception e) {
            status = "Error: " + e.getMessage();
        }

        RequestDispatcher rd = request.getRequestDispatcher("addProduct.jsp?message=" + status);
        rd.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
