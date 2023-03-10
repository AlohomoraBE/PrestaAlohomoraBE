/**
 * 2007-2015 PrestaShop
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License (AFL 3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * http://opensource.org/licenses/afl-3.0.php
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to http://www.prestashop.com for more information.
 *
 *  @author    Anvanto (anvantoco@gmail.com)
 *  @copyright 2007-2018  http://anvanto.com
 *  @license   http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
 */
function defer(method) {
    if (window.jQuery)
        setTimeout(function() { method();}, 1);
    else
        setTimeout(function() { defer(method); }, 1);
}

defer(function () {
    jQuery(document).ready(function(){
        jQuery('#form_switch_language').change(function(){
            jQuery('.translation-field').hide();
            jQuery('.translationsFields .tab-pane').hide();
            jQuery('.translation-label-' + jQuery(this).val()).show();
            jQuery('.mce-tinymce iframe').css('height','176px');
        });
        jQuery('.lang-1').show();
        jQuery('.lang-1').parent().parent().show();
        jQuery('#form_switch_language').change();
    });
});
