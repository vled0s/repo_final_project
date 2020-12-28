<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="if" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<jsp:include page="/header"/>

<body>
<!-- Title car -->
<div class="container">
  <h1 class="mb-5 display-4 text-center">Оформление аренды автомобиля</h1>
</div>

<!-- Catalog -->
<div class="album py-4 bg-light">



  <div class="container">
    <p class="lead text-left">Ваш выбранный автомобиль ${carData.getCarBrand().getBrandName()} ${carData.getModel()}: </p>

    <div class="row">
      <div class="col item ">
        <img class="w-75 float-right"
             src="${carData.getImageUrl()}">
      </div>
      <div class="col item">
        <ul>

          <li>${carData.getDescription()}</li>
          <li>Трансмиссия ${carData.getTransmission()}</li>
          <li>Расход ${carData.getGasMileageCity()}/${carData.getGasMileageTrack()}/${carData.getGasMileageMix()}</li>
          <li>Номерной знак ${carData.getLicensePlate()}</li>
          <li>Пробег ${carData.getMileage()} км</li>

        </ul>
      </div>
    </div>
  </div>



  <div class="container">
  <%--@elvariable id="HistorySharing" type="com.epam.rd.izh.entity.HistorySharing"--%>
  <form:form  method="POST" class="needs-validation" enctype="multipart/form-data" modelAttribute="HistorySharing" action="/catalog/registerSharing">

    <div class="form-group">
      <label>Введите дату начала аренды:</label>
      <div class="form-group">
        <div class="input-group date" id="datetimepickerStartSharing">
          <input name="startSharingDate" type="text" class="form-control">
          <div class="input-group-addon input-group-prepend">
            <span class="input-group-text"><i class="fas fa-calendar"></i></span>
          </div>
        </div>
      </div>
    </div>
      <div class="form-group">
        <label>Введите дату окончания аренды:</label>
        <div class="form-group">
          <div class="input-group date" id="datetimepickerEndSharing">
            <input name="endSharingDate" type="text" class="form-control">
            <div class="input-group-addon input-group-prepend">
              <span class="input-group-text"><i class="fas fa-calendar"></i></span>
            </div>
          </div>
        </div>
      </div>

      <div class="form-inline">
        <h3>Стоимость аренды:&nbsp;</h3>
        <h2 class="card-title pricing-card-title"> -</h2>
      </div>

      <input type="hidden" name="carId" value="${carData.getCarId()}"/>


      <button type="submit" class="btn btn-success">Арендовать</button>
  </form:form>
  </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.26.0/moment.min.js"></script>
<script><%@include file="../js/moment-with-locales.min.js"%></script>
<script><%@include file="../js/bootstrap-datetimepicker.min.js"%></script>
<script>
  $(function () {
    $.extend(true, $.fn.datetimepicker.defaults, {
      icons: {
        time: 'far fa-clock',
        date: 'far fa-calendar',
        up: 'fas fa-arrow-up',
        down: 'fas fa-arrow-down',
        previous: 'fas fa-chevron-left',
        next: 'fas fa-chevron-right',
        today: 'far fa-calendar-check-o',
        clear: 'far fa-trash',
        close: 'far fa-times'
      }
    });
  });
</script>

<script type="text/javascript">
  $(function () {
    $('#datetimepickerStartSharing').datetimepicker({format:'Y-M-D HH:mm', locale: 'ru'});
  });

  $(function () {
    $('#datetimepickerEndSharing').datetimepicker({format:'Y-M-D HH:mm', locale: 'ru'}).on('dp.change', function (e)
    {
        calculatePrice();
    });
  });

  function calculatePrice() {
      var dateStart = new Date($('#datetimepickerStartSharing')[0].children[0].value);
      var dateEnd = new Date($('#datetimepickerEndSharing')[0].children[0].value);
      var dateDifference = dateEnd - dateStart;
      var sharingPrice = parseInt(${carData.getSharingPrice()}, 10);

      if(dateDifference <= 0) {
        $('.pricing-card-title')[0].innerHTML = " - рублей";
      } else {
        $('.pricing-card-title')[0].innerHTML = ((dateEnd - dateStart)/1000/60/60 * sharingPrice).toFixed(2) + " рублей";
      }
  }

</script>
</body>

  <%@ include file="footer.jsp" %>
  <script><%@include file="../js/car-requester.js"%></script>
</html>