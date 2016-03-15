<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:url value="http://localhost:8181/logout" var="logout"/>
<html>
<head>

    <title>Registration</title>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"/>
    <style>
        form{
            margin-top: 50px;
        }

        body{
            background-color: #f9fffa;
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
            <a class="navbar-brand" href="/home">{{'PROJNAME' | translate}}</a>
        </div>

        <ul class="nav navbar-nav navbar-right">
            <li>
                <a href="/login">
                        <span class="glyphicon glyphicon-log-in">
                        </span> {{'LOGIN' | translate}}
                </a>
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

<center>
    <h1>{{'WELCOMREGPAGE' | translate}}</h1>
</center>

<div class="container">
    <div class="row">

        <div class="col-md-6 col-md-offset-2">
            <form:form class="form-horizontal" method="post" commandName="user" action="registration">
                <c:if test="${not empty error}">
                    <div class="alert alert-danger">${error}</div>
                </c:if>
                <div class="form-group">
                    <label class="control-label col-sm-4" for="firstName">{{'FIRSTNAME' | translate}}:</label>

                    <div class="col-sm-8">
                        <form:input path="firstName" type="text" class="form-control" placeholder="Enter first name"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-4" for="lastName">{{'LASTNAME' | translate}}:</label>

                    <div class="col-sm-8">
                        <form:input path="lastName" type="text" class="form-control" placeholder="Enter last name"/>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-sm-4" for="city">{{'CITY' | translate}}:</label>

                    <div class="col-sm-8">
                        <form:input path="city" type="text" class="form-control" placeholder="Enter your city"/>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-sm-4" for="job">{{'JOB' | translate}}:</label>

                    <div class="col-sm-8">
                        <form:input path="job" type="text" class="form-control" placeholder="Enter your place work"/>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-sm-4" for="username">{{'USERNAME' | translate}}:</label>

                    <div class="col-sm-8">
                        <form:input path="username" type="text" class="form-control" placeholder="Enter username"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-4" for="password">{{'PASSWORD' | translate}}:</label>

                    <div class="col-sm-8">
                        <form:input path="password" type="password" class="form-control" placeholder="Enter password"/>
                    </div>
                </div>


                <div class="form-group">
                    <div class="col-sm-offset-4 col-sm-8">
                        <button type="submit" class="btn btn-default">{{'SIGNUP' | translate}}</button>
                    </div>
                </div>
            </form:form>
        </div>
    </div>

</div>
</body>
</html>
