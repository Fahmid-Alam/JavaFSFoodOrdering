<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="com.restaurant.model.MenuItem" %>
<html>
<head>
    <title>Cart</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            font-size: 1.25rem; /* Increase the base font size */
        }
        .nav-link {
            font-size: 1.8rem; /* Increase the size of the nav links */
            margin-right: 18px; /* Add space between nav links */
        }
        .form-control {
            font-size: 1.25rem; /* Increase the size of the form inputs */
        }
        .btn-primary {
            font-size: 1.25rem; /* Increase the size of the button */
        }
        fieldset {
            margin-top: 2rem; /* Add some margin on top of the form */
            padding: 1.5rem; /* Add some padding to the fieldset */
            border: 2px solid #007bff; /* Add border color */
        }
        legend {
            font-size: 2rem; /* Increase the size of the legend text */
            color: #007bff; /* Change color of the legend text */
        }
        .table th, .table td {
            padding: 15px; /* Add padding to table cells */
        }
        .container {
            margin-top: 20px; /* Add margin to the top of the container */
        }
        .total-box {
            background-color: #f8f9fa;
            border: 1px solid #dee2e6;
            padding: 10px;
            margin-top: 20px;
            text-align: right;
        }
        .btn-payment {
            margin-top: 20px;
        }
    </style>
       <%@ include file="navbar.jsp" %>
</head>
<body>


    <div class="container mt-5">
        <h1>Cart</h1>
        <%-- <%String e=(String)request.getParameter("email");
        out.println(","+e); %> --%>
        <%
       
            Map<MenuItem, Map<String, String>> cart = (Map<MenuItem, Map<String, String>>) session.getAttribute("cart");
            if (cart != null && !cart.isEmpty()) {
        %>
        <form action="<%= request.getContextPath() %>/reportServlet" method="post">
        <table class="table">
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Category</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Spice Level</th>
                    <th>Specification</th>
                </tr>
            </thead>
            <tbody>
                <%
                    double total=0.0;
                    for (Map.Entry<MenuItem, Map<String, String>> entry : cart.entrySet()) {
                        MenuItem item = entry.getKey();
                        Map<String, String> details = entry.getValue();
                        total += item.getPrice() * Double.parseDouble(details.get("quantity"));
                %>
                <tr>
                    <td><%= item.getName() %></td>
                    <td><%= item.getCategory() %></td>
                    <td><%= item.getPrice() %></td>
                    <td><%= details.get("quantity") %></td>
                    <td><%= details.get("spiceLevel") %></td>
                    <td><%= details.get("specification") %></td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
        <div class="total-box">
                Total Price: Rs.<%= total %>
         </div>
          <button type="submit" class="btn btn-primary btn-payment">Go to Payment</button>
        <%
            } else {
        %>
        <p>Your cart is empty.</p>
        <%
            }
        %>
    </div>
</body>
</html>
