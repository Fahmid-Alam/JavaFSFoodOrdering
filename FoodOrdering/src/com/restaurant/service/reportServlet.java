package com.restaurant.service;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.restaurant.model.MenuItem;
import com.restaurant.util.DatabaseUtil;

@WebServlet("/reportServlet")
public class reportServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        try (Connection connection = DatabaseUtil.getConnection()) {
            @SuppressWarnings("unchecked")
            Map<MenuItem, Map<String, String>> cart = (Map<MenuItem, Map<String, String>>) session.getAttribute("cart");
            for (Map.Entry<MenuItem, Map<String, String>> entry : cart.entrySet()) {
                MenuItem item = entry.getKey();
                int quantity = Integer.parseInt(entry.getValue().get("quantity"));
                updateTotalSales(connection, item.getId(), quantity);
            }
            cart=null;
            session.setAttribute("cart", cart);
            // Redirect to the logout page or any other appropriate page
            response.sendRedirect("menu");
        } catch (SQLException e) {
            System.out.println("Fail to report  logout");
            e.printStackTrace();
        }
    }

    private void updateTotalSales(Connection connection, int itemId, int quantity) throws SQLException {
        String query = "UPDATE salesReport SET total_sales = total_sales + ? WHERE id = ?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, quantity);
            statement.setInt(2, itemId);
            statement.executeUpdate();
        }
    }
}
