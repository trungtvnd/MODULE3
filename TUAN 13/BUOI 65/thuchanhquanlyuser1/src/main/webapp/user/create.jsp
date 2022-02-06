<%--
  Created by IntelliJ IDEA.
  User: LTC
  Date: 2/6/2022
  Time: 2:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div style="text-align: center;">
    <h1>User Management</h1>
    <h2>
        <a href="/users?action=users">List All Users</a>
    </h2>
</div>
<div style="text-align: center" >
    <form method="post">
        <table>
            <caption>
                <h2>Add New User</h2>
            </caption>
            <tr>
                <th>User Name:</th>
                <td>
                    <label for="name"></label><input type="text" name="name" id="name" size="45"/>
                </td>
            </tr>
            <tr>
                <th>User Email:</th>
                <td>
                    <label for="email"></label><input type="text" name="email" id="email" size="45"/>
                </td>
            </tr>
            <tr>
                <th>Country:</th>
                <td>
                    <label for="country"></label><input type="text" name="country" id="country" size="15"/>
                </td>
            </tr>
            <tr>
                <td colspan="2" >
                    <input type="submit" value="Save"/>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
