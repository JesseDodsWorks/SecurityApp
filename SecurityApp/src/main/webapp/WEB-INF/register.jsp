<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class="container border d-flex justify-content-center mt-5">
        <div>
            <h1 class="text-center">Security Co.</h1>
            <form:form action="/register" class="form-control" modelAttribute="newUser">
                    <label class="display d-table" for=""> Name: </label>
                    <form:errors path="userName" style="color: red" />
                    <form:input path="userName" class="display d-table"  type="text" />
                    
                    <label class="display d-table"  for=""> Email: </label>
                    <form:errors path="email" style="color: red" />
                    <form:input path="email" class="display d-table"  type="email" />
                    
                    <label class="display d-table"  for="">Password: </label>
                    <form:errors path="password" style="color: red" />
                    <form:input path="password" class="display d-table"  type="password" />
                    
                    <label class="display d-table"  for=""> Confirm Password: </label>
                    <form:errors path="confirm" style="color: red" />
                    <form:input path="confirm" class="display d-table"  type="password" />
                    
                    <div class="d-flex justify-content-center">
                    	<button class="btn btn-secondary mt-3 mb-2 px-5" type="submit">Log In</button>
                    </div>
                    
                </form:form>
        </div>
    </div>
</body>
</html>