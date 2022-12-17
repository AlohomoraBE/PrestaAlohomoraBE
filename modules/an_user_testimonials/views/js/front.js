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
    $(document).off('click', '.open-modal-btn').on('click', '.open-modal-btn', function(event) {
        if (!$('.scroll-example').length) {
            $('html').append('<div class="scroll-example" style="overflow-y: scroll; visibility: hidden; height: 0px;"></div>');
        }
        if (!$('.an-sg-offset-style').length) {
            let scroll_example, scroll_width;
            scroll_example = $('.scroll-example');
            scroll_width = scroll_example[0].offsetWidth - scroll_example[0].clientWidth;
            $('head').append($('<style>').addClass('an-sg-offset-style').html('.sg-open{padding-right:' + scroll_width + 'px;}'));
        }

        $('body').addClass('sg-open');
        $(this).parents('.an_sg').find('.sg-cover, .sg-modal, .an_sizeguide').fadeIn();
    });

    // close modal
    $(document).off('click', '.sg-modal').on('click', '.sg-modal', function() {
        if (!$('.sg-closing').length) {
            var select = $('.an_sizeguide');
            if ($(event.target).closest(select).length)
                return;
            $('body').addClass('sg-closing');
            $('.sg-cover, .sg-modal, .an_sizeguide').fadeOut(400);
            setTimeout(function () {
                $('body').removeClass('sg-closing');
                $('body').removeClass('sg-open');
            }, 400);
        }
    });
    $(document).off('click', '.sg-btn-close').on('click', '.sg-btn-close', function(event) {
        if (!$('.sg-closing').length) {
            $('body').addClass('sg-closing');
            $('.sg-cover, .sg-modal, .an_sizeguide').fadeOut(400);
            setTimeout(function () {
                $('body').removeClass('sg-closing');
                $('body').removeClass('sg-open');
            }, 400);
        }
    });


    $( document ).ajaxStop(function() {
        $(document).off('click', '.open-modal-btn').on('click', '.open-modal-btn', function(event) {
            if (!$('.scroll-example').length) {
                $('html').append('<div class="scroll-example" style="overflow-y: scroll; visibility: hidden; height: 0px;"></div>');
            }
            if (!$('.an-sg-offset-style').length) {
                let scroll_example, scroll_width;
                scroll_example = $('.scroll-example');
                scroll_width = scroll_example[0].offsetWidth - scroll_example[0].clientWidth;
                $('head').append($('<style>').addClass('an-sg-offset-style').html('.sg-open{padding-right:' + scroll_width + 'px;}'));
            }

            $('body').addClass('sg-open');
            $(this).parents('.an_sg').find('.sg-cover, .sg-modal, .an_sizeguide').fadeIn();
        });

        // close modal
        $(document).off('click', '.sg-modal').on('click', '.sg-modal', function() {
            if (!$('.sg-closing').length) {
                var select = $('.an_sizeguide');
                if ($(event.target).closest(select).length)
                    return;
                $('body').addClass('sg-closing');
                $('.sg-cover, .sg-modal, .an_sizeguide').fadeOut(400);
                setTimeout(function () {
                    $('body').removeClass('sg-closing');
                    $('body').removeClass('sg-open');
                }, 400);
            }
        });
        $(document).off('click', '.sg-btn-close').on('click', '.sg-btn-close', function(event) {
            if (!$('.sg-closing').length) {
                $('body').addClass('sg-closing');
                $('.sg-cover, .sg-modal, .an_sizeguide').fadeOut(400);
                setTimeout(function () {
                    $('body').removeClass('sg-closing');
                    $('body').removeClass('sg-open');
                }, 400);
            }
        });
    });

});
