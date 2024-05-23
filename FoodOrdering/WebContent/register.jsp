<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
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
    .btn-primary, .btn-secondary {
        font-size: 1.25rem; /* Increase the size of the buttons */
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
<%@ include file="navbar.jsp"%>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <fieldset>
                <legend>Register</legend>
                <form method="post" action="<%=request.getContextPath()%>/registerServlet">
                    <div class="form-group">
                        <input type="text" name="email" class="form-control" placeholder="Enter Email" required/>
                    </div>
                    <div class="form-group">
                        <input type="password" name="password" class="form-control" placeholder="Enter Password" required/>
                    </div>
                    <div class="form-group">
                        <select name="role" class="form-control" required>
                            <option value="admin">Admin</option>
                            <option value="user">User</option>
                        </select>
                    </div>
                    <div class="text-center mt-3">
                    <button type="submit" class="btn btn-primary btn-block">Register</button>
                    </div>
                </form>
                <div class="text-center mt-3">
                    <a href="login.jsp" class="btn btn-secondary">Back to Login</a>
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
