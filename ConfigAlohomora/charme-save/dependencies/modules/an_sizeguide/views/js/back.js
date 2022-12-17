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

    function anproducts() {
        var loc = location.pathname.split('/');
        loc.pop();

        var ajax_get_products = function (q) {
      
            return $.get(location.origin+loc.join('/')+'/'+'ajax_products_list.php?forceJson=1&disableCombination=1&exclude_packs=0&excludeVirtuals=0&limit=20&token='+an_sizeguide.token+'&q='+q);
        };
        var promise = $.when();
        var ptreeinput = $('#products_input').closest('.form-group');
        ptreeinput.children('div').append($('<ul id="an_sizeguide_ajax-product-list" class="an_sizeguide_ajax_product_list"></ul>'));

        $('#an_sizeguide_ajax-product-list').on('click', 'li', function () {
			
			var name = $(this).find('.label').html();
			var img = $(this).find('img').attr('src');
			var id = $(this).data('id');
			
			$('.js-an_sizeguide_products').append('<div class="js-an_sizeguide_products-line an_sizeguide_products-line"><input type="hidden" name="productIds[]" value="'+id+'" /><div class="label">'+name+' <i class="material-icons delete js-an_sizeguide_products-remove">delete</i></div></div>');
			
			$('.js-sz-block-products').val('');
            $('#an_sizeguide_ajax-product-list').html('');
        });
        $('#products_input').on('keyup', function () {
            var q = $(this).val();
            (function (value) {
                promise = promise.then(function () {
                    return ajax_get_products(q);
                }).then(function (response) {
                    if (!response) {
                        return false;
                    }
                    (function (products) {
                        ptreeinput.find('#an_sizeguide_ajax-product-list').html('');
                        $.each(products, function (i, product) {
                            ptreeinput.find('#an_sizeguide_ajax-product-list').append($('' +
                                '<li data-id="'+product.id+'">' +
                               // '<img src="'+product.image+'">' +
                                '<div class="label">'+product.name+'' + '</div>' +
                                '</li>').on('click', function () {
                            }));
                        });
                    })(JSON.parse(response));
                });
            })(q);
        });

    };
	$(document).ready(function() {
        anproducts();
		showHideFiels();
		
		$(document).on('click', '.js-an_sizeguide_products-remove', function(){
			$(this).closest('.js-an_sizeguide_products-line').remove();
		});		
		
		$('.an-sz-type-view input').on('click', function(){

			showHideFiels();
		});		
		
		function showHideFiels(){
			
			$('.form-group .js-sz-block-products').each(function(){
				$(this).parents('.form-group').hide();
			});			
			
			
			$('#id_root_category').parents('.form-group').hide();
					
			
			var relation = $('.an-sz-type-view input[name=relation]:checked').val();
			
			switch (relation) {
				
				case "1":
				$('#id_root_category').parents('.form-group').show();
				break;
				
				case "2":
				$('.form-group .js-sz-block-products').each(function(){
					$(this).parents('.form-group').show();
				});
				break;				
			}
		}

		//js-sz-block-products	an-sz-type-view
		
	});
	
})(jQuery, window);	
