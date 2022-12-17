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
{block name='cart_summary_product_line'}
  <div class="media-left">
    <a href="{$product.url}" title="{$product.name}">
      {if $product.default_image}
      <img class="media-object" src="{$product.default_image.bySize.cart_default.url}" alt="{$product.name|escape:'quotes'}" loading="lazy">
      {else}
      <img class="media-object" src="{$product.cover.bySize.cart_default.url}" alt="{$product.name}">
      {/if}
    </a>
  </div>
  <div class="media-body">
    <div class="product-amount">
      <span class="product-name">{$product.name}</span>
      <span class="product-quantity">x{$product.quantity}</span>
      <div class="product-attribute">
         {foreach from=$product.attributes key="attribute" item="value"}
            <div class="product-line-info product-line-attribute">
              <span class="value">{$value}</span>
            </div>
          {/foreach}
      </div>
    </div>
    <span class="product-price float-xs-right">{$product.price}</span>
    {hook h='displayProductPriceBlock' product=$product type="unit_price"}
  </div>
{/block}
