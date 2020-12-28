<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="if" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">

  <jsp:include page="/header"></jsp:include>

<body>
  <div class="content-container">
    <!-- Title car -->
    <div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
      <jsp:useBean id="brand" scope="request" type="com.epam.rd.izh.entity.Brand"/>
      <div style="flex-direction: row;font-size: 75px;text-align: center;">
        <img src="${brand.imageUrl}"
             style="width: 10%;align-items: center;margin-top: -15px;">
        ${brand.brandName}
      </div>

      <p class="lead">Автомобили BMW — весь модельный ряд и цены моделей</p>
    </div>

    <!-- Catalog -->
    <div class="album py-5 bg-light">
      <div class="container">

        <div class="row">
          <jsp:useBean id="cars" scope="request" type="java.util.List"/>
          <c:forEach var="car" items="${cars}" >
          <div class="col-md-4">

            <div class="card mb-4 shadow-sm">
              <h2 style="height: 100%; width: 100%;" class="display-5 text-item-car">${car.getCarBrand().getBrandName()} ${car.getModel()}</h2>
              <img class="item-car"
                   src="${car.getImageUrl()}">
              <div class="card-body">
                <div class="card-text">${car.getDescription()}</div>
                <div class="card-text">${car.getTransmission()}</div>
                <div class="card-text">${car.getGasMileage()}</div>
                <div class="card-text">${car.getLicensePlate()}</div>
                <div class="card-text">Пробег: ${car.getMileage()}</div>
                <div class="mb-2 d-flex justify-content-between align-items-center">
                  <div class="btn-group">
                    <form action="/catalog/register-sharing/${car.getCarId()}">
                      <button type="submit" class="btn btn-sm btn-success">Арендовать</button>
                    </form>
                  </div>
                  <small class="text-muted">${car.getSharingPrice()} руб/час</small>
                </div>
                <sec:authorize access="hasAuthority('write')">
                  <form action="/catalog/editCar/${car.getCarId()}">
                    <button type="submit" class="mb-2 btn btn-sm btn-success">Редактировать</button>
                  </form>

                  <button type="button" onclick='deleteCar(${car.getCarId()})' class="btn btn-sm btn-success">Удалить из каталога</button>

                </sec:authorize>

              </div>
            </div>
          </div>
          </c:forEach>
        </div>
      </div>
    </div>
  </div>
  </body>
  <%@ include file="footer.jsp" %>
  <script><%@include file="../js/car-requester.js"%></script>
</html>



