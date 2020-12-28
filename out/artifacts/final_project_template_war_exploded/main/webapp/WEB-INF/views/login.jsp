<!DOCTYPE html>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<html>
  <head>
    <meta charset="UTF-8">
    <title>Sign up</title>

    <style><%@include file="../css/font-awesome.min.css"%></style>
    <style><%@include file="../css/bootstrap.min.css"%></style>
    <style><%@include file="../css/auth.css"%></style>

  </head>

  <body class="text-center">
  <link rel="import" href="catalog.html">
  <form class="form-signin" action="login/process" method="post">
    <div class="text-center mb-4">
      <h1 class="h3 mb-3 font-weight-normal">Авторизация</h1>
    </div>
    <div class="inputText">
      <input type="email" name="login" id="inputEmail" class="form-control" placeholder="Email address" required=""
             autofocus="">
    </div>

    <div class="inputText">
      <input type="password" name="password" id="inputPassword" class="form-control" placeholder="Password"
             required="">
    </div>
    <div class="error">${error_login_placeholder}</div>
    <button class="btn btn-lg btn-primary btn-block" type="submit">Войти</button>
    <br>
      <a href="registration">Регистрация</a>
  </form>

  <script src="file:///C:/Users/Vlad/Desktop/frontend/src/js/bootstrap.min.js"></script>

  </body>
</html>
