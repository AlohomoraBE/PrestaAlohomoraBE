$(document).ready(function(){
	$('.anthemeblocks-homeslider').addClass('owl-carousel');

	$('.anthemeblocks-homeslider').each(function(i, val) {
		var anhbhl_id = '#'+$(this).attr('id');
		$(anhbhl_id).owlCarouselAnTB({
			items: $(anhbhl_id).data('items'),
			loop: $(anhbhl_id).data('loop'),
			nav: $(anhbhl_id).data('nav'),
			dots: $(anhbhl_id).data('dots'),
			autoplay: $(anhbhl_id).data('autoplay'),
			navText: ['<svg \n xmlns="http://www.w3.org/2000/svg"\n xmlns:xlink="http://www.w3.org/1999/xlink"\n width="29px" height="55px">\n <path fill-rule="evenodd"  fill="rgb(212, 213, 217)"\n d="M29.000,53.503 L3.005,27.500 L29.000,1.496 L27.492,-0.012 L-0.012,27.500 L27.492,55.011 L29.000,53.503 Z"/>\n </svg>',
				'<svg \n  xmlns="http://www.w3.org/2000/svg"\n xmlns:xlink="http://www.w3.org/1999/xlink"\n width="30px" height="56px">\n <path fill-rule="evenodd"  fill="rgb(212, 213, 217)"\n d="M0.500,53.855 L26.355,28.000 L0.500,2.144 L2.000,0.644 L29.355,28.000 L2.000,55.355 L0.500,53.855 Z"/>\n </svg>'],
			autoplayTimeout: $(anhbhl_id).data('autoplaytimeout'),
			navContainer: anhbhl_id+' .owl-stage-outer',
				//	animateOut: 'slideOutDown',
		//    animateIn: 'rotateIn',
		});
		$(this).parent('.anthemeblocks_homeslider-block').addClass('initialized');
	});	
});