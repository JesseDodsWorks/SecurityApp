<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
    <title>Document</title>
</head>
<body>
    <div class="border d-flex justify-content-center mt-5">
        <div>
            <div class="d-flex justify-content-between">
                <h3>Property Center</h3>
                <a class="pt-2" href="/propertycenter">return</a>
            </div>
            <form:form action="/propertycenter/create" class="form-control" modelAttribute="property">
            
            	<div class="d-flex justify-content-around">
  					<form:errors class="text-center" path="name" style="color: red" />
                </div>
            
                <div class="m-3 d-flex justify-content-center">
                    <label class="me-3" for="">name:  </label>
                    <form:input path="name" class="form-controller" type="text"/>
                </div>
                
                <div class="d-flex justify-content-around">
                	<form:errors class="text-center" path="contacts" style="color: red" />
                </div>
                
                <div class="m-3 d-flex justify-content-center">
                    <label class="me-3" for="">Contacts:</label>
                    <form:textarea path="contacts" class="form-controller" rows="4" cols="50" type="text"></form:textarea>           
                </div>
                
                <div class="d-flex justify-content-around">
                	<form:errors class="text-center" path="description" style="color: red" />
                </div>
                <div class="m-3 d-flex justify-content-center">
                    <label class="me-3" for="">Duties:</label>
                    <form:textarea path="description" class="form-controller" rows="4" cols="50" type="text"></form:textarea>
                </div>

                <div class="m-3 d-flex justify-content-center">
               		<button class="btn btn-secondary " type="submit">Submit</button>
                </div>
            </form:form>

        </div>
    </div>
</body>
</html>