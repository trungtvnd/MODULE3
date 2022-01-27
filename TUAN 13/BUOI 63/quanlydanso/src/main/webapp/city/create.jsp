<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: LTC
  Date: 1/26/2022
  Time: 11:47 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>CREATE CITY</title>
</head>
<body>
<h1>CREATE CITY</h1>
<p>
    <button><a href="${pageContext.request.contextPath}/cities">Back to Cities List</a></button>
</p>

<form action="/cities?action=createPost" method="post">

    <table>
        <tr>
            <td>ID: </td>
            <td><label><input type="text" name="id"></label></td>
        </tr>
        <tr>
            <td>Name: </td>
            <td><label><input type="text" name="name"></label></td>
        </tr>
        <tr>
            <td>Area: </td>
            <td><label><input type="text" name="area"></label></td>
        </tr>
        <tr>
            <td>Population: </td>
            <td><label><input type="text" name="population"></label></td>
        </tr>
        <tr>
            <td>GDP: </td>
            <td><label><input type="text" name="gdp"></label></td>
        </tr>
        <tr>
            <td>Country: </td>
            <td><label><select name="country" id="country">
                <c:forEach items="${country}" var="country">
                    <option value="${country}">${country}</option>
                </c:forEach>

            </select></label></td>
        </tr>
        <tr>
            <td colspan="2">
                <label><input type="submit" value="Create"></label>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
