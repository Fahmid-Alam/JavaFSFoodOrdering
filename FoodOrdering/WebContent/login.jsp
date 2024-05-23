<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index</title>
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
    .form-group {
            margin-bottom: 1.5rem; /* Increase the gap between form groups */
        }
</style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light mb-4">
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
         <ul class="navbar-nav mr-auto">
           <li class="nav-item">
                <a class="nav-link"  href="<%= request.getContextPath() %>/menu"><i class="fa-solid fa-bars"></i> Menu</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="appetizer.jsp"><i class="fa-solid fa-cookie-bite"></i>Appetizer</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="dessert.jsp"><i class="fa-solid fa-stroopwafel"></i>Dessert</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="mains.jsp"><i class="fa-solid fa-bowl-food"></i>Mains</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="beverages.jsp"><i class="fa-solid fa-martini-glass-citrus"></i>Beverages</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="others.jsp"><i class="fa-solid fa-burger"></i>Others</a>
            </li>
        </ul>
    </div>
</nav>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <fieldset>
                <legend>Login</legend>
                <form method="post" action="<%=request.getContextPath()%>/loginServlet">
                    <div class="form-group">
                        <input type="text" name="email" class="form-control" placeholder="Enter Email"/>
                    </div>
                    <div class="form-group">
                        <input type="password" name="password" class="form-control" placeholder="Enter Password"/>
                    </div>
                    <div class="form-group">
                        <select name="role" class="form-control">
                            <option value="admin">Admin</option>
                            <option value="user">User</option>
                        </select>
                    </div>
                    <div class="text-center mt-3">
                    <button type="submit" class="btn btn-primary btn-block">Login</button>
                    </div>
                </form>
                <div class="text-center mt-3">
                    <a href="register.jsp" class="btn btn-secondary">Register</a>
                </div>
            </fieldset>
        </div>
    </div>
</div>

<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
