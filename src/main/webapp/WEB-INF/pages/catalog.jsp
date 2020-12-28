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
    <div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto ">
      <h1 class="mb-5 display-4 text-center">Авто в аренду</h1>
      <p class="lead">Отличные автомобили по привлекательной цене. Обслуживание транспортного средства берёт на себя
        компания, с вас только вождение по правилам с комфортом.</p>
    </div>


    <!-- Catalog -->

    <div class="py-5">
      <div class="container">
        <h1 class="display-4 text-center">Марки автомобилей в наличии</h1>

        <ul class="nav justify-content-center">
          <jsp:useBean id="carBrands" scope="request" type="java.util.List"/>
          <c:forEach var="brand" items="${carBrands}" >
            <li class="nav-item">
              <a class="nav-link active"
                 href="/catalog/${brand.getBrandName()}">${brand.getBrandName()}</a>
            </li>
          </c:forEach>
        </ul>
      </div>
    </div>
  </div>
</body>

  <%@ include file="footer.jsp" %>

</html>



