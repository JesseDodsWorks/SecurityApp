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
            <div class=" d-flex justify-content-between ">
                <h3 class="me-3">Property Center</h3>
                <a class="pt-2" href="/home">return</a>
            </div>
            <div>
            	<select class="w-100 text-center" onchange="populatePropInfo(value)" id="property">
                 
	                <option  value="" selected>Select Property</option>
	               	<c:forEach var="props" items="${property}">
	                	<option value="${props.id}">${ props.name }</option>
	                </c:forEach>
                        
                </select>
                <div class="d-flex d-inline justify-content-center">
                	<p class=" me-2"> add property?</p>
                	<a class="" href="/propertycenter/new">create</a>
                </div>
				
                <hr>
                
                <div >
                	<p id="label01" class="mb-0"></p>
                	<p id="contacts" class="mb-0 ms-3"></p>
                	<p id="label02" class="mb-0"></p>
                	<p id="description" class="mb-0 ms-3"></p>
                	<div class="d-flex d-inline justify-content-center">
	                	<p id="label03" class="me-2 fw-lighter"></p>
	                	<a id="editTag" class="fw-lighter" href=""></a>
                	</div>
                	
                	
                	<!-- For Deleting Property - Currently stops delete when from has reports REWORK NEEDED -->
               		<!-- <form  id="formTag" action="" method="post">
					    <input type="hidden" name="_method" value="delete"/>
					    <input class="btn" id="deleteTag" type="submit" value=""/>
					</form> -->
                	
                	
                	
                </div>
            </div>
        </div>
    </div>
    <script>
    	var prop = [];
    	<c:forEach var="props" items="${property}" varStatus="loop">
    		prop[${loop.index}] = {"id": "${props.id}", "name": "${props.name}", "contacts": "${props.contacts}","description": "${props.description}" }
    	</c:forEach>
    		
    	function populatePropInfo(value){
    		
        	prop.forEach((p)=> {

        		if(p.id == value) {
        			document.getElementById("label01").innerHTML = "contacts:"
        			document.getElementById("contacts").innerHTML = p.contacts;
        			document.getElementById("label02").innerHTML = "description:"
        			document.getElementById("description").innerHTML = p.description;
        			document.getElementById("label02").innerHTML = "description:"
       				document.getElementById("label03").innerHTML = "update information?"
        			document.getElementById("editTag").href = "/propertycenter/" + p.id +"/edit";
        			document.getElementById("editTag").innerHTML = "edit";
        			
        			<!-- For Deleting Property - Currently stops delete when from has reports REWORK NEEDED -->
        			<!-- document.getElementById("formTag").action = "/propertycenter/" + p.id +"/delete"; -->
        			<!-- document.getElementById("deleteTag").value = "delete"; -->
        			
        		}
        		
        	})
        	

        	
    		
    	}
    	
    </script>
</body>
</html>