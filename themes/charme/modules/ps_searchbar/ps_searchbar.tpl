{*
* 2007-2017 PrestaShop
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
*  @author PrestaShop SA <contact@prestashop.com>
*  @copyright  2007-2017 PrestaShop SA
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}
<!-- Block search module TOP -->
{if (Module::isEnabled('an_theme') and Module::getInstanceByName('an_theme')->getParam('header_typeHeader') == 'header1')}
<div id="_desktop_search_widget">
	<div id="search_widget" class="search-widget" data-search-controller-url="{$search_controller_url}">
	 
		<form class="search-form" method="get" action="{$search_controller_url}" data-status='open-search'>
			<input type="hidden" name="controller" value="search">
			<input type="text" name="s" value="{$search_string}" data-status='open-search' placeholder="{l s='Search' d='Shop.Theme.Catalog'}">
			<button type="submit">
				<i class="material-icons search">&#xE8B6;</i>
			</button>
		</form>
	</div>
</div>
{/if}
{if (Module::isEnabled('an_theme') and Module::getInstanceByName('an_theme')->getParam('header_typeHeader') == 'header2')}
<div id="search_widget" class="search-widget" data-search-controller-url="{$search_controller_url}">
	<div class="container">
		<form method="get" action="{$search_controller_url}">
			<input type="hidden" name="controller" value="search">
			<input type="text" name="s" value="{$search_string}" desktop-placeholder="{l s='Czego szukasz?' d='Shop.Theme.Catalog'}" mobile-placeholder="{l s='Search' d='Shop.Theme.Catalog'}" placeholder="{l s='What are you looking for?' d='Shop.Theme.Catalog'}" aria-label="{l s='Search' d='Shop.Theme.Catalog'}">
			<button type="submit">
			    {if (Module::isEnabled('an_theme') and Module::getInstanceByName('an_theme')->getParam('header_typeHeader') == 'header1')}
				<svg
				xmlns="http://www.w3.org/2000/svg"
				xmlns:xlink="http://www.w3.org/1999/xlink"
				width="20px" height="20px">
				<path fill-rule="evenodd"  fill="rgb(0, 0, 0)"
				d="M20.008,18.960 L19.484,19.484 L12.645,12.645 L12.645,12.645 L19.484,19.484 L18.960,20.007 L12.071,13.119 C10.795,14.163 9.185,14.815 7.407,14.815 C3.316,14.815 -0.000,11.498 -0.000,7.407 C-0.000,3.316 3.316,-0.000 7.407,-0.000 C11.498,-0.000 14.815,3.316 14.815,7.407 C14.815,9.185 14.163,10.794 13.119,12.071 L20.008,18.960 ZM7.407,1.481 C4.135,1.481 1.481,4.135 1.481,7.407 C1.481,10.680 4.135,13.333 7.407,13.333 C10.680,13.333 13.333,10.680 13.333,7.407 C13.333,4.135 10.680,1.481 7.407,1.481 Z"/>
				</svg>
				{/if}
				{if (Module::isEnabled('an_theme') and Module::getInstanceByName('an_theme')->getParam('header_typeHeader') == 'header2')}
				<svg
                 xmlns="http://www.w3.org/2000/svg"
                 xmlns:xlink="http://www.w3.org/1999/xlink"
                 width="20px" height="20px">
                <path fill-rule="evenodd"  fill="rgb(0, 0, 0)"
                 d="M19.826,18.980 L14.965,14.120 C16.269,12.621 17.059,10.665 17.059,8.528 C17.059,3.823 13.231,0.000 8.529,0.000 C3.823,0.000 0.000,3.827 0.000,8.528 C0.000,13.228 3.828,17.056 8.529,17.056 C10.667,17.056 12.623,16.266 14.122,14.962 L18.984,19.823 C19.099,19.938 19.254,20.000 19.405,20.000 C19.556,20.000 19.711,19.942 19.826,19.823 C20.057,19.592 20.057,19.211 19.826,18.980 ZM1.193,8.528 C1.193,4.483 4.484,1.197 8.525,1.197 C12.570,1.197 15.857,4.488 15.857,8.528 C15.857,12.568 12.570,15.863 8.525,15.863 C4.484,15.863 1.193,12.572 1.193,8.528 Z"/>
                </svg>
                {/if}
			</button>

		</form>
	</div>
