<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.DoctorDao"%>
<%
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@page import="com.entity.Doctor"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Appointment</title>
<%@include file="component/all_css.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 8px 0 rgba(0, 0, 0, 0.3);
}


</style>
</head>
<body>
	<%@include file="component/navbar.jsp"%>

	<div class="container-fulid backImg p-5">
		<p class="text-center fs-2 text-white"></p>
	</div>
	<div class="container p-3">
		<div class="row">
			<div class="col-md-6 p-5">
				<img alt="" src="img/doct.jpg">
			</div>

			<div class="col-md-6">
				<div class="card paint-card">
					<div class="card-body">
						<p class="text-center fs-3">User Appointment</p>
						<c:if test="${not empty errorMsg}">
							<p class="fs-4 text-center text-danger">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						<c:if test="${not empty succMsg}">
							<p class=" fs-4 text-center text-success">${succMsg}</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>
						
						<form class="row g-3" id="registrationForm" action="appAppointment" method="post" onsubmit="return validateForm()">

							<input type="hidden" name="userid" value="${userObj.id }">

							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Full Name</label> <input
									required type="text" class="form-control" name="fullname">
							</div>

							<div class="col-md-6">
								<label>Gender</label> <select class="form-control" name="gender"
									required>
									<option value="male">Male</option>
									<option value="female">Female</option>
								</select>
							</div>

							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Age</label> <input
									required type="number" class="form-control" name="age">
							</div>

							 <div class="col-md-6">
            <label for="inputEmail4" class="form-label">Appointment Date</label>
            <input type="date" class="form-control" required name="appoint_date" id="appoint_date">
            <div id="appointDateError" style="color: red;"></div>
        </div>

							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Email</label> <input
									required type="email" class="form-control" name="email">
							</div>

			 <div class="col-md-6">
            <label for="inputEmail4" class="form-label">Phone No</label>
            <input maxlength="10" required type="text" class="form-control" name="phno" id="phno">
            <div id="phnoError" style="color: red;"></div>
        </div>


							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Diseases</label> <input
									required type="text" class="form-control" name="diseases">
							</div>

							<div class="col-md-6">
								<label for="inputPassword4" class="form-label">Doctor</label> <select
									required class="form-control" name="doct">
									<option value="">--select--</option>

									<%
									DoctorDao dao = new DoctorDao(DBConnect.getConn());
									List<Doctor> list = dao.getAllDoctor();
									for (Doctor d : list) {
									%>
									<option value="<%=d.getId()%>"><%=d.getFullName()%> (<%=d.getSpecialist()%>)
									</option>
									<%
									}
									%>




								</select>
							</div>

							<div class="col-md-12">
								<label>Full Address</label>
								<textarea required name="address" class="form-control" rows="3"
									cols=""></textarea>
							</div>

							<c:if test="${empty userObj }">
								<a href="user_login.jsp" class="col-md-6 offset-md-3 btn btn-success">Submit</a>
							</c:if>

							<c:if test="${not empty userObj }">
								<button class="col-md-6 offset-md-3 btn btn-success">Submit</button>
							</c:if>
							<script>
							 function validateForm() {
					                // ... (Your existing validation code) ...

					                // Validate Appointment Date
					                var appointDateInput = document.getElementById('appoint_date');
					                var appointDate = new Date(appointDateInput.value);
					                var currentDate = new Date();

					                if (appointDate < currentDate) {
					                    document.getElementById('appointDateError').innerHTML = 'Please select today\'s date or a future date';
					                    return false;
					                } else {
					                    document.getElementById('appointDateError').innerHTML = '';
					                }

					                return true; // Form submission will proceed
					            }
            
            function validateForm() {
                // ... (Your existing validation code) ...

                // Validate Phone Number
                var phnoInput = document.getElementById('phno');
                var phnoValue = phnoInput.value;

                // Check if the input contains only digits
                if (!/^\d+$/.test(phnoValue)) {
                    document.getElementById('phnoError').innerHTML = 'Phone number should contain only digits';
                    return false;
                }

                // Remove non-numeric characters to count digits
             var phnoDigits = phnoValue.replace(/\D/g, '');

if (phnoDigits.length !== 10 || !/^[6-9]/.test(phnoDigits)) {
    document.getElementById('phnoError').innerHTML = 'Phone number should be a 10-digit number starting with a digit between 6-9';
    return false;
} else {
    document.getElementById('phnoError').innerHTML = '';
}

                return true; // Form submission will proceed
            }
        </script>
						</form>
					</div>
				</div>
			</div>
		</div>

	</div>
	<%@include file="component/footer.jsp"%>

</body>
</html>
