<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-lg navbar-light bg-light mb-4">
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" href="<%= request.getContextPath() %>/menu"><i class="fa-solid fa-bars"></i> Menu</a>
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
        <ul class="navbar-nav ml-auto">
            <%
                String loggedInUser = (String) session.getAttribute("email");
                if (loggedInUser != null) {
            %>
            <li class="nav-item">
                <a class="btn btn-danger" href="<%= request.getContextPath() %>/logout">Logout</a>
            </li>
            <% } else { %>
            <li class="nav-item">
                <a class="btn btn-primary" href="login.jsp">Login</a>
            </li>
            <% } %>
        </ul>
    </div>
</nav>
