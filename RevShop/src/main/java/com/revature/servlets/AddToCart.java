package com.revature.servlets;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

import com.revature.data.ProductData;
import com.revature.data.RequestData;
import com.revature.service.dao.CartServiceImpl;
import com.revature.service.dao.ProductServiceImpl;
import com.revature.service.dao.RequestServiceImpl;


/**
 * Servlet implementation class AddToCart
 */
public class AddToCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddToCart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String userName = (String) session.getAttribute("username");
        String password = (String) session.getAttribute("password");
        String userType = (String) session.getAttribute("usertype");
        if (userName == null || password == null || userType == null || !userType.equalsIgnoreCase("customer")) {
            response.sendRedirect("login.jsp?message=Session Expired, Login Again to Continue!");
            return;
        }

        // login Check Successful

        String userId = userName;
        String prodId = request.getParameter("pid");
        int pQty = Integer.parseInt(request.getParameter("pqty")); // 1

        CartServiceImpl cart = new CartServiceImpl();
        ProductServiceImpl productDao = new ProductServiceImpl();
        ProductData product = productDao.getProductDetails(prodId);

        int availableQty = product.getProdQuantity();
        int cartQty = cart.getProductCount(userId, prodId);
        pQty += cartQty;

        PrintWriter pw = response.getWriter();
        response.setContentType("text/html");

        if (pQty == cartQty) {
            String status = cart.removeProductFromCart(userId, prodId);
            RequestDispatcher rd = request.getRequestDispatcher("userHome.jsp");
            rd.include(request, response);
            pw.println("<script>document.getElementById('message').innerHTML='" + status + "'</script>");
        } else if (availableQty < pQty) {
            String status;
            if (availableQty == 0) {
                status = "Product is Out of Stock!";
            } else {
                cart.updateProductToCart(userId, prodId, availableQty);
                status = "Only " + availableQty + " no of " + product.getProdName()
                        + " are available in the shop! So we are adding only " + availableQty
                        + " products into Your Cart.";
            }
            RequestData demandBean = new RequestData(userName, product.getProdId(), pQty - availableQty);
            RequestServiceImpl demand = new RequestServiceImpl();
            boolean flag = demand.addProduct(demandBean);
            if (flag) {
                status += "<br/>Later, We Will Mail You when " + product.getProdName()
                        + " will be available in the Store!";
            }
            RequestDispatcher rd = request.getRequestDispatcher("cartDetails.jsp");
            rd.include(request, response);
            pw.println("<script>document.getElementById('message').innerHTML='" + status + "'</script>");
        } else {
            String status = cart.updateProductToCart(userId, prodId, pQty);
            RequestDispatcher rd = request.getRequestDispatcher("userHome.jsp");
            rd.include(request, response);
            pw.println("<script>document.getElementById('message').innerHTML='" + status + "'</script>");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}
