<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="${sessionScope.locale}"/>
<fmt:setBundle basename="i18n.home" var="home"/>
<%@page contentType="text/html; charset=UTF-8" language="java"%>
<fmt:message bundle="${home}" key="home.title" var="title"/>
<jsp:useBean id="user" class="com.nusrat.java.drive_club.model.User" scope="session"/>

<tags:page title="${title}">

    <script>
        $(document).ready(function() {
            $("#search").click(function () {
                $("#results").empty();
                search();
            });
        });





        function search() {
            var surl = "https://api.themoviedb.org/3/search/movie?api_key=d5fbdafc1e8b3130160515b181cd55be&language=en-US" +
                "&query="+encodeURI($("#text").val())+"&page=1&include_adult=false";
            var settings = {
                "async": true,
                "crossDomain": true,
                "url": surl,
                "method": "GET",
                "headers": {},
                "data": "{}"
            }
            console.log(surl);

            $.ajax(settings).done(function (response) {
                console.log(response);
                var resp = response;
                var films = resp.results;
                if(films.length==0){
                    $("#results").append("No such movie in database");
                }else {
                    for (var i = 0; i < films.length; i++) {
                        var tag = document.createElement("tags:result");
                        var title = films[i].title;
                        var overview = films[i].overview;
                        var release_date = films[i].release_date;
                        var origignal_language = films[i].original_language;
                        var poster_path = "https://image.tmdb.org/t/p/w500" + films[i].poster_path;
                        var vote_average = films[i].vote_average;

                        $("#results").append('' +
                            '<article>' +
                            '<article class="search-result row">' +
                            '<div class="col-xs-12 col-sm-12 col-md-3">' +
                            '<a href="#" title="Lorem ipsum" class="thumbnail"><img ' +
                            'src="' + poster_path + '" alt="Lorem ipsum" /></a> ' +
                            ' </div> ' +
                            '<div class="col-xs-12 col-sm-12 col-md-2"> ' +
                            '<ul class="meta-search">' +
                            '<li><span>Release date: ' + release_date + '</span></li>' +
                            '<li><span>Original language: ' + origignal_language + '</span></li>' +
                            '<li></i> <span>Average score: ' + vote_average + '</span></li>' +
                            '</ul>' +
                            '</div>' +
                            '<div class="col-xs-12 col-sm-12 col-md-7 excerpet">' +
                            '   <h3>' + title + '</h3>' +
                            ' <p>' + overview + '</p>' +
                            '<span class="plus"><a href="#" title="Lorem ipsum"><i class="glyphicon glyphicon-plus"></i></a></span>' +
                            '</div>' +
                            '<span class="clearfix borda"></span>' +
                            '</article>' +
                            '</article>');
                    }
                }
            });
        }


    </script>

    <style>
        @import "http://fonts.googleapis.com/css?family=Roboto:300,400,500,700";

        .container { margin-top: 20px; }
        .mb20 { margin-bottom: 20px; }

        hgroup { padding-left: 15px; border-bottom: 1px solid #ccc; }
        hgroup h1 { font: 500 normal 1.625em "Roboto",Arial,Verdana,sans-serif; color: #2a3644; margin-top: 0; line-height: 1.15; }
        hgroup h2.lead { font: normal normal 1.125em "Roboto",Arial,Verdana,sans-serif; color: #2a3644; margin: 0; padding-bottom: 10px; }

        .search-result .thumbnail { border-radius: 0 !important; }
        .search-result:first-child { margin-top: 0 !important; }
        .search-result { margin-top: 20px; }
        .search-result .col-md-2 { border-right: 1px dotted #ccc; min-height: 140px; }
        .search-result ul { padding-left: 0 !important; list-style: none;  }
        .search-result ul li { font: 400 normal .85em "Roboto",Arial,Verdana,sans-serif;  line-height: 30px; }
        .search-result ul li i { padding-right: 5px; }
        .search-result .col-md-7 { position: relative; }
        .search-result h3 { font: 500 normal 1.375em "Roboto",Arial,Verdana,sans-serif; margin-top: 0 !important; margin-bottom: 10px !important; }
        .search-result h3 > a, .search-result i { color: #248dc1 !important; }
        .search-result p { font: normal normal 1.125em "Roboto",Arial,Verdana,sans-serif; }
        .search-result span.plus { position: absolute; right: 0; top: 126px; }
        .search-result span.plus a { background-color: #248dc1; padding: 5px 5px 3px 5px; }
        .search-result span.plus a:hover { background-color: #414141; }
        .search-result span.plus a i { color: #fff !important; }
        .search-result span.border { display: block; width: 97%; margin: 0 15px; border-bottom: 1px dotted #ccc; }
    </style>

    <div class="container">
        <div class="row">
            <h2>Find film</h2>
            <div class="search">
                <input id="text" type="text" class="form-control input-sm" maxlength="150" placeholder="Film, serial ..." />
                <button id="search" type="submit" class="btn btn-primary btn-sm">Search</button>
            </div>
        </div>
    </div>
    <div class="container">

    <hgroup class="mb20">
        <h1>Search Results</h1>
        </hgroup>

    <section id="results" class="col-xs-12 col-sm-6 col-md-12">


    </section>
    </div>
</tags:page>
