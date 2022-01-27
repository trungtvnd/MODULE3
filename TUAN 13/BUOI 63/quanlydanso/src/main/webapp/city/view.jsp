<%--
  Created by IntelliJ IDEA.
  User: LTC
  Date: 1/26/2022
  Time: 11:47 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <style>
        .getLink{
            text-decoration: none;
        }
    </style>
</head>
<body>
<h1>Information Of Cities</h1>
<c:if test='${requestScope["cities"].isEmpty()}'>
    <p style="color: red">NOT FOUND</p>
</c:if>
<p><button><a class="getLink" href="${pageContext.request.contextPath}/cities?action=create">Create new city</a></button></p>
<c:if test='${requestScope["cities"].isEmpty()==false}'>
<table>
    <tr>
        <th>ID</th>
        <th>NAME</th>
        <th>AREA</th>
        <th>POPULATION</th>
        <th>GDP</th>
        <th>COUNTRY</th>
        <th>EDIT</th>
        <th>DELETE</th>
    </tr>
    <c:forEach items='${requestScope["cities"]}' var="city">
        <tr>
            <td>${city.getId()}</td>
            <td ><a class="getLink" href="${pageContext.request.contextPath}/cities?action=view&id=${city.getId()}">${city.getName()}</a></td>
            <td>${city.getArea()}</td>
            <td  <c:if test="${city.getPopulation() > 10000}"> style="color: red"</c:if>>${city.getPopulation()}</td>
            <td <c:if test="${city.getGdp() > 1000}"> style="color: blue"</c:if>>${city.getGdp()} </td>
            <td>${city.getCountry()}</td>
            <td class="getLink"><button><a class="getLink" href="${pageContext.request.contextPath}/cities?action=edit&id=${city.getId()}">Edit</a></button></td>
            <td class="getLink"><button><a class="getLink" href="${pageContext.request.contextPath}/cities?action=delete&id=${city.getId()}">Delete</a></button></td>
        </tr>
    </c:forEach>
</table>
</c:if>



</body>
</html>
