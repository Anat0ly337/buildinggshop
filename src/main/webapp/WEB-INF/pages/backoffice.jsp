<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
    <title>Title</title>
    <link href="<c:url value="/resources/css/style.css"/>" type="text/css" rel="stylesheet">

</head>
<body class="lib">
<ul>
    <li><spring:message code="nickname"/><a>${user}</a></li>
    <li><a href="/showbooks"><spring:message code="library.book"/> </a></li>
    <li><a href="/entryentry"><spring:message code="exit"/></a></li>
</ul>
<div align="center" class="postlogin-div">
    <form action="/up" method="post" enctype="multipart/form-data">
        <input type="file" name="book">
        <tr>
            <td>
        <spring:message code="description" var="descriptionlable"/>
        <input class="input" type="texta"  name="desc" placeholder="${descriptionlable}">
            </td>
        </tr>
        <spring:message code="upload" var="uploadlable"/>
        <input type="submit" value="${uploadlable}">
    </form>
</div>
<div align="center"><b>${notification}</b>
</div>

<div>
    <c:forEach items="${postList}" var="post">
        <table align="center">
            <tr>
                <td>
                    <b>${post.text}</b>
                </td>
            </tr>
            <tr class="link"><td><a href="/download/${post.text}"><spring:message code="download"/></a></td></tr>
            <tr class="link"><td><a href="/delete/${post.id}"><spring:message code="delete"/> </a></td></tr>
        </table>
    </c:forEach>


</div>


</body>
</html>
