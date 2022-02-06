<%--
  Created by IntelliJ IDEA.
  User: LTC
  Date: 2/6/2022
  Time: 2:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>DISPLAY</title>
</head>
<body>
<h1>USER MANAGEMENT</h1>
<h2><a href="${pageContext.request.contextPath}/users?action=create">ADD NEW USER</a></h2>

<div align="center">
    <table>
        <caption>List Of Users</caption>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Country</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="user" items="${listUser}">
            <tr>
                <td><c:out value="${user.id}"/></td>
                <td><c:out value="${user.name}"/></td>
                <td><c:out value="${user.email}"/></td>
                <td><c:out value="${user.country}"/></td>
                <td>
                    <a href="${pageContext.request.contextPath}/users?action=edit&id=${user.id}">Edit</a>
                    <a href="${pageContext.request.contextPath}/users?action=delete&id=${user.id}">Delete</a>
                </td>
            </tr>
        </c:forEach>

    </table>

</div>
</body>
</html>
