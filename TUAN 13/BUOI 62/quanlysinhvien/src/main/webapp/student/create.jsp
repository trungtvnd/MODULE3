<%--
  Created by IntelliJ IDEA.
  User: LTC
  Date: 1/26/2022
  Time: 11:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>
    </title>
    <p><button><a href="/students">Back to student list</a></button></p>

    <form action="/students" method="post">

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
                <td>Age: </td>
                <td><label><input type="text" name="age"></label></td>
            </tr>
            <tr>
                <td colspan="2">
                    <label><input type="submit" value="Create"></label>
                </td>
            </tr>
        </table>
    </form>
</head>
<body>
</body>
</html>
