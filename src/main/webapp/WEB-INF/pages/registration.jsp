<!DOCTYPE html>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" language="java" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Registration</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <style><%@include file="../css/auth.css"%></style>
  </head>

  <body class="text-center">
    <form class="form-signin" action="registration/proceed" method="POST">
      <div class="text-center mb-4">
        <h1 class="h3 mb-3 font-weight-normal">Регистрация</h1>
      </div>

    <div class="inputText">

        <input type="email" name="email" class="form-control" id="emailField" placeholder="Email" value="" required>
        <div class="valid-feedback">
            Looks good!
        </div>
    </div>

  <div class="inputText">
    <input type="phone" name="phone" id="inputPhone" class="form-control" placeholder="Phone" requiredrequired>
      <div class="valid-feedback">
          Looks good!
      </div>
  </div>

    <div class="inputText">
        <input type="" name="billingAddress" class="form-control" id="addressField" placeholder="Address" value="" required>
        <div class="valid-feedback">
            Looks good!
        </div>
    </div>


      <div class="inputText">
        <input type="password" name="password" id="inputPassword" class="form-control" placeholder="Password"
               required="" autocomplete="off">
      </div>
      <button class="btn btn-lg btn-primary btn-block" type="submit">Зарегистрироваться</button>
      <br>
      <a href="/login">Вернуться к авторизации</a>
    </form>


  </body>
</html>
