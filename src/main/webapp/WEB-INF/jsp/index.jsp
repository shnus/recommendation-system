<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="${sessionScope.locale}"/>
<fmt:setBundle basename="i18n.home" var="home"/>
<%@page contentType="text/html; charset=UTF-8" language="java"%>
<fmt:message bundle="${home}" key="home.title" var="title"/>
<jsp:useBean id="user" class="com.nusrat.java.drive_club.model.User" scope="session"/>
<tags:page title="${title}">
<h2>${user.image_b64}</h2>
    <img src="${user.image_b64}" height="300" width="300" />
</tags:page>