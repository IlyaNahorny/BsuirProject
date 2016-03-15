<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:url value="http://localhost:8181/logout" var="logout"/>

<html>
<head>
    <title>Edit</title>
    <link rel="stylesheet" href="/resources/css/bootstrap/bootstrap.css"/>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/resources/css/style/${user.style}.css">
    <link rel="stylesheet" href="/resources/css/style/upload.css">

    <%--<script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>--%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>--%>


    <script src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.3.15/angular.js"></script>

    <%--<script src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.3.15/angular-route.js"></script>--%>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.3.15/angular-cookies.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.3.15/angular-sanitize.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/angular-translate/2.8.1/angular-translate.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/angular-translate-storage-cookie/2.8.1/angular-translate-storage-cookie.js"></script>
    <script src="/resources/angular/user.js"></script>
    <script src="/resources/angular/upload.js"></script>

</head>
<body ng-app="user" ng-controller="TranslateController">
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
    <center><h1>{{'EDITACCOUNT' | translate}}</h1></center>
    <div class="row">
        <%--<div class="col-xs-12 col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">--%>
        <div class="col-md-5">
            <center><h2>{{'PHOTO' | translate}}</h2></center>
            <div class="col-md-8">
                <div class="input-group image-preview">
                    <input type="text" class="form-control image-preview-filename" disabled="disabled">
                    <!-- don't give a name === doesn't send on POST/GET -->
                <span class="input-group-btn">
                    <!-- image-preview-clear button -->
                    <button type="button" class="btn btn-default image-preview-clear" style="display:none;">
                        <span class="glyphicon glyphicon-remove"></span> Clear
                    </button>
                    <!-- image-preview-input -->
                    <div class="btn btn-default image-preview-input">
                        <span class="glyphicon glyphicon-folder-open"></span>
                        <span class="image-preview-input-title">Browse</span>
                        <input type="file" accept="image/png, image/jpeg, image/gif" id="id_image"
                               name="input-file-preview" onchange="init(this.files[0])"/>
                        <!-- rename it -->
                    </div>
                </span>
                </div>
            </div>
            <div class="col-md-4">
                <button onclick="upload()" class="btn btn-default">{{'UPDATEIMAGE' | translate}}</button>
            </div>

            <!-- image-preview-filename input [CUT FROM HERE]-->
        </div>

        <div class="col-md-7">
            <center><h2>{{'CONTENT' | translate}}</h2></center>
            <%--<div class="col-md-5 col-md-offset-2">--%>
            <form:form class="form-horizontal" method="post" commandName="user" action="/account/${user.username}/edit">
                <div class="form-group">
                    <label class="control-label col-sm-4" for="firstName">{{'FIRSTNAME' | translate}}:</label>

                    <div class="col-sm-8">
                        <form:input path="firstName" type="text" value="${user.firstName}" class="form-control"
                                    placeholder="Enter first name"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-4" for="lastName">{{'LASTNAME' | translate}}:</label>

                    <div class="col-sm-8">
                        <form:input path="lastName" type="text" value="${user.lastName}" class="form-control"
                                    placeholder="Enter last name"/>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-sm-4" for="city">{{'CITY' | translate}}:</label>

                    <div class="col-sm-8">
                        <form:input path="city" type="text" value="${user.city}" class="form-control"
                                    placeholder="Enter your city"/>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-sm-4" for="job">{{'JOB' | translate}}:</label>

                    <div class="col-sm-8">
                        <form:input path="job" type="text" value="${user.job}" class="form-control"
                                    placeholder="Enter your place work"/>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-sm-4" for="style">{{ 'STYLE' | translate }}</label>

                    <div class="col-sm-8">
                        <form:select path="style" class="form-control">
                            <option value="default" selected>{{ 'LIGHT' | translate }}</option>
                            <option value="dark">{{ 'DARK' | translate }}</option>
                        </form:select>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-offset-4">
                        <button type="submit" class="btn btn-default">{{'UPDATECONTENT' | translate}}</button>
                    </div>
                </div>
            </form:form>


        </div>
    </div>

</div>


</body>
</html>
