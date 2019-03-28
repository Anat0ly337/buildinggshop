<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 19.02.2019
  Time: 17:37
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ph" uri="/WEB-INF/tagLib.tld" %>
<html>
<head>
    <title>Title</title>
</head>
<c:if test="${sessionScope.get('ADMINSESSION') ne null}">
<body>
<div>
    <table>
<c:forEach items="${ip}" var="g">
    <tr>
        <td>${g.key}</td>
        <td>${g.value}</td>
    </tr>
</c:forEach>
    </table>
</div>
<form action="/uploadfile" method="post" enctype="multipart/form-data">
<table align="center">
    <tr>
        <td>
            Залить Фото
        </td>
        <td>
            <input type="file" name="imag">
        </td>
    </tr>
    <tr>
        <td>
            Описание
        </td>
        <td>
            <input type="text" name="desc">
        </td>
    </tr>
    <tr>
        <td>
            Цена
        </td>
        <td>
            <input type="text" name="price">
        </td>
    </tr>
    <input type="submit">
</table>
</form>

</body>
</c:if>

</html>
