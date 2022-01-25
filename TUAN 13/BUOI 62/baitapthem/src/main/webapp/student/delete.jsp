<%--
  Created by IntelliJ IDEA.
  User: LTC
  Date: 1/25/2022
  Time: 1:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Delete Student</title>
</head>
<body>
<h1>Delete Student</h1>
<p>
    <a href="${pageContext.request.contextPath}/students">Back to Student list</a>
</p>

<form method="post">
    <h3>Are you sure?</h3>
    <fieldset>
        <legend>Customer information</legend>
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
                <td>Avg Point: </td>
                <td>${requestScope["student"].getAvgPoint()}</td>
            </tr>
            <tr>
                <td><input type="submit" value="Delete student"></td>
                <td><a href="${pageContext.request.contextPath}/students">Back to customer list</a></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
