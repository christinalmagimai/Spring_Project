<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<title>Edit Customer</title>
</head>
<body>

<center>
<h3>Update User Details</h3>
	<div align="center" class="table-responsive" class="container">

		<form:form action="Update" modelAttribute="user" name="Form1">
			<table class="table table-bordered table-sm"
				 class="table">
<thead>

				<tr>
					<th>Id</th>
					<th>Username</th>
					<th>Phoneno</th>
					<th>City</th>

					<th>Edit</th>
					<th>Delete</th>

				</tr>
				</thead>
				<tbody>
				<c:forEach var="list" items="${list}">
					<c:if test="${list.id==user.id}">
						<tr>
							<td>${list.id}</td>
							<form:hidden path="id" value="${list.id}" />
							<td><form:input path="userName" value="${list.userName}" /></td>
							<td><form:input path="phoneNo" value="${list.phoneNo}" /></td>
							<td><form:input path="city" value="${list.city}" /></td>
							<td><a onclick="Form1.submit()" href="#" class="btn btn-default btn-sm"><span class="glyphicon glyphicon-pencil"></span>Edit</a><br></td>
							<!-- <td><input type="submit" value="Update" /></td>  -->
							<td><a href="Delete?id=${user.id}" class="btn btn-default btn-sm"><span class="glyphicon glyphicon-remove"></span>Delete</a><br></td>
						</tr>
					</c:if>
					<c:if test="${list.id != user.id}">
						<tr>
							<td>${list.id}</td>
							<td>${list.userName}</td>
							<td>${list.phoneNo}</td>
							<td>${list.city}</td>
							<td><a href="Edit?id=${list.id}">Edit</a></td>
						</tr>
					</c:if>
				</c:forEach>
				 </tbody>
			</table>
		</form:form>
	</div>
	</center>
</body>
</html>
