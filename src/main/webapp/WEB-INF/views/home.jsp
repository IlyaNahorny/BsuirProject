<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:url value="http://localhost:8181/logout" var="logout"/>

<html>
<title>Home page</title>
<link rel="stylesheet" href="/resources/css/bootstrap/bootstrap.min.css"/>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"/>

<style>
    body {
        background-color: #f8fff9;
        color: #5b5b5b;
    }
</style>

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
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="navbar-header">
            <div class="navbar-brand">{{'PROJNAME' | translate}}</div>
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
            <%--<li><a href ng-click="changeLanguage('ru')">RU</a></li>--%>
            <%--<li><a href ng-click="changeLanguage('en')">EN</a></li>--%>
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
    <div class="row-fluid">
        <center><h1>{{'HEADERHOME' | translate}}</h1></center>
        <div class="col-md-5 col-md-offset-2">
            <c:forEach items="${users}" var="user">
                <p>
                        <%--<a href="account/${user.username}" style="font-size:25pt">--%>
                        <%--<img src="https://pp.vk.me/c628520/v628520889/16823/XRsEcPGlHSU.jpg" class="img-rounded"--%>
                        <%--width="140" height="150">--%>
                        <%--${user.firstName} ${user.lastName}</a>--%>

                <div class="row">
                    <div class="col-md-5">
                        <a href="account/${user.username}">
                            <img src=${user.url}
                                 class="img-rounded" width="160" height="150">
                        </a>
                    </div>
                    <div class="col-md-5" style="font-size: 20px">
                        <p>
                                ${user.firstName} ${user.lastName}
                        </p>
                    </div>
                </div>

            </c:forEach>
        </div>

    </div>
</div>

</body>
</html>
