<%--
  Created by IntelliJ IDEA.
  User: LTC
  Date: 1/27/2022
  Time: 1:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<p>
  <button> <a href="${pageContext.request.contextPath}/products">Back to Cities List</a></button>
</p>
<table>
  <tr>
    <td>ID: </td>
    <td>${requestScope["product"].getId()}</td>
  </tr>
  <tr>
    <td>Name: </td>
    <td>${requestScope["product"].getName()}</td>
  </tr>
  <tr>
    <td>Price: </td>
    <td>${requestScope["product"].getPrice()}</td>
  </tr>
  <tr>
    <td>Quantity: </td>
    <td>${requestScope["product"].getQuantity()}</td>
  </tr>
  <tr>
    <td>Describe: </td>
    <td>${requestScope["product"].getDescribe()}</td>
  </tr>

</table>
</body>
</html>
