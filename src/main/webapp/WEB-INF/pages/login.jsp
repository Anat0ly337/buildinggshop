<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 16.11.2017
  Time: 19:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
    <title>Title</title>
    <link href="<c:url value="/resources/css/style.css"/>" type="text/css" rel="stylesheet">

</head>
<body class="bodyindex">
<span style="float: left" >
    <a href="?lang=en"><font color="blue">en</font></a>
    <a href="?lang=ru"><font color="blue">ru</font></a>
    </span>
<h2 align="center"><spring:message code="authorization"/></h2>
<form:form method="POST" action="/entry" modelAttribute="userDTO">
    <table align="center">
        <tr>
            <td><form:label path="email"><spring:message code="email"/></form:label></td>
            <td><form:input path="email" /></td>
            <td><form:errors path="email"/> </td>
        </tr>
        <tr>
            <td><form:label path="password"><spring:message code="password"/></form:label></td>
            <td><form:password path="password" /></td>
            <td><form:errors path="password"/> </td>
        </tr>
        <tr>
            <td colspan="2">
                <spring:message code="entry" var="entrylabel"/>
                <input type="submit"  value="${entrylabel}"/>
            </td>
        </tr>
        <a class="notification">${notexist}</a>
        <a class="notification">${nameattribute}</a>
    </table>
</form:form>
<div>
    <a href="/"><spring:message code="registration"/> </a>
</div>


</body>
</html>
