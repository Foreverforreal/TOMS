
jQuery(document).ready(function() {
	
    /*
        Fullscreen background
    */
    $.backstretch([
                    "resources/login/img/backgrounds/2.jpg"
	              , "resources/login/img/backgrounds/1.jpg"
	             ], {duration: 3000, fade: 750});
    
    /*
        Form validation
    */
    $('.form-control input[type="text"], .form-control input[type="password"], .form-control textarea').on('focus', function() {
    	$(this).removeClass('has-error');
    });

    $('form').on('submit', function(e) {

        $(this).find('div.form-group').each(function(i,item){
            if( $('input').val() == "" ) {
                e.preventDefault();
                $(item).addClass('has-error');
            }
            else {
                $(item).removeClass('has-error');
            }
        });

    });

});
