<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="if" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">

  <jsp:include page="/header"></jsp:include>

  <body>
  <!-- Title car -->
  <div class="content-container">
  <div class="container">
    <h1 class="mb-5 display-4 text-center">Ваша история</h1>
  </div>

  <!-- Catalog -->
  <div class=" album py-4 bg-light">



    <div class="container">
      <p class="lead text-left">Текущие арендованные автомобили:</p>

      <div class="row">
        <div class="col">
          BMW
          <img class="w-75  float-right img-car-info"
               src="https://image-server.autospot.ru/images/1/0/2/2/9/9/993085/resize/400x0/993085.webp">
        </div>
        <div class="col li-car-info">
          <ul>
            <li>Купе, 2 двери, 5 мест </li>
            <li>Пробег 250 км</li>
            <li>Номер А 777 АВ</li>
            <li>Автомат (8 ступеней) </li>
            <li>Средний расход 4.1 л / 5.1 л / 4.4 л (трасса, город, смешанный)</li>
            <li>Начало аренды 17.11.2020</li>
            <li>Окончание аренды 17.12.2020</li>
          </ul>
        </div>
      </div>
      <div class="text-center">
        <button type="submit" class="btn btn-success">Продлить аренду</button>
        <button type="submit" class="btn btn-success">Завершить аренду</button>
      </div>

    </div>



    <div class="container">
      <p class="mt-5 lead text-left">Ранее арендованные автомобили:</p>
      <div class="row">
        <div class="col">
          Opel Grandland X
          <img class="w-75  float-right img-car-info"
               src="https://image-server.autospot.ru/images/1/0/2/2/1/5/15449/resize/400x0/15449.webp">
        </div>
        <div class="col li-car-info">
          <ul>

            <li>Купе, 2 двери, 5 мест </li>
            <li>Пробег 1 340 км</li>
            <li>Номер А 777 АВ</li>
            <li>Автомат (8 ступеней) </li>
            <li>Средний расход 4.1 л / 5.1 л / 4.4 л (трасса, город, смешанный)</li>
            <li>Начало аренды 08.10.2020</li>
            <li>Окончание аренды 17.10.2020</li>
          </ul>
        </div>
      </div>
      <div class="col-xs-12">
        <hr>
      </div>
      <div class="row">
        <div class="col">
          Opel Zafira Life
          <img class="w-75  float-right img-car-info"
               src="https://image-server.autospot.ru/images/1/0/2/2/1/5/15450/resize/400x0/15450.webp">
        </div>
        <div class="col li-car-info">
          <ul>
            <li>Купе, 2 двери, 5 мест </li>
            <li>Пробег 250 км</li>
            <li>Номер А 777 АВ</li>
            <li>Автомат (8 ступеней) </li>
            <li>Средний расход 4.1 л / 5.1 л / 4.4 л (трасса, город, смешанный)</li>
            <li>Начало аренды 17.11.2020</li>
            <li>Окончание аренды 17.12.2020</li>
          </ul>
        </div>
      </div>
      <div class="col-xs-12">
        <hr>
      </div>

    </div>
  </div>
  </div>
  </body>

  <!--footer-->
  <%@ include file="footer.jsp" %>
</html>



