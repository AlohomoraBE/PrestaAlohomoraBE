{**
 * 2007-2017 PrestaShop
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
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
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}

{extends file=$layout}
{if Module::isEnabled('an_theme') and  Module::getInstanceByName('an_theme')->getParam('orderpage_minimize')}

      {block name='header'}
        {include file='checkout/_partials/header.tpl'}
      {/block}

      {block name='content'}
         <section id="main">
           <div class="row checkout-content">
           <div class="col-md-8 chechout-steps">
             {render file='checkout/checkout-process.tpl' ui=$checkout_process}
           </div>
           <div class="col-md-4">

             {include file='checkout/_partials/cart-summary.tpl' cart = $cart}

             {hook h='displayReassurance'}
           </div>
           </div>
         </section>
         {/block}

      {block name='footer'}
        {include file='checkout/_partials/footer.tpl'}
      {/block}

{elseif Module::isEnabled('an_theme') and !Module::getInstanceByName('an_theme')->getParam('orderpage_minimize')}
    {block name='content'}
    <section id="main">
      <div class="row checkout-content">
      <div class="col-md-8 chechout-steps">
        {render file='checkout/checkout-process.tpl' ui=$checkout_process}
      </div>
      <div class="col-md-4">

        {include file='checkout/_partials/cart-summary.tpl' cart = $cart}

        {hook h='displayReassurance'}
      </div>
      </div>
    </section>
    {/block}

{/if}


