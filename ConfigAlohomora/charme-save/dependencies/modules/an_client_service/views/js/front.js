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
$(document).ready(function(){
	// open modal
    var wrap = $('#wrapper'),
    btn = $('.clientservice_open-modal-btn'),
    modal = $('.clientservice_sg-cover, .clientservice_sg-modal, .an_clientservice');

    $(document).on('click', '.clientservice_open-modal-btn', function(event) {
        $('html').addClass('clientservice_sg-open');
        modal.fadeIn();
    });

    // close modal
    $('.clientservice_sg-modal').click(function() {
        var select = $('.an_clientservice');
        if ($(event.target).closest(select).length)
        return;
        modal.fadeOut(function () {
            $('html').removeClass('clientservice_sg-open');
        });
        
    });
    $('.clientservice_sg-btn-close').on('click', function(event) {
        modal.fadeOut(function () {
            $('html').removeClass('clientservice_sg-open');
        });
    });
    
});