
function deleteCar(idCar) {
    $.ajax({
        type: "DELETE",
        url: "/catalog/deleteCar",
        data: "idCar=" + idCar,
        success: function(msg){
            alert(msg);
        }
    });
}

