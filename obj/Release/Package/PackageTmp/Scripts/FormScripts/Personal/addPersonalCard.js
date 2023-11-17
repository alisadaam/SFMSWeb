$(document).ready(function () {
    $(document).on('click', '#btnPakNo', function () {
        try {
        if (!checkPakNotext()) {
            return;
        }
        var pakNo = $('#PakNo').val().trim();
        var getUrl = $('#urlPakNo').val();
        $.ajax({
            type: 'POST',
            data: { PakNo: pakNo },
            url: getUrl,
            success: function (data) {
                if (data == null || data == "") {
                    $('#paknodetails').html('');
                    $('#paknodetails').css('display', 'none');
                    $('input[type="submit"]').addClass('disabled');
                    $('input[type="submit"]').attr('disabled', 'disabled');
                } else {
                    $('#paknodetails').html(data);
                    $('#paknodetails').css('display', 'block');
                    $('input[type="submit"]').removeClass('disabled');
                    $('input[type="submit"]').removeAttr('disabled');
                }
            },
            error : function() {
               
            }

        });
        } catch (e) {
            alert(e.toString());
        }
    });
    $(document).on('focusout', '#PakNo', function() {
        checkPakNotext();
    });
    checkPakNotext();
    function checkPakNotext() {
        var pakNo = $('#PakNo').val().trim();
        if (pakNo == "" || pakNo == null) {
            $('#btnPakNo').addClass('disabled');
            $('#btnPakNo').attr('disabled', 'disabled');
            $('input[type="submit"]').addClass('disabled');
            $('input[type="submit"]').attr('disabled', 'disabled');
            $('#paknodetails').html('');
            $('#details').css('display', 'none');
            return false;
        } else {
            $('#btnPakNo').removeClass('disabled');
            $('#btnPakNo').removeAttr('disabled');
           
            return true;
        }
    }
});