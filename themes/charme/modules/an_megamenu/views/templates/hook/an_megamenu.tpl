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
*  @author    PrestaShop SA <contact@prestashop.com>
*  @copyright 2007-2017 PrestaShop SA
*  @license   http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}

{if $anmenus}
<div class="amega-menu hidden-sm-down">
<div id="amegamenu" class="{if $is_rtl}amegamenu_rtl{/if}">
  <div class="fixed-menu-container">
  {hook h='displayFixedMenuLeft'}
  <ul class="anav-top">
  {foreach from=$anmenus item=menu}
  <li class="amenu-item mm-{$menu.id_anmenu} {if $menu.dropdowns}plex{/if}">
    {if $menu.link}<a href="{$menu.link}" class="amenu-link">{else}<span class="amenu-link">{/if}
      {$menu.name}
      {if $menu.label}<sup {if $menu.label_color}style="background-color: {$menu.label_color}; color: {$menu.label_color};"{/if}><span>{$menu.label}</span></sup>{/if}
    {if $menu.link}</a>{else}</span>{/if}

    {if $menu.dropdowns && $menu.drop_column}
    <span class="mobile-toggle-plus"><i class="caret-down-icon"></i></span>
    <div class="adropdown adropdown-{$menu.drop_column}" {if $menu.drop_bgcolor}style="background-color: {$menu.drop_bgcolor};"{/if}>
      
      <div class="dropdown-bgimage" {if $menu.drop_bgimage}style="background-image: url('{$bg_image_url}{$menu.drop_bgimage}'); background-position: {$menu.bgimage_position}; {$menu.position}"{/if}></div>
      
      {foreach from=$menu.dropdowns item=dropdown}
     
      {if $dropdown.content_type != 'none' && $dropdown.column}
      <div class="dropdown-content acontent-{$dropdown.column} dd-{$dropdown.id_andropdown}">
		{if $dropdown.title!=''}
		<p class="h5 category-title">{$dropdown.title}</p>
		{/if}
        {if $dropdown.content_type == 'category'}
          {if $dropdown.categories}
          <div class="categories-grid">
            {if $dropdown.drop_bgimage}
            <img class="category-item-image" src="{$bg_image_url}{$dropdown.drop_bgimage}" width="auto" height="auto" >
            {/if}
          	{$dropdown.categoriesHtml nofilter}
          </div>
          {/if}

        {elseif $dropdown.content_type == 'product'}
          {if $dropdown.products}
          <div class="products-grid">
          <div class="dropdown-bgimage" {if $dropdown.drop_bgimage}style="background-image: url('{$bg_image_url}{$dropdown.drop_bgimage}');"{/if}></div>
          {foreach from=$dropdown.products item=product name=products}
            <div class="product-item">
              <div class="product-thumbnail"><a href="{$product.url}" title="{$product.name}"><img class="img-fluid" width="auto" height="auto"  src="{if isset($product.cover.bySize.menu_default)}{$product.cover.bySize.menu_default.url}{else} {$product.cover.bySize.home_default.url}{/if}" alt="{$product.cover.legend}" /></a></div>
              <div class="product-information-dropdown">
                <p class="h5 product-name"><a href="{$product.url}" title="{$product.name}">{$product.name|truncate:30:'...'}</a></p>
                {if $product.show_price}
                <div class="product-price-and-shipping">
               <span class="price product-price">{$product.price}</span> {if $product.has_discount}<span class="regular-price">{$product.regular_price}</span>{/if}</div>
                
                {/if}
                
              </div>
            </div>
          {/foreach}
          </div>
          {/if}

        {elseif $dropdown.content_type == 'manufacturer'}
          {if $dropdown.manufacturers}
          <div class="manufacturers-grid">
          <div class="dropdown-bgimage" {if $dropdown.drop_bgimage}style="background-image: url('{$bg_image_url}{$dropdown.drop_bgimage}');"{/if}></div>
          {foreach from=$dropdown.manufacturers item=manufacturer name=manufacturers}
            <div class="manufacturer-item brand-base">
              <div class="left-side"><div class="logo"><a href="{$manufacturer.url}" title=""><img class="img-fluid" src="{$manufacturer.image}" width="auto" height="auto" alt="" /></a></div></div>
              <div class="middle-side"><a class="product-name" href="{$manufacturer.url}" title="">{$manufacturer.name}</a></div>
            </div>
          {/foreach}
          </div>
          {/if}
          
        {elseif $dropdown.content_type == 'html'}

          {if $dropdown.static_content}
          <div class="html-item typo">
           
          <div class="dropdown-bgimage" {if $dropdown.drop_bgimage}style="background-image: url('{$bg_image_url}{$dropdown.drop_bgimage}');"{/if}></div>
            {$dropdown.static_content nofilter}
          </div>
          {/if}
        {/if}
      </div>
      {/if}
      {/foreach}
    </div>
    {/if}
  </li>
  {/foreach}
    {hook h='displayMenuRight'}
  </ul>
  <div class="col-md-2 fixed-menu-right">
    {hook h='displayFixedMenuRight'}

    <div id="_fixed_cart">
            <a class="blockcart-link" rel="nofollow" href="{$urls.pages.cart}">
            <svg class="hidden-sm-down"
                xmlns="http://www.w3.org/2000/svg"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                width="30px" height="27px">
               <path fill-rule="evenodd"  fill="rgb(0, 0, 0)"
                d="M0.833,1.687 L3.565,1.687 L9.739,20.440 C8.437,20.900 7.499,22.152 7.499,23.625 C7.499,25.485 8.995,27.000 10.833,27.000 C12.671,27.000 14.166,25.485 14.166,23.625 C14.166,23.010 14.000,22.434 13.715,21.937 L22.117,21.937 C21.832,22.434 21.666,23.010 21.666,23.625 C21.666,25.485 23.162,27.000 25.000,27.000 C26.838,27.000 28.333,25.485 28.333,23.625 C28.333,21.764 26.838,20.250 25.000,20.250 L11.433,20.250 L10.322,16.875 L25.833,16.875 C26.192,16.875 26.510,16.642 26.624,16.298 L29.957,6.173 C30.042,5.915 29.999,5.633 29.843,5.412 C29.686,5.193 29.434,5.062 29.166,5.062 L6.433,5.062 L4.957,0.577 C4.843,0.232 4.524,-0.000 4.166,-0.000 L0.833,-0.000 C0.372,-0.000 -0.001,0.377 -0.001,0.844 C-0.001,1.310 0.372,1.687 0.833,1.687 ZM25.000,21.937 C25.919,21.937 26.666,22.694 26.666,23.625 C26.666,24.555 25.919,25.312 25.000,25.312 C24.081,25.312 23.333,24.555 23.333,23.625 C23.333,22.694 24.081,21.937 25.000,21.937 ZM10.833,21.937 C11.752,21.937 12.499,22.694 12.499,23.625 C12.499,24.555 11.752,25.312 10.833,25.312 C9.914,25.312 9.166,24.555 9.166,23.625 C9.166,22.694 9.914,21.937 10.833,21.937 ZM28.010,6.750 L25.232,15.187 L9.767,15.187 L6.989,6.750 L28.010,6.750 Z"/>
               </svg>
              <span class="fixed-cart-products-count">{l s='Cart' d='Shop.Theme.Checkout'}: 0</span>
            </a>
        </div>

  </div>
  
 </div>
</div>
</div>
{/if}
