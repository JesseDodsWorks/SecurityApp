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
        <h1 class="text-center">Welcome ${user.userName}</h1>
        <hr>
       		<ol style="list-style-type:none;" class="ps-0" >
	            <li class="d-flex justify-content-center m-1 "> <a class="btn btn-secondary w-75" href="/propertycenter">Properties</a> </li>
	            <li class="d-flex justify-content-center m-1 "> <a class="btn btn-secondary w-75" href="/reportcenter">Report Center</a> </li>
	            <li class="d-flex justify-content-center m-1 "> <a class="btn btn-secondary w-75" href="/archive">Archive</a> </li>
	    
	            <li class="d-flex justify-content-center mt-3"> <a class="btn btn-secondary" href="/logout">Logout</a> </li>
            </ol>
        </div>
    </div>
</body>
</html>