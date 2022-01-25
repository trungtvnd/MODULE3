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
    <title>CUSTOMER LIST</title>
    <style>
        img {
            width: 120px;
            height: 160px;
        }
    </style>
</head>
<body>
<h1>CUSTOMER LIST</h1>
<p>
    <a href="${pageContext.request.contextPath}/customers?action=create">Create new customer</a>
</p>

<table>
    <tr>
        <td>ID</td>
        <td>Name</td>
        <td>Email</td>
        <td>Address</td>
        <td>Image</td>
        <td>Edit</td>
        <td>Delete</td>
    </tr>
    <c:forEach items='${requestScope["customers"]}' var="customer">
        <tr>
            <td>${customer.getId()}</td>
            <td><a href="${pageContext.request.contextPath}/customers?action=view&id=${customer.getId()}">${customer.getName()}</a></td>
            <td>${customer.getEmail()}</td>
            <td>${customer.getAddress()}</td>
            <td><img src="${customer.getImage()}" alt=""></td>
            <td><a href="${pageContext.request.contextPath}/customers?action=edit&id=${customer.getId()}">Edit</a></td>
            <td><a href="${pageContext.request.contextPath}/customers?action=delete&id=${customer.getId()}">Delete</a>
            </td>
        </tr>

    </c:forEach>

</table>

</body>
</html>
