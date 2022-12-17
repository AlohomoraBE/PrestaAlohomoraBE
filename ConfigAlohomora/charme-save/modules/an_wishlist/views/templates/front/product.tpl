{**
	* 2019 Anvanto
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
	*  @author Anvanto (anvantoco@gmail.com)
	*  @copyright  2019 anvanto.com
	
	*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
	*  International Registered Trademark & Property of PrestaShop SA
	*}
	
	<div class="an_wishlist-mini js-an_wishlist-container {if (isset($smarty.get.view) and $smarty.get.view == 'rightcol') or (Module::isEnabled('an_theme') and Module::getInstanceByName('an_theme')->getParam('productslider_minisPos') == 'right')}an_wishlist-right{/if}">
		<span class="js-an_wishlist-addremove{if $status} an_wishlist-in{/if}" data-url="{$an_wishlistAjax|escape:'quotes'}">
	     <svg class="an_wishlist-icon"
          xmlns="http://www.w3.org/2000/svg"
          xmlns:xlink="http://www.w3.org/1999/xlink"
          width="19px" height="16px">
         <path fill-rule="evenodd"  fill="rgb(0, 0, 0)"
          d="M13.640,-0.000 C12.022,-0.000 10.508,0.646 9.500,1.728 C8.492,0.646 6.978,-0.000 5.361,-0.000 C2.405,-0.000 -0.000,2.121 -0.000,4.729 C-0.000,6.771 1.380,9.133 4.102,11.749 C6.196,13.762 8.475,15.321 9.124,15.751 L9.500,16.000 L9.876,15.751 C10.525,15.321 12.803,13.762 14.898,11.749 C17.620,9.133 19.000,6.771 19.000,4.729 C19.000,2.121 16.595,-0.000 13.640,-0.000 ZM13.975,11.002 C12.252,12.658 10.399,13.996 9.500,14.613 C8.601,13.996 6.748,12.658 5.025,11.002 C2.557,8.630 1.253,6.461 1.253,4.729 C1.253,2.731 3.095,1.105 5.361,1.105 C6.851,1.105 8.227,1.822 8.952,2.976 L9.500,3.847 L10.048,2.976 C10.773,1.822 12.149,1.105 13.640,1.105 C15.905,1.105 17.747,2.731 17.747,4.729 C17.747,6.461 16.443,8.630 13.975,11.002 Z"/>
         </svg>
          <svg class="an_wishlist-icon-active" width="19px" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 19 16"><path class="cls-1" d="M16.14,4A5.68,5.68,0,0,0,12,5.73,5.68,5.68,0,0,0,7.86,4C4.9,4,2.5,6.12,2.5,8.73c0,2,1.38,4.4,4.1,7a39.61,39.61,0,0,0,5,4L12,20l.38-.25a39.61,39.61,0,0,0,5-4c2.72-2.62,4.1-5,4.1-7C21.5,6.12,19.1,4,16.14,4Z" transform="translate(-2.5 -4)"/></svg>
		</span>
		{if ($config.display_likes_product)}
		<div class="an_wishlist-mini-count js-an_wishlist-product-count">{$countWishlists|intval}</div>
		{/if}
	</div>