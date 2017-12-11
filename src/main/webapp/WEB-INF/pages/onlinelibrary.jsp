<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Library</title>
    <link href="<c:url value="/resources/css/style.css"/>" type="text/css" rel="stylesheet">
</head>
<spring:message code="search" var="searchlable"/>
<spring:message code="comment" var="commentlable"/>
<body class="lib">
<ul>
    <li><spring:message code="nickname"/><a>${user}</a></li>
    <li><a href="/backoff"><spring:message code="backoffice"/></a></li>
    <li><a href="/entryentry"><spring:message code="exit"/></a></li>
</ul>
<div align="center" class="search">
    <form action="/search" method="post">
        <table align="center">
            <input type="search" name="search">
            <input type="submit" value="${searchlable}">
        </table>
    </form>
</div>

<c:forEach items="${allbooks}" var="allbooks">
    <div align="center" class="table">
        <table>
            <tr>
                <td>
                    <b>${allbooks.text}</b>
                </td>
            </tr>
            <tr>
                <td>
                    <b>${allbooks.postDate}</b>
                    <b>${allbooks.userID.nickname}</b>
                </td>
            </tr>
            <p><a href="/download/${allbooks.text}"><spring:message code="download"/> </a></p>
            <div>
                <div>
                    <form action="/show/showcomment">
                        <input type="hidden" name="book" value="${allbooks.text}">
                        <input type="submit" value="${commentlable}">
                    </form>
                </div>
            </div>

        </table>
    </div>
</c:forEach>

</body>
</html>
