/**
 * 2021 Anvanto
 *
 * NOTICE OF LICENSE
 *
 * This file is not open source! Each license that you purchased is only available for 1 wesite only.
 * If you want to use this file on more websites (or projects), you need to purchase additional licenses.
 * You are not allowed to redistribute, resell, lease, license, sub-license or offer our resources to any third party.
 *
 *  @author Anvanto <anvantoco@gmail.com>
 *  @copyright  2021 Anvanto
 *  @license    Valid for 1 website (or project) for each purchase of license
 *  International Registered Trademark & Property of Anvanto
 */
 
(function ($, window, undefined) {
    'use strict';

	$(document).ready(function(){
		hideshow();
		$('input[type=radio][name=type_icon]').change(function() {
			hideshow();
		});
	});
	
	function hideshow() {
		$('textarea#code').parents('.form-group').hide();
		$('input#file_icon').parents('.form-group').hide();
		if($("input[name='type_icon']:checked").val() == '1') {
			$('textarea#code').parents('.form-group').show();
		} else if($("input[name='type_icon']:checked").val() == '0') {
			$('input#file_icon').parents('.form-group').show();
		}
	}
	
})(jQuery, window);	
