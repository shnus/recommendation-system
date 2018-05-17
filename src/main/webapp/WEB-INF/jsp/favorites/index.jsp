<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<fmt:setLocale value="${sessionScope.locale}"/>
<fmt:setBundle basename="i18n.home" var="home"/>
<%@page contentType="text/html; charset=UTF-8" language="java"%>
<fmt:message bundle="${home}" key="home.title" var="title"/>
<jsp:useBean id="movies" class="com.nusrat.java.drive_club.model.FavMovies" scope="request"/>
<tags:page title="${title}">

    <c:url var="starjs" value="/static/js/stars.js"/>
    <script language="JavaScript" type="text/javascript" src="${starjs}"> </script>

    <style>
        @import "http://fonts.googleapis.com/css?family=Roboto:300,400,500,700";


        .mb20 { margin-bottom: 20px; }

        hgroup { padding-left: 15px; border-bottom: 1px solid #ccc; }
        hgroup h1 { font: 500 normal 1.625em "Roboto",Arial,Verdana,sans-serif; color: #2a3644; margin-top: 0; line-height: 1.15; }
        hgroup h2.lead { font: normal normal 1.125em "Roboto",Arial,Verdana,sans-serif; color: #2a3644; margin: 0; padding-bottom: 10px; }

        .search-result .thumbnail { border-radius: 0 !important; }
        .search-result:first-child { margin-top: 0 !important; }
        .search-result { margin-top: 20px; }
        .search-result .col-md-2 { min-height: 150px; min-width: 190px}
        .search-result ul { padding-left: 0 !important; list-style: none;  }
        .search-result ul li { font: 400 normal .85em "Roboto",Arial,Verdana,sans-serif;  line-height: 30px; }
        .search-result ul li i { padding-right: 2px; }
        .search-result .col-md-7 { position: relative; }
        .search-result h3 { font: 500 normal 1.375em "Roboto",Arial,Verdana,sans-serif; margin-top: 0 !important; margin-bottom: 10px !important; }
        .search-result h3 > a, .search-result i { color: #248dc1 !important; }
        .search-result p { font: normal normal 1.125em "Roboto",Arial,Verdana,sans-serif; }
        .search-result span.plus { position: absolute; right: 0; top: 126px; }
        .search-result span.plus a { background-color: #248dc1; padding: 5px 5px 3px 5px; }
        .search-result span.plus a:hover { background-color: #414141; }
        .search-result span.plus a i { color: #fff !important; }
        .search-result span.border { display: block; width: 100%; margin: 0 15px; border-bottom: 1px dotted #ccc; }
    </style>
    <section id="results" class="col-xs-12 col-sm-6 col-md-12">
        <c:forEach items="${movies.movies}" var="movie">
            <article>
                <article class="search-result row">
                    <div class="col-xs-12 col-sm-12 col-md-3">
                        <a href="#" title="Lorem ipsum" class="thumbnail"><img
                            src="https://image.tmdb.org/t/p/w500/${movie.poster_path}" alt="Lorem ipsum" /></a>
                         </div>
                    <div class="col-xs-12 col-sm-12 col-md-2">
                        <ul class="meta-search">
                            <li><span>Release date: ${movie.release_date}</span></li>
                            <li><span>Original language: ${movie.original_language}</span></li>
                            <li></i> <span>Average score: ${movie.vote_average}</span></li>
                            </ul>
                        </div>
                    <div class="col-xs-12 col-sm-12 col-md-7 excerpet">
                           <h3>${movie.title}</h3>
                         <p>${movie.overview}</p>
                        </div>
                    <span class="clearfix borda"></span>
                    </article>
                </article>
        </c:forEach>
    </section>
</tags:page>