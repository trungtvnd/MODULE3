<%--
  Created by IntelliJ IDEA.
  User: LTC
  Date: 1/27/2022
  Time: 1:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <button class="btn btn-success"><a class="httpDirect" href="${pageContext.request.contextPath}/products?action=sortGet">SORT</a></button>
</span>
<br><br>
<table>
    <tr class="trTable">
        <th>ID</th>
        <th>NAME</th>
        <th>PRICE</th>
        <th>DESCRIBE</th>
        <th>MANUFACTURER</th>
        <th colspan="2">ACTION</th>

    </tr>
    <c:forEach items='${requestScope["products"]}' var="product">
        <tr>
            <td>${product.getId()}</td>
            <td>${product.getName()}</td>
            <td>${product.getPrice()}</td>
            <td>${product.getQuantity()}</td>
            <td>${product.getDescribe()}</td>
            <td ><button><a class="getLink" href="${pageContext.request.contextPath}/products?action=viewProduct&id=${product.getId()}">View</a></button></td>
            <td ><button><a class="getLink" href="${pageContext.request.contextPath}/baskets?action=addProductGet&name=${product.getName()}&quantity=${product.getQuantity()}&price=${product.getPrice()}">Add to Basket</a></button></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
