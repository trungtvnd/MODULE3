<%--
  Created by IntelliJ IDEA.
  User: LTC
  Date: 1/26/2022
  Time: 11:47 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete City</title>
</head>
<body>
<h1>DELETE CITY</h1>
<p>
    <button><a href="${pageContext.request.contextPath}/cities">Back Cities List</a></button>
</p>
<p>Are you sure to delete this record?</p>

<form action="" method="post">
    <table>
        <tr>
            <td>Name: </td>
            <td><label><input type="text" name="name" value='${requestScope["cities"].getName()}'></label></td>
        </tr>
        <tr>
            <td>Area: </td>
            <td><label><input type="text" name="area" value='${requestScope["cities"].getArea()}'></label></td>
        </tr>
        <tr>
            <td>Population: </td>
            <td><label><input type="text" name="population" value='${requestScope["cities"].getPopulation()}'></label></td>
        </tr>
        <tr>
            <td>GDP: </td>
            <td><label><input type="text" name="gdp" value='${requestScope["cities"].getGdp()}'></label></td>
        </tr>
        <tr>
            <td>Country: </td>
            <td><label><input type="text" name="country" value='${requestScope["cities"].getCountry()}'></label></td>
        </tr>
        <tr>
            <td colspan="2"><label><input type="submit" value="Delete"></label></td>
        </tr>
    </table>

</form>
</body>
</html>
