{**
 * 2007-2017 PrestaShop
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Open Software License (OSL 3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * http://opensource.org/licenses/osl-3.0.php
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
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright 2007-2017 PrestaShop SA
 * @license   http://opensource.org/licenses/osl-3.0.php Open Software License (OSL 3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}
 <!doctype html>
 <html lang="{$language.iso_code}" data-vers="{$smarty.const._PS_VERSION_}">

 <head>
  {block name='head'}
  {include file='_partials/head.tpl'}
  {/block}
</head>

<body id="{$page.page_name}" class="{if Module::isEnabled('an_theme') and  Module::getInstanceByName('an_theme')->getParam('orderpage_minimize')}checkout-minimize{/if} {$page.body_classes|classnames}">

  {block name='hook_after_body_opening_tag'}
  {hook h='displayAfterBodyOpeningTag'}
  {/block}

  <main>
    {block name='product_activation'}
    {include file='catalog/_partials/product-activation.tpl'}
    {/block}

    <header id="header" {if Module::isEnabled('an_theme')}class="{Module::getInstanceByName('an_theme')->getParam('header_typeHeader')}"{/if}>
      {block name='header'}
      {include file='_partials/header.tpl'}
      {/block}
    </header>

    {block name='notifications'}
    {include file='_partials/notifications.tpl'}
    {/block}
     {block name='breadcrumb'}
    {include file='_partials/breadcrumb.tpl'}
    {/block}
    <section id="wrapper">
      <div class="container">


        {if $page.page_name == 'category' or $page.page_name == 'prices-drop' or $page.page_name == 'new-products' or $page.page_name == 'best-sales' or $page.page_name == 'contact'}
        <div class="row">
          {/if}
          {block name="left_column"}
          <div id="left-column" class="col-xs-12 col-sm-4 col-md-3">
            {if $page.page_name == 'product'}
            {hook h='displayLeftColumnProduct'}
            {else}
              <div class="search_filters_mobile-cover"></div>
              <div class="search_filters_mobile-modal">
                <div id="search_filters_wrapper">
                      <div class="mobile-menu-header">
                          <div class="search_filters_mobile-btn-close">
                              <svg
                              xmlns="http://www.w3.org/2000/svg"
                              xmlns:xlink="http://www.w3.org/1999/xlink"
                              width="16px" height="16px">
                              <path fill-rule="evenodd"  fill="rgb(0, 0, 0)"
                              d="M16.002,0.726 L15.274,-0.002 L8.000,7.273 L0.725,-0.002 L-0.002,0.726 L7.273,8.000 L-0.002,15.274 L0.725,16.002 L8.000,8.727 L15.274,16.002 L16.002,15.274 L8.727,8.000 L16.002,0.726 Z"/>
                              </svg>
                          </div>
                      </div>
                      {hook h="displayLeftColumn"}
                </div>
              </div>

            {/if}
          </div>
          {/block}

          {block name="content_wrapper"}
          <div id="content-wrapper" class="left-column right-column col-sm-4 col-md-6">
            {block name="content"}
            <p>Hello world! This is HTML5 Boilerplate.</p>
            {/block}
          </div>
          {/block}

          {block name="right_column"}
          <div id="right-column" class="col-xs-12 col-sm-4 col-md-3">
            {if $page.page_name == 'product'}
            {hook h='displayRightColumnProduct'}
            {else}
            {hook h="displayRightColumn"}
            {/if}
          </div>
          {/block}
          
          {if $page.page_name == 'category' or $page.page_name == 'prices-drop' or $page.page_name == 'new-products' or $page.page_name == 'best-sales' or $page.page_name == 'contact'}
        </div>
        {/if}
            {if ($page.page_name == 'index')}
                {if (Module::isEnabled('an_theme') and  Module::getInstanceByName('an_theme')->getParam('global_typeHomepage') == "homepage3")
                 or (Module::isEnabled('an_theme') and  Module::getInstanceByName('an_theme')->getParam('global_typeHomepage') == "homepage6")}
                    <div class="page-home">
                        {hook h="displayHome2"}
                    </div>
                {/if}
            {/if}
        </div>
          {if ($page.page_name == 'index')}
             {if Module::isEnabled('an_theme') and  Module::getInstanceByName('an_theme')->getParam('global_typeHomepage') == "homepage4"}
             {hook h="displayMiddleWrapper"}
              <div class="container">
                {hook h="displayMiddle"}
              </div>
            {/if}
            {/if}
      </section>

      <footer id="footer">
        {block name="footer"}
        {include file="_partials/footer.tpl"}
        {/block}
      </footer>

    </main>

    {block name='javascript_bottom'}
    {include file="_partials/javascript.tpl" javascript=$javascript.bottom}
    {/block}

    {block name='hook_before_body_closing_tag'}
    {hook h='displayBeforeBodyClosingTag'}
    {/block}
  </body>

  </html>
