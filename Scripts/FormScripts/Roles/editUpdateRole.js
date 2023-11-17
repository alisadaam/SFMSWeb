$(document).ready(function () {
    var roleName = true;
    $('#addRoleForm').on('click', '#btnAddRole', function () {
        var roleAccess = JSON.stringify(GetFormRoleAccess());
        var roleId = $('#RoleId').val();

        if (isNaN(roleId)) {
            return;
        }
        var url = $('#updateRole').val();
        try {
         
        $.ajax({
            type: "POST",
            url:url,
            data: { AccessType: roleAccess, RoleId: roleId },
            success : function(returnData) {
                ShowJsonOutPut(returnData,ClearForm);
            },
            error:function(abc) {
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
        var selectItem = $(this).find('select');
            roleAccess.FormId = checkbox.val();
            roleAccess.AccessType = selectItem.val();
            data.push(roleAccess);
        
    });
    return data;
}

function ClearForm() {
    //window.location.href = window.location.href;
}