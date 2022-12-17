/**
 * 2022 Anvanto
 *
 * NOTICE OF LICENSE
 *
 * This file is not open source! Each license that you purchased is only available for 1 wesite only.
 * If you want to use this file on more websites (or projects), you need to purchase additional licenses.
 * You are not allowed to redistribute, resell, lease, license, sub-license or offer our resources to any third party.
 *
 *  @author Anvanto <anvantoco@gmail.com>
 *  @copyright  2022 Anvanto
 *  @license    Valid for 1 website (or project) for each purchase of license
 *  International Registered Trademark & Property of Anvanto
 */

$(document).ready(function(){
	$('.anut-block').each(function(i, val) {
		var anut_id = '#'+$(this).attr('id');
		$(anut_id).owlCarouselAnTB({
			items: "1",
			loop: $(anut_id).data('loop'),
			nav: $(anut_id).data('nav'),
			dots: $(anut_id).data('dots'),
			autoplay: $(anut_id).data('autoplay'),
			navText: ['<i class="material-icons">&#xE314;</i>','<i class="material-icons">&#xE315;</i>'],
			autoplayTimeout: $(anut_id).data('autoplaytimeout'),
			navContainer: anut_id+' .owl-stage-outer',
		});
	});	
});