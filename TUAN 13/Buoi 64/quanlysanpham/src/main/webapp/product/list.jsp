<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: LTC
  Date: 1/25/2022
  Time: 9:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Display Product</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <style>
        .httpDirect{
            text-decoration: none;
            color: white;

        }
        table{
            border: black solid 1px;
            border-collapse: collapse;
            border-radius: 5px;
            width: 800px;
            height: 400px;

        }
        table tr,th,td {
            padding: 5px;
            text-align: center;
        }
        tr:hover{
            background-color:#ddd;
            cursor:pointer;
        }
        tr:nth-child(even) td{
            background-color: rgba(245, 221, 136, 0.99);
        }
        .trTable{
            background-color: antiquewhite;
        }

    </style>
</head>
<body>
<h1>Product List</h1>
<span>

    <button class="btn btn-success"> <a class="httpDirect" href="${pageContext.request.contextPath}/products?action=create">CREATE</a></button>


    <button class="btn btn-success"><a class="httpDirect" href="${pageContext.request.contextPath}/products?action=sort">SORT</a></button>
</span>
<br><br>
<table>
    <tr class="trTable">
        <th>ID</th>
        <th>NAME</th>
        <th>PRICE</th>
        <th>DESCRIBE</th>
        <th>MANUFACTURER</th>
        <th>EDIT</th>
        <th>DELETE</th>
    </tr>
    <c:forEach items='${requestScope["products"]}' var="product">
        <tr>
        <td>${product.getId()}</td>
        <td>${product.getName()}</td>
        <td>${product.getPrice()}</td>
        <td>${product.getDescribe()}</td>
        <td>${product.getManufacturer()}</td>
        <td><button class="btn btn-success btn-sm"><a class="httpDirect" href="${pageContext.request.contextPath}/products?action=edit&id=${product.getId()}">Edit</a></button></td>
        <td><button class="btn btn-success btn-sm" ><a class="httpDirect" href="${pageContext.request.contextPath}/products?action=delete&id=${product.getId()}">Delete</a></button></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
