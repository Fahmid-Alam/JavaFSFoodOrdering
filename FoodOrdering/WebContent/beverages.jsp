<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.util.List" %>
<%@ page import="com.restaurant.model.MenuItem" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Restaurant Menu</title>
    <%@ include file="cdn.jsp"%>
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
    </style>
</head>
<body>
<%@ include file="navbar.jsp"%>

<div class="container">
    <h1>Beverages</h1>
    <form action="<%=request.getContextPath()%>/cart" method="post">
        <table class="table">
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Category</th>
                    <th>Price</th>
                    <th>Spice Level</th>
                    <th>Quantity</th>
                    <th>Additonal</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<MenuItem> menuItems = (List<MenuItem>) session.getAttribute("menuItems");
                    if (menuItems != null) {
                        for (MenuItem item : menuItems) {
                        	if(item.getCategory().equals("Beverage")){
                %>
                <tr>
                   <td><%= item.getName() %></td>
                        <td><%= item.getCategory() %></td>
                        <td><%= item.getPrice() %></td>
                        <td><input type="text" name="spice_<%= item.getId() %>" class="form-control"></td> <!-- New input field for spice level -->
                        <td><input type="number" name="quantity_<%= item.getId() %>" value="0" min="0" step="1" class="form-control"></td>
                        <td><input type="text" name="specification_<%= item.getId() %>" class="form-control"></td> <!-- New input field for specification -->
                </tr>
                <% 
                        	}
                        }
                    } else {
                %>
                <tr>
                    <td colspan="6">No menu items available.</td>
                </tr>
                <% } %>
            </tbody>
        </table>
        <input type="submit" value="Add to Cart" class="btn btn-primary">
    </form>
</div>

<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
