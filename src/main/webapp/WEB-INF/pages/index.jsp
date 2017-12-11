<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 16.11.2017
  Time: 16:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
    <title>INDEX</title>
    <link href="<c:url value="/resources/css/style.css"/>" type="text/css" rel="stylesheet">
</head>
<body class="registration">


<h2 align="center"><spring:message code="registration"/></h2>
<h2></h2>

<span style="float: left">
    <a href="?lang=en" ><font>en</font></a>
    <a href="?lang=ru" ><font>ru</font></a>
    </span>
<form:form method="POST" action="/registration" modelAttribute="userDTO">
    <table align="center" style="border-spacing: 10px;">
        <tr>
            <td><form:label path="nickname"><spring:message code="nickname"/> </form:label></td>
        </tr>
            <tr>
            <td><form:input path="nickname"/></td>
        </tr>
        <tr>
            <td><form:label path="password"><spring:message code="password"/></form:label></td>
        </tr>
        <tr>
            <td><form:password path="password"/></td>
        </tr>
        <tr>
            <td><form:label path="email"><spring:message code="email"/></form:label></td>
        </tr>
        <tr>
            <td><form:input path="email"/></td>
            <a class="notification">${nameattribute}</a>
        </tr>
        <a></a>
        <tr>
            <td colspan="2">
                <spring:message code="to.registration" var="registrationlabel"/>
                <input type="submit" class="buttonSignup" value="${registrationlabel}"/>
            </td>
        </tr>
        <tr>
            <td><form:errors path="nickname"/></td>
        </tr>
        <tr>
        <td><form:errors path="password"/></td>
        </tr>
        <tr>
        <td><form:errors path="email"/></td>
        </tr>
    </table>
</form:form>
<div>
    <a href="/entryentry"><spring:message code="authorization"/> </a>
</div>

</body>
</html>
