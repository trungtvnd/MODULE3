<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: LTC
  Date: 1/24/2022
  Time: 11:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>STUDENT LIST</title>
    <style>
        img {
            width: 120px;
            height: 160px;
        }
    </style>
</head>
<body>
<h1>STUDENT LIST</h1>
<p>
    <a href="${pageContext.request.contextPath}/students?action=create">Create new Student</a>
</p>

<table>
    <tr>
        <td>ID</td>
        <td>Name</td>
        <td>Age</td>
        <td>Address</td>
        <td>AVG POINT</td>
        <td>Edit</td>
        <td>Delete</td>
    </tr>
    <c:forEach items='${requestScope["students"]}' var="student">
        <tr>
            <td>${student.getId()}</td>
            <td><a href="${pageContext.request.contextPath}/students?action=view&id=${student.getId()}">${student.getName()}</a></td>
            <td>${student.getAge()}</td>
            <td>${student.getAddress()}</td>
            <td>${student.getAvgPoint()}</td>
            <td><a href="${pageContext.request.contextPath}/students?action=edit&id=${student.getId()}">Edit</a></td>
            <td><a href="${pageContext.request.contextPath}/students?action=delete&id=${student.getId()}">Delete</a>
            </td>
        </tr>

    </c:forEach>

</table>

</body>
</html>
