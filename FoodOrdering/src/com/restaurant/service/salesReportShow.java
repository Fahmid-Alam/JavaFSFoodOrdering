package com.restaurant.service;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.restaurant.model.salesReport;
import com.restaurant.util.DatabaseUtil;

@WebServlet("/salesReportServlet")
public class salesReportShow extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	HttpSession session=request.getSession();
        List<salesReport> salesReports = new ArrayList<>();
        try (Connection connection = DatabaseUtil.getConnection()) {
            String query = "SELECT * FROM salesReport";
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(query);
            while (resultSet.next()) {
                salesReport report = new salesReport();
                report.setId(resultSet.getInt("id"));
                System.out.println(""+resultSet.getInt("id")+" "+resultSet.getInt("total_sales"));
                report.setName(resultSet.getString("name"));
                report.setCategory(resultSet.getString("category"));
                report.setPrice(resultSet.getDouble("price"));
                report.setTotalSales(resultSet.getInt("total_sales"));
                salesReports.add(report);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
       
        session.setAttribute("salesReports", salesReports);
        response.sendRedirect("admin.jsp");
    }
}
