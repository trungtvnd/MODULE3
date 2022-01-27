<%--
  Created by IntelliJ IDEA.
  User: LTC
  Date: 1/26/2022
  Time: 11:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<a href=""></a>
<p><button><a href="${pageContext.request.contextPath}/students?action=create">Create new city</a></button></p>
<table>
    <tr>
        <th>ID</th>
        <th>NAME</th>
        <th>age</th>
        <th>Edit</th>
        <th>Delete</th>

    </tr>
    <c:forEach items='${requestScope["students"]}' var="student">
        <tr>
            <td>${student.getId()}</td>
            <td>${student.getName()}</td>
            <td>${student.getAge()}</td>
            <td class="getLink"><button><a href="${pageContext.request.contextPath}/students?action=edit&id=${student.getId()}">Edit</a></button></td>
            <td class="getLink"><button><a href="${pageContext.request.contextPath}/students?action=delete&id=${student.getId()}">Delete</a></button></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
