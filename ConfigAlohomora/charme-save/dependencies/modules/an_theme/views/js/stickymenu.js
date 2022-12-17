

$(document).ready(function() {
	if($('div').is("#amegamenu")){
		var scrollHeight = $('#amegamenu').offset().top;

		$(window).on('load resize scroll', function() {
			var headerHeight = $('.header-top').outerHeight();
			if ($(window).width() >= 1024 && $(window).scrollTop() > scrollHeight) {
				$('#amegamenu').addClass('fixed-menu');
				$('.fixed-menu-container').addClass('container');
				$('.header-top').css('height', headerHeight + 'px');
			} else {
				$('#amegamenu').removeClass('fixed-menu');
				$('.fixed-menu-container').removeClass('container');
				$('.header-top').css('height', 'auto');
			}
		});
	}
});

