<%--
  Created by IntelliJ IDEA.
  User: LTC
  Date: 1/24/2022
  Time: 11:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>CREATE NEW CUSTOMER</title>
    <style>
        .message{
            color: #000;
        }
    </style>
</head>
<body>
<h1>CREATE NEW CUSTOMER</h1>
<p>
    <c:if test='${requestScope["message"]!=null}'>
        <span class="message">${requestScope["message"]}</span>
    </c:if>
</p>
<p>
    <a href="${pageContext.request.contextPath}/customers">Back to customer List</a>
</p>

<form action="${pageContext.request.contextPath}/customers" method="post">
    <fieldset>
        <legend>CUSTOMER INFORMATION</legend>
        <table>
            <tr>
                <td>Name: </td>
                <td><label for="name"></label><input type="text" name="name" id="name"></td>
            </tr>
            <tr>
                <td>Email: </td>
                <td><label for="email"></label><input type="text" name="email" id="email"></td>
            </tr>
            <tr>
                <td>Address: </td>
                <td><label for="address"></label><input type="text" name="address" id="address"></td>
            </tr>
            <tr>
                <td>Image</td>
                <td><label ><input type="text" name="image" id="image"></label></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Create customer"></td>
            </tr>
        </table>

    </fieldset>


</form>

</body>
</html>
