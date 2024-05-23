package com.restaurant.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.restaurant.model.MenuItem;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        // Retrieve the menu items from session
        List<MenuItem> menuItems = (List<MenuItem>) session.getAttribute("menuItems");
        if (menuItems == null) {
            menuItems = new ArrayList<>();
        }

        // Retrieve the cart from the session, or create a new one if it doesn't exist
        Map<MenuItem, Map<String, String>> cart = (Map<MenuItem, Map<String, String>>) session.getAttribute("cart");
        if (cart == null) {
            cart = new HashMap<>();
        }

        // Process each menu item
        for (MenuItem item : menuItems) {
            String quantityParam = request.getParameter("quantity_" + item.getId());
            String spiceLevelParam = request.getParameter("spice_" + item.getId());
            String specificationParam = request.getParameter("specification_" + item.getId());

            if (quantityParam != null && !quantityParam.isEmpty() && Integer.parseInt(quantityParam) > 0) {
                int quantity = Integer.parseInt(quantityParam);
                Map<String, String> details = new HashMap<>();
                details.put("quantity", String.valueOf(quantity));
                details.put("spiceLevel", spiceLevelParam);
                details.put("specification", specificationParam);
                 
                cart.put(item, details);
            }
        }

        // Save the cart back to the session
        session.setAttribute("cart", cart);

        // Redirect to the cart display page
        String user=(String)session.getAttribute("email");
        System.out.println(user);
        if(user==null) {
        	response.sendRedirect("login.jsp");
        }
        else {
        response.sendRedirect("cart.jsp");
        }
    }
}
