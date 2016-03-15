var materialModule = angular.module('material', ['ngCookies', 'ngRoute', 'pascalprecht.translate', 'angularFileUpload']);
materialModule.config(['$translateProvider', function ($translateProvider) {
    $translateProvider.translations('en', {
        PROJNAME: 'Educational materials',
        SIGNUP: 'Sign up',
        LOGIN: 'Login',
        LOGOUT: 'Logout',
        WELCOMREGPAGE: 'Welcome to the registration page',
        WELCOMLOGPAGE: 'Welcome to the login page',
        USERNAME: 'Username',
        PASSWORD: 'Password',
        FIRSTNAME: 'First name',
        LASTNAME: 'Last name',
        HEADERHOME: 'All registered users of the site educational materials',
        LANGUAGE: 'Language',
        CITY: 'City',
        JOB: 'Job',
        MENU: 'Menu',
        EDIT: 'Edit',
        CREATENEWMATER: 'Create new material',
        HOME: 'Home',
        UPDATEIMAGE: 'Update image',
        EDITACCOUNT: 'Change user account',
        PHOTO: 'Upload photo',
        CONTENT: 'About me',
        UPDATECONTENT: 'Update',
        STYLE: 'Style',
        LIGHT: 'light',
        DARK: 'dark',
        MATERIALNAME: 'Material name',
        DESCRIPTION: 'Description',
        UPLOADIMAGE:'Upload image',
        TEMPNAME: 'Creating material',
        ADDMATERIAL: 'Add material',
        RESET: 'Reset',
        ADDIMAGE: 'Add image',
        TEMPLATE: 'Template',
        TEMPLSELECT: 'Template selection'

    })
        .translations('ru', {
            PROJNAME: 'Учебные материалы',
            SIGNUP: 'Регистрация',
            LOGIN: 'Войти',
            LOGOUT: 'Выйти',
            WELCOMREGPAGE: 'Добро пожаловать на страницу регистрации',
            WELCOMLOGPAGE: 'Добро пожаловать на страницу авторизации',
            USERNAME: 'Имя пользователя',
            PASSWORD: 'Пароль',
            FIRSTNAME: 'Имя',
            LASTNAME: 'Фамилия',
            HEADERHOME: 'Все зарегистрированные пользователи сайта учебные материалы',
            LANGUAGE: 'Язык',
            CITY: 'Город',
            JOB: 'Место работы',
            MENU: 'Меню',
            EDIT: 'Редактировать',
            CREATENEWMATER: 'Создать новый материал',
            HOME: 'Моя страница',
            UPDATEIMAGE: 'Обновить аву',
            EDITACCOUNT: 'Изменить учетную запись пользователя ',
            PHOTO: 'Загрузить фото',
            CONTENT: 'О себе',
            UPDATECONTENT: 'Обновить',
            STYLE: 'Стиль',
            LIGHT: 'светлый',
            DARK: 'темный',
            MATERIALNAME: 'Имя материала',
            DESCRIPTION: 'Описание',
            UPLOADIMAGE:'Загрузите изображение',
            TEMPNAME: 'Создание материала',
            ADDMATERIAL: 'Добавить материал',
            RESET: 'Сброс',
            ADDIMAGE: 'Добавить изображение',
            TEMPLATE: 'Шаблон',
            TEMPLSELECT: 'Выбор шаблона'
        });

    $translateProvider.preferredLanguage('ru');
    $translateProvider.useCookieStorage();

}]);
materialModule.config(['$routeProvider',
    function ($routeProvider) {
        $routeProvider.
            when('/template1', {
                templateUrl: '/resources/template/template1.html'
            }).
            when('/template2', {
                templateUrl: '/resources/template/template2.html'
            }).
            otherwise({
                redirectTo: '/template1'
            });
    }]);

materialModule.controller('MaterialTempl1', function ($scope,$rootScope, $window, $http, $translate, $upload) {
    $scope.changeLanguage = function (key) {
        $translate.use(key);
    };

    //$scope.material={};

    $scope.$watch('file_image', function() {
        var file = $scope.file_image;
        if (!file || file.length > 1) return;

            $scope.upload = $upload.upload({
                url: "https://api.cloudinary.com/v1_1/projectbsuir/upload",
                data: {upload_preset: 'ojgb4mcn'},
                file: file
            }).progress(function (e) {
                file.progress = Math.round((e.loaded * 100.0) / e.total) + "%";
                $scope.fileStatus = {
                    "width" : file.progress
                };
                file.status = "Uploading... " + file.progress + "%";
                //console.log(file.progress);
                if(!$scope.$$phase) {
                    $scope.$apply();
                }})
                .success(function (data) {
                    $scope.material.url = data.url;
                })
                .error(function(){
                    alert("Error while downloading image!");
                });

    });

    $scope.addMaterial = function(material){
        $scope.material.template = 'template1';
        console.log(material);
        $http.post('/material/add',material).success(function(){
                $scope.reset();
                alert("success");
            })
            .error(function(){
                alert("error");
            });
    };

    $scope.reset = function(){
        $scope.material = {};
        $scope.fileStatus = {};
    };


});

materialModule.controller('MaterialTempl2', function ($scope,$rootScope, $window, $http, $translate) {
    $scope.changeLanguage = function (key) {
        $translate.use(key);
    };

    $scope.addMaterial = function(material,urlVideo){
        $scope.material.template = 'template2';
        var regex = new RegExp(/(?:\?v=)([^&]+)(?:\&)*/);
        var matches = regex.exec(urlVideo);
        var url = "https://www.youtube.com/embed/"+matches[1];
        $scope.material.url =url;
        console.log(material);
        $http.post('/material/add',material).success(function(){
            $scope.reset();
            alert("success");
        })
            .error(function(){
                alert("error");
            });
    };

    $scope.reset = function(){
        $scope.material = {};
    };


});