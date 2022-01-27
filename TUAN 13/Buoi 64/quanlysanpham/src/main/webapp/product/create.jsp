<%--
  Created by IntelliJ IDEA.
  User: LTC
  Date: 1/25/2022
  Time: 9:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Create Product</title>
</head>
<body>
<h1>Create Product</h1>
<p>
    <button><a href="${pageContext.request.contextPath}/products">Back Product list</a></button>

</p>
<form action="" method="post">
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
            <td>Price: </td>
            <td><label><input type="text" name="price"></label></td>
        </tr>
        <tr>
            <td>Describe: </td>
            <td><label><input type="text" name="describe"></label></td>
        </tr>
        <tr>
            <td>Manufacturer: </td>
            <td><label><input type="text" name="manufacturer"></label></td>
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