</div>
{/if}
{if (Module::isEnabled('an_theme') and Module::getInstanceByName('an_theme')->getParam('header_typeHeader') == 'header6')}
<div id="search_widget" class="search-widget" data-search-controller-url="{$search_controller_url}">
	<div class="container">
		<form method="get" action="{$search_controller_url}">
			<input type="hidden" name="controller" value="search">
			<input type="text" name="s" value="{$search_string}" desktop-placeholder="{l s='Czego szukasz?' d='Shop.Theme.Catalog'}" mobile-placeholder="{l s='Search' d='Shop.Theme.Catalog'}" placeholder="{l s='What are you looking for?' d='Shop.Theme.Catalog'}" aria-label="{l s='Search' d='Shop.Theme.Catalog'}">
			<button type="submit">
				<svg
                 xmlns="http://www.w3.org/2000/svg"
                 xmlns:xlink="http://www.w3.org/1999/xlink"
                 width="20px" height="20px">
                <path fill-rule="evenodd"  fill="rgb(0, 0, 0)"
                 d="M19.826,18.980 L14.965,14.120 C16.269,12.621 17.059,10.665 17.059,8.528 C17.059,3.823 13.231,0.000 8.529,0.000 C3.823,0.000 0.000,3.827 0.000,8.528 C0.000,13.228 3.828,17.056 8.529,17.056 C10.667,17.056 12.623,16.266 14.122,14.962 L18.984,19.823 C19.099,19.938 19.254,20.000 19.405,20.000 C19.556,20.000 19.711,19.942 19.826,19.823 C20.057,19.592 20.057,19.211 19.826,18.980 ZM1.193,8.528 C1.193,4.483 4.484,1.197 8.525,1.197 C12.570,1.197 15.857,4.488 15.857,8.528 C15.857,12.568 12.570,15.863 8.525,15.863 C4.484,15.863 1.193,12.572 1.193,8.528 Z"/>
                </svg>
			</button>

		</form>
	</div>
