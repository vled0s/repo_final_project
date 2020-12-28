function openSelectFile() {
    $('#file').click(); // emulate click on input file
}
function fileSendToServer() {
    var ft = $('#file')[0].files[0].name;
    $('#foto')[0].textContent = ft;
    crearEmp();
}

function crearEmp() {
    var file = $('#file')[0].files;

    if (file.length != 1) {
        $('.invalid-feedback')[0].innerHTML = "You can load one file";
        jQuery('#validationServer04').addClass('is-invalid').removeClass('is-valid');
    } else {
        if (file[0].type === "image/jpeg" || file[0].type === "image/webp") {

            uploadFile(file[0]);
            jQuery('.custom-file-input').addClass('is-valid').removeClass('is-invalid');
        } else {
            $('.invalid-feedback')[0].innerHTML = "Use format file jpeg or webp";
            jQuery('.custom-file-input').addClass('is-invalid').removeClass('is-valid');
        }

    }


}

function uploadFile(file) {
    var fd = new FormData();
    fd.append('file', file);

    $.ajax({
        url: "/uploadForm",
        data: fd,
        processData: false,
        contentType: false,
        type: 'POST',
        success: function(path)
        {
            $('#foto')[0].textContent = path;
            $('#imageUrl')[0].value = path;
        }
    });
}