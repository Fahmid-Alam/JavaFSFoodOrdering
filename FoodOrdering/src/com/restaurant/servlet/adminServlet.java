package com.restaurant.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.restaurant.util.DatabaseUtil;

@WebServlet("/adminServlet")
public class adminServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        try (Connection connection = DatabaseUtil.getConnection()) {
            if ("add".equals(action)) {
                addMenuItem(request, connection);
            } else if ("remove".equals(action)) {
                removeMenuItem(request, connection);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        response.sendRedirect("admin.jsp");
    }

    private void addMenuItem(HttpServletRequest request, Connection connection) throws SQLException {
        String name = request.getParameter("name");
        String category = request.getParameter("category");
        double price = Double.parseDouble(request.getParameter("price"));
        String description = request.getParameter("description");

        String query = "INSERT INTO MenuItem (name, category, price, description) VALUES (?, ?, ?, ?)";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, name);
            stmt.setString(2, category);
            stmt.setDouble(3, price);
            stmt.setString(4, description);
            stmt.executeUpdate();
        }
    }

    private void removeMenuItem(HttpServletRequest request, Connection connection) throws SQLException {
        int id = Integer.parseInt(request.getParameter("id"));

        String query = "DELETE FROM MenuItem WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
        }
    }
}
