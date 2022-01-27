<%--
  Created by IntelliJ IDEA.
  User: LTC
  Date: 1/26/2022
  Time: 2:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>City Detail</title>
</head>
<body>
<h1>Detail City</h1>
<p>
   <button> <a href="${pageContext.request.contextPath}/cities">Back to Cities List</a></button>
</p>
<table>
    <tr>
        <td>Name: </td>
        <td>${requestScope["city"].getName()}</td>
    </tr>
    <tr>
        <td>Area: </td>
        <td>${requestScope["city"].getArea()}</td>
    </tr>
    <tr>
        <td>Population: </td>
        <td>${requestScope["city"].getPopulation()}</td>
    </tr>
    <tr>
        <td>GDP: </td>
        <td>${requestScope["city"].getGdp()}</td>
    </tr>
    <tr>
        <td>Country: </td>
        <td>${requestScope["city"].getCountry()}</td>
    </tr>

</table>

</body>
</html>
