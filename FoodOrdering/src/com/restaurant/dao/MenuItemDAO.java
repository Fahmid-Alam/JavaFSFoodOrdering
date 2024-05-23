package com.restaurant.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.restaurant.model.MenuItem;

public class MenuItemDAO {
    private Connection connection;

    public MenuItemDAO(Connection connection) {
        this.connection = connection;
    }

    public List<MenuItem> getAllMenuItems() throws SQLException {
        List<MenuItem> items = new ArrayList<>();
        try {
            String query = "SELECT * FROM MenuItem";
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            System.out.println("Connected Successfully");
            while (rs.next()) {
                MenuItem item = new MenuItem();
                item.setId(rs.getInt("id"));
                item.setName(rs.getString("name"));
                item.setCategory(rs.getString("category"));
                item.setPrice(rs.getDouble("price")); // corrected method name
                item.setDescription(rs.getString("description"));
                item.setSpiceLevel(rs.getString("spice_level"));
                items.add(item);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Not Connected");
            throw e; // Re-throw SQLException to propagate it to the caller
        }
        return items;
    }

    // Add other CRUD operations as needed
}
