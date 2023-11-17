var JsonMessage = {
    Status : false,
    Message : "",
    Script : ""
}
var timeoutalert;
function ShowJsonOutPut(data, targetId, callback) {
    if (data != null && typeof data == 'object') {
        if (data.Html != null && data.Html != "") {
            $('' + targetId + '').html(data.Html);
        }
       if (data.Message != null && data.Message != '') {
           $('#alertMessage').html(CreateMessage(data.Status, data.Message));
           timeoutalert =  setTimeout(function() {
               $("#alertMessage").hide("slow", function () {
                   $('#alertMessage').html('');
               });
           }, 5000);
           setTimeout(function() {
               clearTimeout(timeoutalert);
           }, 5000);
            if (data.Script != null && data.Script != "") {
                var execute = eval("(" + data.Script + ")");
                execute();
            }
            
            return true;
       }
      
    }
    return false;
}
function ShowErrorMessage(text) {
   $('#alertMessage').html('<div class="alert alert-danger alert-dismissable"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>' + text + '</div>');
}
function ClearErrorMessage() {
    $('#alertMessage').html('');
}

function CreateMessage(status,message) {
    
    var msgHtml = '<div class="alert {{C}} alert-dismissable"><i class="fa {{I}}"></i><button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button><b>{{T}}!</b>{{M}}</div>';
        //Error
    if (status == 0) {
        return msgHtml.replace("{{C}}", "alert-danger").replace("{{I}}", "fa-ban").replace("{{T}}", "Error").replace("{{M}}", message);
    }
        // Success
    else if (status == 1) {
        return msgHtml.replace("{{C}}", "alert-success").replace("{{I}}", "fa-check").replace("{{T}}", "Success").replace("{{M}}", message);
    }
        // Warning
    else if (status == 2) {
        return msgHtml.replace("{{C}}", "alert-warning").replace("{{I}}", "fa-warning").replace("{{T}}", "Warning").replace("{{M}}", message);
    }
        // Alert
    else {
        return msgHtml.replace("{{C}}", "alert-info").replace("{{I}}", "fa-info").replace("{{T}}", "Alert").replace("{{M}}", message);
    }

}
function lunchWindow(url) {
    try {
        url = "" + url + "";
        console.log(url);
        window.open(url,"ModalPopUp","toolbar=no,scrollbars=no,location=no,statusbar=no,menubar=no");
    } catch (e) {
        alert(e.message);
    } 
}

$(document).ready(function() {
    $('body').on('focus', ".datepicker", function () {
        $(this).datepicker({
            format: 'dd/mm/yyyy'
        });
        //console.log("datepicker");
    });
    $('body').on('keypress', ".datepicker", function () {
        return false;
    });
    $('body').on('keydown', ".datepicker", function () {
        return false;
    });
    // for numbers only textbox
    $(document).on("keypress", '.numbersonly', function (e) {
        if ($(this).val().length < 10) {
            var keyCode = e.which ? e.which : e.keyCode;
            var specialKeys = new Array();
            specialKeys.push(8);
            var ret = ((keyCode >= 48 && keyCode <= 57) || specialKeys.indexOf(keyCode) != -1);
            return ret;
        }
        return false;
    });

    var selectPage = 'a[href = "' + $('#selectPage').val() + '"]';
    $(selectPage).each(function () {
        $(this).addClass("active");
        $(this).parent('li').addClass("active");
        $(this).parents('ul.treeview-menu').each(function () {
            $(this).css("display", "block");
            $(this).addClass("active");
            $(this).parent('li').addClass("active");
        });
    });

});

//[-Disable Right Click-]//
$(document).ready(function () {
    //$(document).bind("contextmenu", function (e) {
      //  e.preventDefault();
    //});

    document.msFullscreenEnabled = true;
});


