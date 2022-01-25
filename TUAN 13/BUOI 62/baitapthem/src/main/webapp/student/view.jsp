<%--
  Created by IntelliJ IDEA.
  User: LTC
  Date: 1/25/2022
  Time: 7:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>View Student</title>
</head>
<body>
<h1>Student Detail</h1>
<p>
    <a href="/students">Back to Student List</a>
</p>
<table>
    <tr>
        <td>Name: </td>
        <td>${requestScope["student"].getName()}</td>
    </tr>
    <tr>
        <td>Age: </td>
        <td>${requestScope["student"].getAge()}</td>
    </tr>
    <tr>
        <td>Address: </td>
        <td>${requestScope["student"].getAddress()}</td>
    </tr>
    <tr>
        <td>AVG Point: </td>
        <td>${requestScope["student"].getAvgPoint()}</td>
    </tr>
</table>
</body>
</html>
