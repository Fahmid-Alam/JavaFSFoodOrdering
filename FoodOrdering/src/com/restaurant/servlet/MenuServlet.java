package com.restaurant.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession; // Import HttpSession

import com.restaurant.dao.MenuItemDAO;
import com.restaurant.model.MenuItem;

import com.restaurant.util.DatabaseUtil;

@WebServlet("/menu")
public class MenuServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //PrintWriter out=response.getWriter();
        try (Connection connection = DatabaseUtil.getConnection()) {
            System.out.println("Successfully Connected to DB in DAO");
            MenuItemDAO menuItemDAO = new MenuItemDAO(connection);
            List<MenuItem> menuItems = menuItemDAO.getAllMenuItems();

            // Get the session
            HttpSession session = request.getSession();
            // Set the menuItems attribute in the session
            session.setAttribute("menuItems", menuItems);

            // Redirect to the Welcome.jsp
            response.sendRedirect("MenuItem.jsp");
        } catch (Exception e) {
            System.out.println("Fail to DB in DAO");
            e.printStackTrace();
        }
    }
}
