<%@ page import="org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestWrapper" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="if" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<head>
  <meta charset="utf-8">
  <title>Home page</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <style><%@include file="../css/main-page.css"%></style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
          integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
          crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"
          integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1"
          crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <style><%@include file="../css/bootstrap-datetimepicker.min.css"%></style>
</head>


<div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom box-shadow">
  <h5 class="my-0 mr-md-auto font-weight-normal">Cars & Sharing</h5>
  <nav class="my-2 my-md-0 mr-md-3 row">
    <a class="p-2 text-dark" href="/catalog">Каталог</a>


    <sec:authorize access="isAuthenticated()">
        <a class="p-2 text-dark" href="/history">История заказов</a>
    </sec:authorize>

    <sec:authorize access="hasAuthority('write')">
        <div class="dropdown">
          <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown"
                  aria-haspopup="true" aria-expanded="false">
            Действия с автомобилями
          </button>
          <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
            <a class="dropdown-item" href="/rental-application">Заявки на аренду</a>
            <a class="dropdown-item" href="/catalog/addCar">Добавить авто</a>
            <a class="dropdown-item" href="#">Обслуживание автомобилей</a>
          </div>
        </div>
    </sec:authorize>



  </nav>

    <sec:authorize access="isAuthenticated()">
        <form action="/auth/logout" method="post">
        <button class="btn btn-primary btn-block" type="submit">Выйти</button>
        </form>
    </sec:authorize>

    <sec:authorize access="!isAuthenticated()">
        <a class="btn btn-outline-primary" href="/login">Войти</a>
    </sec:authorize>

</div>



