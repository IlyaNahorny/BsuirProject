<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:url value="http://localhost:8181/logout" var="logout"/>

<html>
<head>
    <title>Show material</title>
    <link rel="stylesheet" href="/resources/css/bootstrap/bootstrap.css"/>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/resources/css/style/${user.style}.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.3.15/angular.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/danialfarid-angular-file-upload/2.2.2/angular-file-upload-all.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.3.15/angular-route.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.3.15/angular-cookies.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.3.15/angular-sanitize.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/angular-translate/2.8.1/angular-translate.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/angular-translate-storage-cookie/2.8.1/angular-translate-storage-cookie.js"></script>
    <script src="/resources/angular/meterial.js"></script>

</head>
<body ng-app="material" ng-controller="MaterialController">
<nav class="navbar">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="/home">{{'PROJNAME' | translate}}</a>
        </div>
        <sec:authorize access="isAuthenticated()">
            <sec:authentication var="name" property="principal.username"/>
            <ul class="nav navbar-nav">
                <li>
                    <a href="/account/${name}">{{'HOME' | translate}}</a>
                </li>
            </ul>
        </sec:authorize>

        <ul class="nav navbar-nav navbar-right">
            <sec:authorize access="isAnonymous()">
                <li><a href="/login">
                        <span class="glyphicon glyphicon-log-in">
                        </span> {{'LOGIN' | translate}}
                </a></li>
                <li><a href="/registration_page">{{'SIGNUP' | translate}} </a></li>
            </sec:authorize>
            <li>
                <sec:authorize access="isAuthenticated()">
                    <a href="${logout}">
                        <span class="glyphicon glyphicon-log-out">
                        </span> {{'LOGOUT' | translate}}
                    </a>
                </sec:authorize>
            </li>
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                   aria-expanded="false">
                    {{ 'LANGUAGE' | translate }}<span class="caret"></span>
                </a>
                <ul class="dropdown-menu">
                    <li><a href ng-click="changeLanguage('ru')">RU</a></li>
                    <li><a href ng-click="changeLanguage('en')">EN</a></li>
                </ul>
            </li>
        </ul>
    </div>
</nav>

<div class="container">
    <div class="row ">
        <div class="well">
            <div>
                <center><h1>${material.materialName}</h1></center>
            </div>
            <div style="min-height: 510px;">
                <c:choose>
                    <c:when test="${material.template eq 'template1'}">
                        <img src="${material.url}" width="700" height="500"
                             align="left" hspace="10" class="img-rounded">

                    </c:when>
                    <c:otherwise>
                        <iframe src="${material.url}" width="700" height="500" style="margin-right: 2%"
                                frameborder="0" allowfullscreen align="left"></iframe>
                    </c:otherwise>
                </c:choose>
                ${material.description}
            </div>
            <div class="row" style="font-size: xx-large">
                <div class="col-md-6"> Рейтинг : {{ratingValue}} | Коментариев : 0</div>
                <sec:authorize access="isAuthenticated()">
                    <div class="col-md-2 col-md-offset-4">
                        <a href ng-click="rating('${name}','${material.id_material}','down')"
                           style="text-decoration: none;">
                            <span class="glyphicon glyphicon-thumbs-down"></span>
                        </a>
                        <a href ng-click="rating('${name}','${material.id_material}','up')"
                           style="text-decoration: none; margin-left: 20px">
                            <span class="glyphicon glyphicon-thumbs-up"></span>
                        </a>
                    </div>
                </sec:authorize>
            </div>
        </div>

    </div>
</div>
</body>
</html>
