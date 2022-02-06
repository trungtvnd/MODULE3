<%--
  Created by IntelliJ IDEA.
  User: LTC
  Date: 2/6/2022
  Time: 4:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<h1>Day la danh sach</h1>

<button><a href="/customers?action=create">Tao moi</a></button>
<c:forEach items="${customers}" var="customer">
    <h2>${customer.id}, ${customer.name}, ${customer.age}</h2>

</c:forEach>
</body>
</html>
