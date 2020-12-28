<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="Brands" scope="request" type="java.util.List"/>
<!DOCTYPE html>
<html lang="en" dir="ltr">

  <jsp:include page="/header"/>
  <script src="/js/load-file.js">
    <%@include file="../../js/load-file.js"%>
  </script>
  <body>
  <!-- Title car -->

  <div class="container">
    <h1 class="mb-5 display-4 text-center">Добавление нового автомобиля</h1>
  </div>

  <!-- Catalog -->
  <div class="album py-5 bg-light">
    <div class="container content-container">

      <c:choose>
        <c:when test="${editCar==true}">
        <div class="editClass">
            <%--@elvariable id="Car" type="com.epam.rd.izh.dto.CarDto"--%>
          <form:form  method="POST" class="needs-validation" enctype="multipart/form-data" modelAttribute="Car" action="/catalog/editCar">
            <form:input  value="${carData.getCarId()}" class="form-control" type="hidden" path="carId" />
            <div class="col-md-12 mb-3">

              <div class="form-group">
                <label>Бренд авто</label>
                <select name="newBrandName" class="custom-select mr-sm-2" id="inlineFormCustomSelect">

                  <c:forEach var="brand" items="${Brands}">
                    <option>${brand.getBrandName()}</option>
                  </c:forEach>
                </select>
                <br>
              </div>
              <div>
                <a href="/catalog/addBrand" class="btn btn-primary">Добавить бренд</a>
              </div>
            </div>

            <div class="col-md-12 mb-3">
              <label>Модель авто</label>
              <form:input placeholder="Модель"  class="form-control" type="text" path="model" />
              <div class="valid-tooltip">
                <form:errors path="model" cssClass="error"/>
              </div>
            </div>

            <div class="form-row mb-3 pr-3 pl-3">
              <div class="col-4">
                <label>Городской расход</label>
                <form:input placeholder="Городской" value="${carData.getGasMileageCity()}" class="form-control" type="text" path="gasMileageCity" />
              </div>
              <div class="col-4">
                <label>Трасса</label>
                <form:input placeholder="Трасса" value="${carData.getGasMileageTrack()}" class="form-control" type="text" path="gasMileageTrack" />
              </div>
              <div class="col-4">
                <label>Смешанный</label>
                <form:input placeholder="Смешанный" value="${carData.getGasMileageMix()}" class="form-control" type="text" path="gasMileageMix" />
              </div>
            </div>

            <div class="col-md-12 mb-3">
              <label>Коробка передач</label>
              <form:input placeholder="Коробка передач" value="${carData.getTransmission()}" class="form-control" type="text" path="transmission" />
              <div class="valid-tooltip">
                <form:errors path="transmission" cssClass="error"/>
              </div>
            </div>


            <div class="col-md-12 mb-3">
              <label>Пробег</label>
              <form:input placeholder="Пробег" value="${carData.getMileage()}" class="form-control" type="text" path="mileage" />
              <div class="valid-tooltip">
                <form:errors path="mileage" cssClass="error"/>
              </div>
            </div>

            <div class="col-md-12 mb-3">
              <label>Номерной знак</label>
              <form:input placeholder="Номерной знак" value="${carData.getLicensePlate()}" class="form-control" type="text" path="licensePlate" />
              <div class="valid-tooltip">
                <form:errors path="licensePlate" cssClass="error"/>
              </div>
            </div>

            <div class="col-md-12 mb-3">
              <label>Описание мест в авто</label>
              <form:input placeholder="Описание мест в авто" value="${carData.getDescription()}" class="form-control" type="text" path="description" />
              <div class="valid-tooltip">
                <form:errors path="description" cssClass="error"/>
              </div>
            </div>

            <div class="col-md-12 mb-3">
              <label>Цена за час проката</label>
              <form:input placeholder="Цена за час проката" value="${carData.getSharingPrice()}" class="form-control" type="text" path="sharingPrice" />
              <div class="valid-tooltip">
                <form:errors path="sharingPrice" cssClass="error"/>
              </div>
            </div>

            <div class="col-md-12 mb-3">
              <label>Картинка авто</label>
              <form:input placeholder="Картинка авто" value="${carData.getImageUrl()}" class="form-control" type="text" path="imageUrl" />
              <div class="valid-tooltip">
                <form:errors path="imageUrl" cssClass="error"/>
              </div>

              <label>Статус аренды</label>
              <select name="rented" class="custom-select mr-sm-2">
                  <option>true</option>
                  <option>false</option>
              </select>
              <button class="mt-3 btn btn-primary" type="submit">Редактировать</button>
            </div>
          </form:form>
        </div>
        </c:when>
        <%-- else --%>
        <c:otherwise>
        <div class="addClass">
          <%--@elvariable id="Car" type="com.epam.rd.izh.dto.CarDto"--%>
          <form:form method="POST" class="needs-validation" enctype="multipart/form-data" modelAttribute="Car"
                     action="/catalog/addCar">

            <div class="col-md-12 mb-3">

              <div class="form-group">
                <label>Бренд авто</label>
                <select name="newBrandName" class="custom-select mr-sm-2">

                  <c:forEach var="brand" items="${Brands}">
                    <option>${brand.getBrandName()}</option>
                  </c:forEach>
                </select>
                <br>
              </div>
              <div>
                <a href="/catalog/addBrand" class="btn btn-primary">Добавить бренд</a>
              </div>
            </div>

            <div class="col-md-12 mb-3">
              <label>Модель авто</label>
              <input placeholder="Модель" name="model" type="text" class="form-control"/>
              <div class="valid-tooltip">
                <form:errors path="model" cssClass="error"/>
              </div>
            </div>

            <div class="form-row mb-3 pr-3 pl-3">
              <div class="col-4">
                <label>Городской расход</label>
                <input placeholder="Городской" name="gasMileageCity" type="text" class="form-control"/>
              </div>
              <div class="col-4">
                <label>Трасса</label>
                <input placeholder="Трасса" name="gasMileageTrack" type="text" class="form-control"/>

              </div>
              <div class="col-4">
                <label>Смешанный</label>
                <input placeholder="Смешанный" name="gasMileageMix" type="text" class="form-control"/>
              </div>
            </div>

            <div class="col-md-12 mb-3">
              <label>Коробка передач</label>
              <input placeholder="Коробка передач" name="transmission" type="text" class="form-control"/>
              <div class="valid-tooltip">
                <form:errors path="transmission" cssClass="error"/>
              </div>
            </div>


            <div class="col-md-12 mb-3">
              <label>Пробег</label>
              <input placeholder="Пробег" name="mileage" type="text" class="form-control"/>
              <div class="valid-tooltip">
                <form:errors path="mileage" cssClass="error"/>
              </div>
            </div>

            <div class="col-md-12 mb-3">
              <label>Номерной знак</label>
              <input placeholder="Номерной знак" name="licensePlate" type="text" class="form-control"/>
              <div class="valid-tooltip">
                <form:errors path="licensePlate" cssClass="error"/>
              </div>
            </div>

            <div class="col-md-12 mb-3">
              <label>Описание мест в авто</label>
              <input placeholder="Описание мест в авто" name="description" type="text" class="form-control"/>
              <div class="valid-tooltip">
                <form:errors path="description" cssClass="error"/>
              </div>
            </div>

            <div class="col-md-12 mb-3">
              <label>Цена за час проката</label>
              <input placeholder="Цена за час проката" name="sharingPrice" type="text" class="form-control"/>
              <div class="valid-tooltip">
                <form:errors path="sharingPrice" cssClass="error"/>
              </div>
            </div>

            <div class="col-md-12 mb-3">
              <label>Картинка авто</label>
              <input placeholder="Картинка авто" name="imageUrl" type="text" class="form-control"/>
              <div class="valid-tooltip">
                <form:errors path="imageUrl" cssClass="error"/>
              </div>
              <button class="mt-3 btn btn-primary" type="submit">Готово</button>
            </div>
          </form:form>

        </div>
        </c:otherwise>
      </c:choose>



<%--            <label>Изображение</label>--%>
<%--            <div class="col-md-12 mb-3 custom-file">--%>
<%--              <input type="file" id="file" name="file" class="custom-file-input" onchange="on()">--%>
<%--              <label class="custom-file-label" for="customFile" onClick="ftt()" id="foto" placeholder="Описание">Картинка--%>
<%--                автомобиля</label>--%>
<%--            </div>--%>

<%--            <button class="btn btn-primary" type="submit">Добавить</button>--%>



<%--        <form method="POST" enctype="multipart/form-data"--%>
<%--              action="/catalog/addCar">--%>
<%--          File to upload: <label>Изображение</label>--%>
<%--          <div class="col-md-12 mb-3 custom-file">--%>
<%--            <input type="file" id="file" class="custom-file-input" onchange="on()" id="customFile">--%>
<%--            <label class="custom-file-label" for="customFile" onClick="ftt()" id="foto" placeholder="Описание">Картинка--%>
<%--              автомобиля</label>--%>
<%--          </div>--%>
<%--          <button class="btn btn-primary" type="submit">Добавить</button>--%>
<%--        </form>--%>

    </div>
  </div>



  </body>

  <%@ include file="footer.jsp" %>
</html>



