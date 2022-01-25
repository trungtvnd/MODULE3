<%--
  Created by IntelliJ IDEA.
  User: LTC
  Date: 1/25/2022
  Time: 1:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Student List</title>
</head>
<body>
<p>
    <c:if test='${requestScope["message"] != null}'>
        <span class="message">${requestScope["message"]}</span>
    </c:if>
</p>
<p>
    <a href="${pageContext.request.contextPath}/students">Back to student list</a>
</p>

<form method="post">
    <fieldset>
        <legend>Student information</legend>
        <table>
            <tr>
                <td>ID: </td>
                <td><label for="id"></label><input type="text" name="id" id="id"></td>
            </tr>

            <tr>
                <td>Name: </td>
                <td><label for="name"></label><input type="text" name="name" id="name"></td>
            </tr>
            <tr>
                <td>Age: </td>
                <td><label for="age"></label><input type="text" name="age" id="age"></td>
            </tr>
            <tr>
                <td>Address: </td>
                <td><label for="address"></label><input type="text" name="address" id="address"></td>
            </tr>
            <tr>
                <td>Avg Point: </td>
                <td><label for="avgPoint"></label><input type="text" name="avgPoint" id="avgPoint"></td>
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
