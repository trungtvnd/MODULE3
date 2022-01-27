<%--
  Created by IntelliJ IDEA.
  User: LTC
  Date: 1/27/2022
  Time: 2:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<c:if test="${requestScope['baskets'].isEmpty()}">
    <h2 style="color: red">Không có sản phẩm nào</h2>
</c:if>
<table>
    <tr class="trTable">
        <th>NAME</th>
        <th>PRICE</th>
        <th>QUANTITY</th>
        <th colspan="2">ACTION</th>

    </tr>
    <c:forEach items='${requestScope["baskets"]}' var="baskets">
        <tr>
            <td>${baskets.getName()}</td>
            <td>${baskets.getPrice()}</td>
            <td>${baskets.getQuantity()}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
