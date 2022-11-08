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
	<div class="border d-flex justify-content-center mt-5">
        <div>
            <div class="d-flex justify-content-between">
                <h3>Archive</h3>
                <a class="pt-2" href="/archive">return</a>
            </div>
            <div class="border">
            	<p>Location: ${reports.property.name} By: ${reports.user.userName}</p>
           		
                <p>Incident: ${reports.incident }</p>
                
                <p>Start Time: ${reports.startTime }</p>
                
                <p>End Time: ${reports.endTime }</p>
                
                <p>Description: ${reports.description }</p>
        	</div>
        </div>
    </div>
</body>
</html>