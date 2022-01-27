<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Bootstrap Example</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <style>
        img{
            width: 90px;
            height: 120px;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Bordered Table</h2>
    <table class="table table-bordered">
        <thead>
        <tr>
            <th>Name</th>
            <th>Birth</th>
            <th>Address</th>
            <td>Image</td>
        </tr>
        </thead>
        <tbody>

        <jsp:useBean id="customer" scope="request" type="java.util.List"/>
        <c:forEach items="${customer}" var="cus">
            <tr>
                <td>${cus.getName()}</td>
                <td>${cus.getBirth()}</td>
                <td>${cus.getAddress()}</td>
                <td><img src="${cus.getImage()}" alt=""></td>
            </tr>
        </c:forEach>
<%--        <%--%>
<%--            String str = "";--%>
<%--            ArrayList<Customer> customers = (ArrayList<Customer>)request.getAttribute("customer");--%>
<%--            for (Customer c:customers) {--%>
<%--            str+= "        <tr>\n" +--%>
<%--                    "            <td>" +c.getName()+ "</td>\n" +--%>
<%--                    "            <td>" +c.getBirth()+ "</td>\n" +--%>
<%--                    "            <td>" +c.getAddress()+ "</td>\n" +--%>
<%--                    "            <td><img alt = '' src='"+c.getImage()+"'></td>\n" +--%>
<%--                    "        </tr>";--%>
<%--            }--%>
<%--        %>--%>
<%--        <%=str%>>--%>


        </tbody>
    </table>
</div>
</body>
</html>