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
    <title>Title</title>
</head>
<body>
<p>
    <button><a href="${pageContext.request.contextPath}/products">Back Product list</a></button>
</p>
<p>Are you sure to delete this record?</p>

<form action="" method="post">
    <table>
        <tr>
            <td>Name: </td>
            <td><label><input type="text" name="name" value='${requestScope["product"].getName()}'></label></td>
        </tr>
        <tr>
            <td>Price: </td>
            <td><label><input type="text" name="price" value='${requestScope["product"].getPrice()}'></label></td>
        </tr>
        <tr>
            <td>Describe: </td>
            <td><label><input type="text" name="describe" value='${requestScope["product"].getDescribe()}'></label></td>
        </tr>
        <tr>
            <td>Manufacturer: </td>
            <td><label><input type="text" name="manufacturer" value='${requestScope["product"].getManufacturer()}'></label></td>
        </tr>
        <tr>
            <td colspan="2"><label><input type="submit" value="Delete"></label></td>
        </tr>
    </table>

</form>
</body>
</html>
