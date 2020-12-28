<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">

  <jsp:include page="/header"/>
    <script charset="utf-8"><%@include file="../../js/load-file.js"%></script>
  <body>
  <!-- Title car -->

  <div class="container">
    <h1 class="mb-5 display-4 text-center">Добавить новый бренд </h1>
  </div>

  <!-- Catalog -->
  <div class="album py-5 bg-light">
    <div class="container content-container">


        <div class="addClass">
          <%--@elvariable id="Car" type="com.epam.rd.izh.dto.CarDto"--%>
          <form:form method="POST" class="needs-validation" enctype="multipart/form-data" modelAttribute="Car"
                     action="/catalog/addBrand">



              <label>Имя бренда</label>
              <input placeholder="Бренд" name="brandName" type="text" class="form-control mb-3"/>

            <label>Картинка автомобиля</label>
            <div class="col-md-12 mb-3">

              <input type="file" id="file" onchange="fileSendToServer()" required="" class="custom-file-input is-invalid">
              <div class="invalid-feedback"></div>
              <label class="custom-file-label" onclick="openSelectFile()" id="foto" placeholder="Описание">Картинка автомобиля</label>
            </div>
            <input name="imageUrl" id="imageUrl" type="hidden" class="form-control"/>
            <button class="mt-3 btn btn-primary" type="submit">Готово</button>

          </form:form>


        </div>
    </div>
  </div>



  </body>

  <%@ include file="footer.jsp" %>
</html>



