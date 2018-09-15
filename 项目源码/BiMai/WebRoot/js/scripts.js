
jQuery(document).ready(function() {

    $('.page-container form').submit(function(){
        var admin_name = $(this).find('.admin_name').val();
        var admin_password = $(this).find('.admin_password').val();
        if(admin_name == '') {
            $(this).find('.error').fadeOut('fast', function(){
                $(this).css('top', '27px');
            });
            $(this).find('.error').fadeIn('fast', function(){
                $(this).parent().find('.admin_name').focus();
            });
            return false;
        }
		
        if(admin_password == '') {
            $(this).find('.error').fadeOut('fast', function(){
                $(this).css('top', '96px');
            });
            $(this).find('.error').fadeIn('fast', function(){
                $(this).parent().find('.admin_password').focus();
            });
            return false;
        }
    });

    $('.page-container form .admin_name, .page-container form .admin_password').keyup(function(){
        $(this).parent().find('.error').fadeOut('fast');
    });

});
