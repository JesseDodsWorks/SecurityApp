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
                <a class="pt-2" href="/home">return</a>
            </div>
            <div class="border">
                <table class="table table-striped">
                    <thead>
                      <tr>
                        <th>Property</th>
                        <th>Incident</th>
                        <th>Start Time</th>
                        <th>actions</th>
                      </tr>
                    </thead>
                    <tbody>

					<c:forEach var="report" items="${reports}">
	                <tr>

                        <td>${ report.property.name }</td>
                        <td>${ report.incident }</td>
                        <td>${ report.startTime }</td>
                        <td class="d-flex"> 
                        <a class="btn btn-secondary me-3" href="/reportcenter/${report.id}/edit">edit</a>    

                        <form  action="/reportcenter/${report.id}/delete" method="post">
						    <input type="hidden" name="_method" value="delete">
						    <input class="btn btn-secondary" type="submit" value="Delete">
						</form>
                        </td>

	                </tr>
					</c:forEach>
                    </tbody>
                  </table>
                  
                  <div class="d-flex justify-content-center">
                    	<a class="btn btn-secondary mt-3 mb-2 px-5" href="/reportcenter/new" type="submit">Create Report</a>
                  </div>
            </div>
        </div>
    </div>
</body>
</html>