</div>
{/if}
{if (Module::isEnabled('an_theme') and Module::getInstanceByName('an_theme')->getParam('header_typeHeader') == 'header3')
or (Module::isEnabled('an_theme') and Module::getInstanceByName('an_theme')->getParam('header_typeHeader') == 'header4')
or (Module::isEnabled('an_theme') and Module::getInstanceByName('an_theme')->getParam('header_typeHeader') == 'header5')}
<div class="search-dropdown dropdown" id="_desktop_searchbar">
	<div class="search-button-wrapper dropdown-toggle" data-toggle="dropdown">
		<div class="search-button">
         {if (Module::isEnabled('an_theme') and Module::getInstanceByName('an_theme')->getParam('header_typeHeader') == 'header3')}
         {l s='Search' d='Shop.Theme.Catalog'}
         <svg
          xmlns="http://www.w3.org/2000/svg"
          xmlns:xlink="http://www.w3.org/1999/xlink"
          width="20px" height="20px">
         <path fill-rule="evenodd"  fill="rgb(0, 0, 0)"
          d="M19.826,18.980 L14.965,14.120 C16.269,12.621 17.059,10.665 17.059,8.528 C17.059,3.823 13.231,0.000 8.529,0.000 C3.823,0.000 -0.000,3.827 -0.000,8.528 C-0.000,13.228 3.828,17.055 8.529,17.055 C10.667,17.055 12.623,16.266 14.122,14.962 L18.984,19.823 C19.099,19.938 19.254,20.000 19.405,20.000 C19.556,20.000 19.711,19.942 19.826,19.823 C20.057,19.592 20.057,19.211 19.826,18.980 ZM1.193,8.528 C1.193,4.483 4.484,1.197 8.525,1.197 C12.570,1.197 15.857,4.488 15.857,8.528 C15.857,12.568 12.570,15.862 8.525,15.862 C4.484,15.862 1.193,12.572 1.193,8.528 Z"/>
         </svg>
         {/if}
         {if (Module::isEnabled('an_theme') and Module::getInstanceByName('an_theme')->getParam('header_typeHeader') == 'header4')}
        <svg
         xmlns="http://www.w3.org/2000/svg"
         xmlns:xlink="http://www.w3.org/1999/xlink"
         width="19px" height="18px">
        <path fill-rule="evenodd"  fill="rgb(0, 0, 0)"
         d="M17.844,17.082 L13.469,12.708 C14.642,11.359 15.353,9.599 15.353,7.675 C15.353,3.440 11.908,-0.000 7.676,-0.000 C3.441,-0.000 -0.000,3.444 -0.000,7.675 C-0.000,11.906 3.445,15.350 7.676,15.350 C9.601,15.350 11.361,14.639 12.710,13.466 L17.085,17.840 C17.189,17.944 17.329,18.000 17.465,18.000 C17.600,18.000 17.740,17.948 17.844,17.840 C18.051,17.633 18.051,17.290 17.844,17.082 ZM1.074,7.675 C1.074,4.035 4.036,1.078 7.672,1.078 C11.313,1.078 14.271,4.039 14.271,7.675 C14.271,11.311 11.313,14.276 7.672,14.276 C4.036,14.276 1.074,11.315 1.074,7.675 Z"/>
        </svg>
          {/if}
          {if (Module::isEnabled('an_theme') and Module::getInstanceByName('an_theme')->getParam('header_typeHeader') == 'header5')}
            <svg
             xmlns="http://www.w3.org/2000/svg"
             xmlns:xlink="http://www.w3.org/1999/xlink"
             width="19px" height="18px">
            <path fill-rule="evenodd"  fill="rgb(0, 0, 0)"
             d="M17.844,17.082 L13.469,12.708 C14.642,11.359 15.353,9.599 15.353,7.675 C15.353,3.440 11.908,-0.000 7.676,-0.000 C3.441,-0.000 0.000,3.444 0.000,7.675 C0.000,11.906 3.445,15.350 7.676,15.350 C9.601,15.350 11.361,14.639 12.710,13.466 L17.085,17.840 C17.189,17.944 17.329,18.000 17.465,18.000 C17.600,18.000 17.740,17.948 17.844,17.840 C18.051,17.633 18.051,17.290 17.844,17.082 ZM1.074,7.675 C1.074,4.035 4.036,1.078 7.672,1.078 C11.313,1.078 14.271,4.039 14.271,7.675 C14.271,11.311 11.313,14.276 7.672,14.276 C4.036,14.276 1.074,11.315 1.074,7.675 Z"/>
            </svg>
            {/if}

		</div>
	</div>

	<div id="search_widget" class="search-widget dropdown-menu" data-search-controller-url="{$search_controller_url}">
		<div class="container">
			<form method="get" action="{$search_controller_url}">
				<button type="submit">
					<svg
                     xmlns="http://www.w3.org/2000/svg"
                     xmlns:xlink="http://www.w3.org/1999/xlink"
                     width="20px" height="20px">
                    <path fill-rule="evenodd"  fill="rgb(0, 0, 0)"
                     d="M20.008,18.960 L19.484,19.484 L18.960,20.007 L12.071,13.119 C10.794,14.163 9.185,14.815 7.407,14.815 C3.316,14.815 -0.000,11.498 -0.000,7.407 C-0.000,3.316 3.316,-0.000 7.407,-0.000 C11.498,-0.000 14.815,3.316 14.815,7.407 C14.815,9.185 14.163,10.794 13.119,12.071 L20.008,18.960 ZM7.407,1.481 C4.135,1.481 1.481,4.135 1.481,7.407 C1.481,10.680 4.135,13.333 7.407,13.333 C10.680,13.333 13.333,10.680 13.333,7.407 C13.333,4.135 10.680,1.481 7.407,1.481 Z"/>
                    </svg>
					<span class="hidden-xl-down">{l s='Search' d='Shop.Theme.Catalog'}</span>
				</button>
				<input type="hidden" name="controller" value="search">
				<input type="text" name="s" value="{$search_string}" desktop-placeholder="{l s='What are you looking for?' d='Shop.Theme.Catalog'}" mobile-placeholder="{l s='Search' d='Shop.Theme.Catalog'}" placeholder="{l s='What are you looking for?' d='Shop.Theme.Catalog'}" aria-label="{l s='Search' d='Shop.Theme.Catalog'}">


			</form>
		</div>
	</div>
</div>
{/if}
<!-- /Block search module TOP -->
