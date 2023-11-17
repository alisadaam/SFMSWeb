
$(document).ready(function() {
    $(document).on('click', '.AllRolesDeleteRole', function (e) {
        e.preventDefault();

        if (!confirm("Are you sure you want to delete?"))
            return;
       
        var roleId = $(this).data('id');
        var url = $(this).data('url') + '/' + roleId;
        try {
            $.ajax({
                type: 'POST',
                url: url,
                success:function(data) {
                    ShowJsonOutPut(data,'div#rolesList');
                },
                error:function() {
                    
                }
            });

        } catch (e) {
            
        } 
    });
});

