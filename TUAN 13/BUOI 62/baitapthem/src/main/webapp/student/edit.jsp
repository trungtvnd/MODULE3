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
    <title>EDIT STUDENT</title>
</head>
<body>
<h1>Edit Student</h1>
<p>
    <c:if test='${requestScope["message"]!=null}'>
        <span class="message">${requestScope["message"]}</span>
    </c:if>
</p>

<p>
    <a href="${pageContext.request.contextPath}/students">Back to Student list</a>
</p>
<form action="" method="post">
    <fieldset>
        <legend>Customer information</legend>
        <table>
            <tr>
                <td>Name: </td>
                <td><label for="name"></label><input type="text" name="name" id="name" value="${requestScope["students"].getName()}"></td>
            </tr>
            <tr>
                <td>Email: </td>
                <td><label for="age"></label><input type="text" name="age" id="age" value="${requestScope["students"].getAge()}"></td>
            </tr>
            <tr>
                <td>Address: </td>
                <td><label for="address"></label><input type="text" name="address" id="address" value="${requestScope["students"].getAddress()}"></td>
            </tr>
            <tr>
                <td>Address: </td>
                <td><label for="avgPoint"></label><input type="text" name="avgPoint" id="avgPoint" value="${requestScope["students"].getAvgPoint()}"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Update Student"></td>
            </tr>
        </table>
    </fieldset>
</form>

</body>
</html>
