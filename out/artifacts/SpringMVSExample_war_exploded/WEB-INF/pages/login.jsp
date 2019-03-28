<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 14.03.2019
  Time: 16:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/admin.css">

</head>
<body class="bodyindex">

<h2 align="center">Авторизация</h2>
<form action="/login" method="post">
    <table align="center">
        <tr>
            <td>LOGIN</td>
            <td><input type="text" name="log"></td>

        </tr>
        <tr>
            <td>PASSWORD</td>
            <td><input type="password" name="pass"></td>
        </tr>
        <tr>

            <td><input type="submit" value="отправить"></td>
        </tr>

        <a class="notification">${FORBIDDEN}</a>




    </table>
</form>


</body>
</html>
