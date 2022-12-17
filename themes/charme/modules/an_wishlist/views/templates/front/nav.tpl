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

<div  class="an_wishlist-nav-link" id="_desktop_an_wishlist-nav">
	<a href="{$link->getModuleLink('an_wishlist', 'list', array(), true)|escape:'htmlall':'UTF-8'}" title="{l s='My wishlist' d='Shop.Theme.Global'}">

		 {if (Module::isEnabled('an_theme') and Module::getInstanceByName('an_theme')->getParam('header_typeHeader') == 'header1')}
              <svg class="hidden-sm-down"
                xmlns="http://www.w3.org/2000/svg"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                width="15px" height="13px">
                <path fill-rule="evenodd"  fill="rgb(255, 246, 246)"
                d="M12.814,0.525 C12.207,0.189 11.509,-0.005 10.766,-0.005 C9.454,-0.005 8.279,0.595 7.503,1.537 C6.723,0.595 5.550,-0.005 4.236,-0.005 C3.494,-0.005 2.798,0.189 2.189,0.525 C0.883,1.251 -0.003,2.649 -0.003,4.254 C-0.003,4.714 0.072,5.154 0.207,5.567 C0.934,8.852 7.503,12.993 7.503,12.993 C7.503,12.993 14.068,8.852 14.796,5.567 C14.931,5.154 15.006,4.713 15.006,4.254 C15.006,2.649 14.121,1.252 12.814,0.525 Z"/>
                </svg>
                <span class="hidden-md-up">{l s='Wishlist' d='Shop.Theme.Global'}{if ($config.display_likes_nav)} (<span class="js-an_wishlist-nav-count">{$count|intval}</span>){/if}</span>
             {/if}
            {if (Module::isEnabled('an_theme') and Module::getInstanceByName('an_theme')->getParam('header_typeHeader') == 'header2')}
                <svg class="hidden-sm-down"
                 xmlns="http://www.w3.org/2000/svg"
                 xmlns:xlink="http://www.w3.org/1999/xlink"
                 width="27px" height="25px">
                <path fill-rule="evenodd"  fill="rgb(0, 0, 0)"
                 d="M19.383,0.000 C17.084,0.000 14.933,1.010 13.500,2.701 C12.067,1.010 9.916,0.000 7.617,0.000 C3.417,0.000 -0.000,3.315 -0.000,7.389 C-0.000,10.580 1.961,14.270 5.829,18.358 C8.806,21.503 12.044,23.939 12.965,24.610 L13.500,25.000 L14.035,24.610 C14.956,23.939 18.194,21.503 21.171,18.358 C25.039,14.270 27.000,10.580 27.000,7.389 C27.000,3.315 23.583,0.000 19.383,0.000 ZM19.859,17.190 C17.411,19.777 14.777,21.869 13.500,22.833 C12.223,21.869 9.589,19.777 7.140,17.190 C3.634,13.484 1.780,10.095 1.780,7.389 C1.780,4.267 4.399,1.727 7.617,1.727 C9.736,1.727 11.691,2.847 12.721,4.649 L13.500,6.012 L14.279,4.649 C15.309,2.847 17.264,1.727 19.383,1.727 C22.601,1.727 25.220,4.267 25.220,7.389 C25.220,10.095 23.366,13.484 19.859,17.190 Z"/>
                </svg>
               <span class="hidden-sm-down">
               {l s='Wishlist' d='Shop.Theme.Global'}{if ($config.display_likes_nav)}: <span class="js-an_wishlist-nav-count">{$count|intval}</span>{/if}
               </span>
               <span class="hidden-md-up">{l s='Wishlist' d='Shop.Theme.Global'} {if ($config.display_likes_nav)}(<span class="js-an_wishlist-nav-count">{$count|intval}</span>){/if}</span>
            {/if}
            {if (Module::isEnabled('an_theme') and Module::getInstanceByName('an_theme')->getParam('header_typeHeader') == 'header6')}
                    <svg class="hidden-sm-down"
                     xmlns="http://www.w3.org/2000/svg"
                     xmlns:xlink="http://www.w3.org/1999/xlink"
                     width="27px" height="25px">
                    <path fill-rule="evenodd"  fill="rgb(0, 0, 0)"
                     d="M19.383,0.000 C17.084,0.000 14.933,1.010 13.500,2.701 C12.067,1.010 9.916,0.000 7.617,0.000 C3.417,0.000 -0.000,3.315 -0.000,7.389 C-0.000,10.580 1.961,14.270 5.829,18.358 C8.806,21.503 12.044,23.939 12.965,24.610 L13.500,25.000 L14.035,24.610 C14.956,23.939 18.194,21.503 21.171,18.358 C25.039,14.270 27.000,10.580 27.000,7.389 C27.000,3.315 23.583,0.000 19.383,0.000 ZM19.859,17.190 C17.411,19.777 14.777,21.869 13.500,22.833 C12.223,21.869 9.589,19.777 7.140,17.190 C3.634,13.484 1.780,10.095 1.780,7.389 C1.780,4.267 4.399,1.727 7.617,1.727 C9.736,1.727 11.691,2.847 12.721,4.649 L13.500,6.012 L14.279,4.649 C15.309,2.847 17.264,1.727 19.383,1.727 C22.601,1.727 25.220,4.267 25.220,7.389 C25.220,10.095 23.366,13.484 19.859,17.190 Z"/>
                    </svg>
                   <span class="hidden-sm-down">
                   {l s='Wishlist' d='Shop.Theme.Global'}{if ($config.display_likes_nav)}: <span class="js-an_wishlist-nav-count">{$count|intval}</span>{/if}
                   </span>
                   <span class="hidden-md-up">{l s='Wishlist' d='Shop.Theme.Global'} {if ($config.display_likes_nav)}(<span class="js-an_wishlist-nav-count">{$count|intval}</span>){/if}</span>
                {/if}
            {if (Module::isEnabled('an_theme') and Module::getInstanceByName('an_theme')->getParam('header_typeHeader') == 'header3')}
                <svg class="hidden-sm-down"
                 xmlns="http://www.w3.org/2000/svg"
                 xmlns:xlink="http://www.w3.org/1999/xlink"
                 width="20px" height="17px">
                <path fill-rule="evenodd"  fill="rgb(0, 0, 0)"
                 d="M14.357,0.000 C12.655,0.000 11.061,0.686 10.000,1.837 C8.939,0.686 7.345,0.000 5.643,0.000 C2.531,0.000 -0.000,2.254 -0.000,5.025 C-0.000,7.194 1.453,9.704 4.318,12.483 C6.523,14.622 8.921,16.279 9.604,16.735 L10.000,17.000 L10.396,16.735 C11.079,16.279 13.477,14.622 15.682,12.483 C18.547,9.704 20.000,7.194 20.000,5.025 C20.000,2.254 17.469,0.000 14.357,0.000 ZM14.711,11.689 C12.897,13.449 10.946,14.871 10.000,15.526 C9.054,14.871 7.103,13.449 5.289,11.689 C2.692,9.169 1.319,6.864 1.319,5.025 C1.319,2.902 3.258,1.174 5.643,1.174 C7.212,1.174 8.660,1.936 9.423,3.162 L10.000,4.088 L10.577,3.162 C11.340,1.936 12.788,1.174 14.357,1.174 C16.742,1.174 18.681,2.902 18.681,5.025 C18.681,6.864 17.308,9.169 14.711,11.689 Z"/>
                </svg>
                <span class="hidden-sm-down">
                {l s='Wishlist' d='Shop.Theme.Global'}{if ($config.display_likes_nav)}: <span class="js-an_wishlist-nav-count">{$count|intval}</span>{/if}
                </span>
                <span class="hidden-md-up">{l s='Wishlist' d='Shop.Theme.Global'} {if ($config.display_likes_nav)}(<span class="js-an_wishlist-nav-count">{$count|intval}</span>){/if}</span>
            {/if}
             {if (Module::isEnabled('an_theme') and Module::getInstanceByName('an_theme')->getParam('header_typeHeader') == 'header4')}
                <svg class="hidden-sm-down"
                 xmlns="http://www.w3.org/2000/svg"
                 xmlns:xlink="http://www.w3.org/1999/xlink"
                 width="20px" height="17px">
                <path fill-rule="evenodd"  fill="rgb(0, 0, 0)"
                 d="M14.357,0.000 C12.655,0.000 11.061,0.686 10.000,1.836 C8.939,0.686 7.345,0.000 5.643,0.000 C2.531,0.000 -0.000,2.254 -0.000,5.025 C-0.000,7.194 1.453,9.704 4.318,12.483 C6.523,14.622 8.921,16.278 9.604,16.735 L10.000,17.000 L10.396,16.735 C11.079,16.278 13.477,14.622 15.682,12.483 C18.547,9.704 20.000,7.194 20.000,5.025 C20.000,2.254 17.469,0.000 14.357,0.000 ZM14.711,11.689 C12.897,13.449 10.946,14.871 10.000,15.526 C9.054,14.871 7.103,13.449 5.289,11.689 C2.692,9.169 1.319,6.864 1.319,5.025 C1.319,2.902 3.258,1.174 5.643,1.174 C7.212,1.174 8.660,1.936 9.423,3.162 L10.000,4.088 L10.577,3.162 C11.340,1.936 12.789,1.174 14.357,1.174 C16.742,1.174 18.681,2.902 18.681,5.025 C18.681,6.864 17.308,9.169 14.711,11.689 Z"/>
                </svg>
                <span class="hidden-sm-down">
                {l s='Wishlist' d='Shop.Theme.Global'}{if ($config.display_likes_nav)}: <span class="js-an_wishlist-nav-count">{$count|intval}</span>{/if}
                </span>
                <span class="hidden-md-up">{l s='Wishlist' d='Shop.Theme.Global'} {if ($config.display_likes_nav)}(<span class="js-an_wishlist-nav-count">{$count|intval}</span>){/if}</span>
            {/if}
            {if (Module::isEnabled('an_theme') and Module::getInstanceByName('an_theme')->getParam('header_typeHeader') == 'header5')}
               <svg class="hidden-sm-down"
                xmlns="http://www.w3.org/2000/svg"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                width="20px" height="17px">
               <path fill-rule="evenodd"  fill="rgb(0, 0, 0)"
                d="M14.357,0.000 C12.655,0.000 11.061,0.686 10.000,1.836 C8.939,0.686 7.345,0.000 5.643,0.000 C2.531,0.000 -0.000,2.254 -0.000,5.025 C-0.000,7.194 1.453,9.704 4.318,12.483 C6.523,14.622 8.921,16.278 9.604,16.735 L10.000,17.000 L10.396,16.735 C11.079,16.278 13.477,14.622 15.682,12.483 C18.547,9.704 20.000,7.194 20.000,5.025 C20.000,2.254 17.469,0.000 14.357,0.000 ZM14.711,11.689 C12.897,13.448 10.946,14.871 10.000,15.526 C9.054,14.871 7.103,13.448 5.289,11.689 C2.692,9.169 1.319,6.864 1.319,5.025 C1.319,2.902 3.258,1.174 5.643,1.174 C7.212,1.174 8.660,1.936 9.423,3.162 L10.000,4.088 L10.577,3.162 C11.340,1.936 12.788,1.174 14.357,1.174 C16.742,1.174 18.681,2.902 18.681,5.025 C18.681,6.864 17.308,9.169 14.711,11.689 Z"/>
               </svg>
               <span class="hidden-sm-down">
                {l s='Wishlist' d='Shop.Theme.Global'}{if ($config.display_likes_nav)}: <span class="js-an_wishlist-nav-count">{$count|intval}</span>{/if}
              </span>
              <span class="hidden-md-up">{l s='Wishlist' d='Shop.Theme.Global'} {if ($config.display_likes_nav)}(<span class="js-an_wishlist-nav-count">{$count|intval}</span>){/if}</span>
            {/if}
	</a>
</div>

