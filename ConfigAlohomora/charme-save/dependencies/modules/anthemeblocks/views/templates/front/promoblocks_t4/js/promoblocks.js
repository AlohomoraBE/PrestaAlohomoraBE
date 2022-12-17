$(document).ready(function(){
	$('.promoblocks-item').each(function (index) {
        if (index%2) {
            $(this).css('max-width','950px');
        } 
    });
});