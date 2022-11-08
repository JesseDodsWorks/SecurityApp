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
                <h3>Report Center</h3>
                <a class="pt-2" href="/reportcenter">return</a>
            </div>
            <div class="border">
            	<form:form action="/reportcenter/${id}/update" class="form-control" modelAttribute="report">
            	
            		<input type="hidden" name="_method" value="put" />

                <div class="row">
            		<form:errors path="property" style="color: red" class="col text-center"/>
            		<form:errors path="incident" style="color: red" class="col text-center"/>
            	</div>
            	<div class="d-flex justify-content-around mb-3 mt-1">
            		
                    <form:select path="property" id="property" class="w-50">
                    
                        <option value="${ report.property.id }" hidden>${ report.property.name }</option>
                       	<c:forEach var="props" items="${property}">
                        	<option value="${props.id}">${ props.name }</option>
                        </c:forEach>
                        
                    </form:select>
                    
                    <form:select path="incident" id="incident" class="w-50">
                    
                        <<option value="${ report.incident }" hidden>${ report.incident }</option>
                        <option value="Alarm">Alarm</option>
                        <option value="BreakIn">BreakIn</option>
                        <option value="Disturbance">Disturbance</option>
                        <option value="Party">Party</option>
                        
                    </form:select>
				</div>
                    

                <div class="row">
            		<form:errors path="startTime" style="color: red" class="col text-center"/>
            		<form:errors path="endTime" style="color: red" class="col text-center"/>
            	</div>
                <div class="d-flex justify-content-around mb-3">
                   	<div>
                        <label for="">Start Time:</label>
                        <form:input path="startTime" type="time"/>
					</div>
					<div>
                        <label for="">End Time:</label>
                        <form:input path="endTime" type="time"/>
                    </div>
                </div>  
                    
                <div class="row">
               		<form:errors path="description" style="color: red" class="col text-center mt-3"/>
               	</div>
               	<div class="d-flex justify-content-around">
                    <label class="" for="">Description:</label>
                    <form:textarea path="description" class="" rows="4" cols="50"></form:textarea>
                </div>
                    
                <div class="m-3 d-flex justify-content-center">
          			<button class="btn btn-secondary " type="submit">Submit</button>
           		</div>
               		
                </form:form>
            </div>
        </div>
    </div>
</body>
</html>