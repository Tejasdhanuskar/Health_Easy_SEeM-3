<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
	<%@include file="component/all_css.jsp" %>
 
<style type="text/css">
	.paint-card{ 
		box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
	}
</style>
</head>
<body>
	<%@include file="component/navbar.jsp" %>
	
	<div class="container p-5">
		<div class="row">
			<div class="col-md-4 offset-md-4"> 
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-4 text-center">User Register</p>
						
						<c:if test="${not empty sucMsg}">
						<p class="text-center text-success fs-3">${sucMsg }</p>
						<c:remove var="sucMsg" scope="session"/>
						</c:if>
						
						<c:if test="${not empty errorMsg}">
						<p class="text-center text-danger fs-3">${errorMsg }</p>
						<c:remove var="errorMsg" scope="session"/>
						</c:if>
						
							
						



    <form id="registrationForm" action="user_register" method="post" onsubmit="return validateForm()">
        <div class="mb-3">
            <label class="form-label">Full Name</label>
            <input required name="fullname" type="text" class="form-control">
        </div>
        
        <div class="mb-3">
            <label class="form-label">Email address</label>
            <input required name="email" type="email" class="form-control" id="email">
            <div id="emailError" style="color: red;"></div>
        </div>
        
        <div class="mb-3">
            <label class="form-label">Password</label>
            <input required name="password" type="password" class="form-control" id="password">
            <div id="passwordError" style="color: red;"></div>
        </div>
        
        <button type="submit" class="btn bg-success text-white col-md-12">Register</button>
    </form>

    <script>
        function validateForm() {
            // Validate Email
            var email = document.getElementById('email').value;
            var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!emailRegex.test(email)) {
                document.getElementById('emailError').innerHTML = 'Invalid email address';
                return false;
            } else {
                document.getElementById('emailError').innerHTML = '';
            }

            // Validate Password
            var password = document.getElementById('password').value;
            var passwordRegex = /^(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
            if (!passwordRegex.test(password)) {
                document.getElementById('passwordError').innerHTML = 'Password must contain at least one Uppercase,One Number,special symbol, and min length 8 characters';
                return false;
            } else {
                document.getElementById('passwordError').innerHTML = '';
            }

            return true; // Form submission will proceed
        }
    </script>


						
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>