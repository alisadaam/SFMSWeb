$(document).ready(function () {
    var roleName = true;
    $('#addRoleForm').on('click', '#btnAddRole', function () {
        var roleAccess = JSON.stringify(GetFormRoleAccess());
        var url = window.location.href;
        if (roleAccess == "[]" || $('#roleName').val().trim() == "") {
            var msg = "";
            if (roleAccess == "[]")
                msg += "Role access selection is required";
            if ($('#roleName').val().trim() == "") {
                msg += "\nRole Name is required";
            }
            alert(msg);
            return;
        }
        if (roleName == true) {
            alert("Please try antoher Role Name.Role Name already exist.");
            return;
        }
        try {
         
        $.ajax({
            type: "POST",
            url:""+url,
            data: { AccessType: roleAccess, RoleName: $('#roleName').val() },
            success : function(returnData) {
                if (returnData.Status) {
                    ClearForm();
                }
                alert(returnData.Message);
            },
            error:function(abc) {
                alert(JSON.stringify(abc));
            }
        });

        } catch (e) {
            alert(e.toString());
        }
    });
    $('#addRoleForm').on('focusout', '#roleName', function () {
        try {
           
            if ($('#roleName').val().trim() == "") {
                $('#showMessage').html('');
                return;
            }
                
            $.ajax({
                type: "POST",
                url: $('#hfisExisting').val(),
                data: { RoleName: $('#roleName').val() },
                success: function (returnData) {
                    if (returnData == false) {
                        //<i class="fa fa-check"></i>
                        $('#showMessage').html('<div class="alert alert-success alert-dismissable inline NoPaddingMargin"  style="padding-left: 25px !important;" ><i class="fa fa-check"></i>Role Name doesnot exist. You can create this Role Name .</div>');
                        roleName = false;
                    } else {
                        //<i class="fa fa-ban"></i>
                        $('#showMessage').html('<div class="alert alert-danger alert-dismissable inline NoPaddingMargin" style="padding-left: 25px !important;" ><i class="fa fa-ban"></i>Role Name already exist. Try another role name.</div>');
                        roleName = true;
                    }
                },
                error: function (abc) {
                    alert(JSON.stringify(abc));
                }
            });

        } catch (e) {
            alert(e.toString());
        }
    });

});

function GetFormRoleAccess() {
    var data = [];
    $('#tblformtoroleassignment tr.role').each(function () {
        var roleAccess = {};
        var checkbox = $(this).find('input[type="checkbox"]');
        if (checkbox.is(":checked")) {
            var selectItem = $(this).find('select');
            if (selectItem.val() != "0") {
                roleAccess.FormId = checkbox.val();
                roleAccess.AccessType = selectItem.val();
                data.push(roleAccess);
            }
        }
    });
    return data;
}

function ClearForm() {
    $('#roleName').val("");
    $('.content input[type="checkbox"]').prop('checked', false);
    $('.content div.icheckbox_minimal').removeClass('checked');
    $('.content select').val('0');
    $('#showMessage').html('');
}