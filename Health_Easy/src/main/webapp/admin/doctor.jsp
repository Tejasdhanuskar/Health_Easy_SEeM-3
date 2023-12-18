
<%@page import="com.entity.Specialist"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.SpecialistDao"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.entity.Doctor"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="../component/all_css.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<div class="container-fluid p-3">
		<div class="row">

			<div class="col-md-5 offset-md-4">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Add Doctor</p>
						<c:if test="${not empty errorMsg}">
							<p class="fs-3 text-center text-danger">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						<c:if test="${not empty succMsg}">
							<div class="fs-3 text-center text-success" role="alert">${succMsg}</div>
							<c:remove var="succMsg" scope="session" />
						</c:if>
						
						<form id="registrationForm" action="../addDoctor" method="post" onsubmit="return validateForm()">
							<div class="mb-3">
								<label class="form-label">Full Name</label> <input type="text"
									required name="fullname" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">DOB</label> <input type="date"
									required name="dob" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Qualification</label> <input required
									name="qualification" type="text" class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-label">Specialist</label> <select name="spec"
									required class="form-control">
									<option>--select--</option>

									<%
									SpecialistDao dao = new SpecialistDao(DBConnect.getConn());
									List<Specialist> list = dao.getAllSpecialist();
									for (Specialist s : list) {
									%>
									<option><%=s.getSpecialistName()%></option>
									<%
									}
									%>


								</select>
						
						  
        <div class="mb-3">
            <label class="form-label">Email</label>
            <input type="text" required name="email" class="form-control" id="email">
            <div id="emailError" style="color: red;"></div>
        </div>

        <div class="mb-3">
            <label class="form-label">Mob No</label>
            <input type="text" required name="mobno" class="form-control" id="mobno">
            <div id="mobnoError" style="color: red;"></div>
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

            // Validate Mobile Number
           var mobno = document.getElementById('mobno').value;
var mobnoRegex = /^[6-9]\d{9}$/;

if (!mobnoRegex.test(mobno)) {
    document.getElementById('mobnoError').innerHTML = 'Mobile number should be a 10-digit number starting with a digit between 6 and 9';
    return false;
} else {
    document.getElementById('mobnoError').innerHTML = '';
}

            // Validate Password
            var password = document.getElementById('password').value;
            var passwordRegex = /^(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
            if (!passwordRegex.test(password)) {
                document.getElementById('passwordError').innerHTML = 'Password must contain at least one uppercase letter, one number, one special symbol, and be at least 8 characters long';
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
