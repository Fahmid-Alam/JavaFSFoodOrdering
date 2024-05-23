<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Panel</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
    <%@ include file="cdn.jsp" %>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="#">Restaurant Admin</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="btn btn-danger" href="logout">Logout</a>
                </li>
            </ul>
        </div>
    </nav>

    <div class="container mt-4">
        <h1>Admin Panel</h1>
        <hr>
        <%@ include file="salesReport.jsp" %>
        <hr>
        <h3>Add Menu Item</h3>
        <form action="<%=request.getContextPath()%>/adminServlet" method="post">
            <input type="hidden" name="action" value="add">
            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="category">Category:</label>
                <input type="text" id="category" name="category" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="price">Price:</label>
                <input type="number" id="price" name="price" class="form-control" step="0.01" required>
            </div>
            <div class="form-group">
                <label for="description">Description:</label>
                <input type="text" id="description" name="description" class="form-control">
            </div>
            <button type="submit" class="btn btn-primary">Add Item</button>
        </form>
        <hr>
        <h3 class="mt-4">Remove Menu Item</h3>
        <form action="adminServlet" method="post">
            <input type="hidden" name="action" value="remove">
            <div class="form-group">
                <label for="id">Menu Item ID:</label>
                <input type="number" id="id" name="id" class="form-control" required>
            </div>
            <button type="submit" class="btn btn-danger">Remove Item</button>
        </form>
    </div>
</body>
</html>
