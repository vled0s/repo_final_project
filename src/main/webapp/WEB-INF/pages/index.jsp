<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Home page</title>


  </head>

  <body>
    <p>
      ${message}!
    </p>
    <form action="auth/logout" method="POST">
      <button class="btn btn-lg btn-primary btn-block" type="submit">Выйти</button>
    </form>
  </body>
</html>



