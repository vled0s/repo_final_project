<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">

  <jsp:include page="/header"></jsp:include>
<body>
  <!-- Title car -->

  <div class="container">
    <h1 class="mb-5 display-4 text-center">Обслуживание</h1>
  </div>

  <!-- Catalog -->
  <div class="album py-4 bg-light">



    <div class="container">
      <p class="lead text-left">Автомобили требующие обслуживания:</p>

      <div class="row">
        <div class="col">
          BMW
          <img class="w-75  float-right img-car-info"
               src="https://image-server.autospot.ru/images/1/0/2/2/9/9/993085/resize/400x0/993085.webp">
        </div>
        <div class="col li-car-info">
          <h5>Индификационные признаки автомобиля</h5>

          <ul>
            <li>Номер А 777 АВ</li>
          </ul>

          <h5>Что требует технического обслуживания</h5>
          <ul>
            <li>Требуется замена масла двигателя
              <button type="submit" class="btn btn-success">Выполнено</button>
            </li>
            <br>
            <li>Требуется замена масла двигателя
              <button type="submit" class="btn btn-success">Выполнено</button>
            </li>

          </ul>
        </div>
      </div>
    </div>
  </div>
</body>
  <%@ include file="footer.jsp" %>
</html>



