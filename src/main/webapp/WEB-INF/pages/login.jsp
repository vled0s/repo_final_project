<!DOCTYPE html>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<html>
  <head>
    <meta charset="UTF-8">
    <title>Sign up</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <style><%@include file="../css/auth.css"%></style>

  </head>

  <body class="text-center">
  <link rel="import" href="catalog.html">
  <form class="form-signin" action="login/process" method="POST">
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

    <button class="btn btn-lg btn-primary btn-block" type="submit">Войти</button>
    <br>
      <a href="registration">Регистрация</a>
  </form>

  <div class="error">${error_login_placeholder}</div>

  <script src="file:///C:/Users/Vlad/Desktop/frontend/src/js/bootstrap.min.js"></script>

  </body>
</html>
