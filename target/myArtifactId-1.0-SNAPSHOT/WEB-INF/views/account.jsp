<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:url value="http://localhost:8181/logout" var="logout"/>
<html>
<head>
    <title>Account</title>

    <link rel="stylesheet" href="/resources/css/bootstrap/bootstrap.css"/>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/resources/css/style/${user.style}.css">
    <link rel="stylesheet" href="/resources/css/style/hide_text.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.3.15/angular.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.3.15/angular-cookies.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.3.15/angular-sanitize.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/angular-translate/2.8.1/angular-translate.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/angular-translate-storage-cookie/2.8.1/angular-translate-storage-cookie.js"></script>
    <script src="/resources/angular/user.js"></script>

</head>
<body ng-app="user" ng-controller="TranslateController">
<nav class="navbar">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="/home">{{'PROJNAME' | translate}}</a>
        </div>
        <sec:authorize access="isAuthenticated()">
            <sec:authentication var="name" property="principal.username"/>
            <c:if test="${user.username eq name}">
                <ul class="nav navbar-nav">
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown">{{'MENU' | translate}}
                            <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="/account/${user.username}/edit">{{'EDIT' | translate}}</a></li>
                            <li><a href="/account/${user.username}/material/create">{{'CREATENEWMATER' | translate}}</a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </c:if>
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
        <div class="col-md-10 col-md-offset-1">
            <div class="well">
                <div class="container-fluid">
                    <div class="row ">

                        <div class="col-md-4">
                            <img src=${user.url} class="img-rounded" width="200" height="180">
                        </div>
                        <div class="col-md-6">
                            <p>

                            <h1>${user.firstName} ${user.lastName}</h1> </p>
                            <p>{{'CITY' | translate}}: ${user.city} </p>

                            <p>{{'JOB' | translate}}: ${user.job}</p>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<div class="container">
    <div class="row ">

        <div class="col-md-8 col-md-offset-2">
            <c:forEach items="${user.materials}" var="material">
                <div class="well">
                    <div class="container-fluid">
                        <div class="row">
                            <center><h2>${material.materialName}</h2></center>

                            <div id="content_text">
                                <c:choose>
                                    <c:when test="${material.template eq 'template1'}">
                                        <img src="${material.url}" width="500" height="400"
                                             align="left" hspace="10" class="img-rounded">

                                    </c:when>
                                    <c:otherwise>
                                        <iframe src="${material.url}" width="500" height="400" style="margin-right: 2%"
                                                frameborder="0" allowfullscreen align="left"></iframe>
                                    </c:otherwise>
                                </c:choose>
                                    ${material.description}
                            </div>

                        </div>
                        <div class="row">
                            <div class="col-md-8">
                                <a href ng-click="rating('${user.username}','${material.materialName}','down')">
                                    <span class="glyphicon glyphicon-thumbs-down" style="font-size: x-large"></span>
                                </a>
                                <a href ng-click="rating('${user.username}','${material.materialName}','up')">
                                    <span class="glyphicon glyphicon-thumbs-up" style="font-size: x-large"></span>
                                </a>
                            </div>
                            <div class="col-md-4">
                                <a href="#" style="color: #ac2925; font-size: large;">Читать
                                    полностью</a>
                            </div>
                        </div>

                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>


</body>
</html>
