package com.restaurant.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.restaurant.model.MenuItem;
import com.restaurant.util.DatabaseUtil;

/**
 * Servlet implementation class loginServlet
 */
@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getParameter("email");
        String password = request.getParameter("password");
        String role = request.getParameter("role");
        
        HttpSession session = request.getSession( );
        session.setAttribute("email", email);
        List<MenuItem> menuItems = (List<MenuItem>) session.getAttribute("menuItems");
        Map<MenuItem, Map<String, String>> cart = (Map<MenuItem, Map<String, String>>) session.getAttribute("cart");
        try {
        	Connection con=DatabaseUtil.getConnection();
        	String query = "select * from login where email='"+email+"' and password='"+password+"' and role='"+role+"'";
			PreparedStatement ps = con.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			
			PrintWriter out=response.getWriter();
			
			if(rs.next()) {   // koi to h with this data 
				if(role.equals("user")) {
                    if(menuItems==null || cart==null) {
                    	response.sendRedirect("menu");
                    }
                    else {
					response.sendRedirect("cart.jsp");
                    }
				}
				else {
					 out.println("<h1>Mgmt</h1>");
					response.sendRedirect("salesReportServlet");
				}
			}
			else {   // no one with data
				 out.println("<h1>Fail</h1>");
				response.sendRedirect("login.jsp");
			}
              
        } catch(Exception e) {
            e.printStackTrace();
        }
        
		
	}

}
