<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 26.11.2017
  Time: 15:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<html>
<head>
    <title>Title</title>
    <link href="<c:url value="/resources/css/style.css"/>" type="text/css" rel="stylesheet">
</head>
<body>
<ul>
    <li><spring:message code="nickname"/><a>${user}</a></li>
    <li><a href="/showbooks"><spring:message code="library.book"/></a></li>
    <li><a href="/backoff"><spring:message code="backoffice"/></a></li>
    <li><a href="/entryentry"><spring:message code="exit"/></a></li>
</ul>
<div align="center">
    <form action="/show/comment" method="post">
        <input type="text" name="comment">
        <spring:message code="send" var="sendlable"/>
        <input type="hidden" name="commentid" value="${commentid}">
        <input type="submit" value="${sendlable}">
        <a>${notnullcomment}</a>
    </form>
    <c:forEach items="${commentt}" var="comm">
    <div align="center" class="table">
        <table>
            <tr>
                <td>
                    <b>${comm.text}</b>
                </td>
            </tr>
            <tr>
                <td>
                    <b>${comm.commentDate}</b>
                    <b>${comm.userID.nickname}</b>
                </td>
                <c:if test="${comm.userID.email==sessionScope.get('USERSESSION')}">
                    <a href="/show/deletecomment/${comm.id}"><spring:message code="delete"/></a>
                </c:if>
            </tr>
        </table>
    </div>
    </c:forEach>
</div>
</body>
</html>
