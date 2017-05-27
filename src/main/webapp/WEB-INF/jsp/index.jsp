<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="${sessionScope.locale}"/>
<fmt:setBundle basename="i18n.home" var="home"/>
<%@page contentType="text/html; charset=UTF-8" language="java"%>
<fmt:message bundle="${home}" key="home.title" var="title"/>
<jsp:useBean id="user" class="com.nusrat.java.drive_club.model.User" scope="session"/>
<tags:page title="${title}">

    <div class="col-lg-3 col-md-3 hidden-sm hidden-xs" style="margin-right: 100px">
        <div class="panel panel-default">
            <div class="panel-body">
                <div class="media">
                    <div align="center">
                        <img class="thumbnail img-responsive" src="${user.image_b64}" width="300px" height="300px">
                    </div>

                </div>
            </div>
        </div>
    </div>
    <div class="media-body" >
        <h2>${user.name}</h2>
        <h3><strong>Bio</strong></h3>
        <p>${user.bio}</p>
        <hr>
        <h3><strong>Location</strong></h3>
        <p>${user.location}</p>
        <hr>
        <h3><strong>Gender</strong></h3>
        <p>${user.gender}</p>
        <hr>
        <h3><strong>Birthday</strong></h3>
        <p>${user.birthDate}</p>
    </div>
</tags:page>