{**
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
*}

<div 
    class="an_productattributes js-an_productattributes" 
    data-text_out_of_stock="{$config.text_out_of_stock|escape:'htmlall':'UTF-8'}"  
    data-add_to_cart="{l s='Add to cart' d='Shop.Theme.Actions'}"
>
<form method="post" class="an_productattributesForm" action="{$cart|escape:'htmlall':'UTF-8'}">
<input name="token" value="{$token|escape:'htmlall':'UTF-8'}" type="hidden">
<input name="id_product" value="{$productId|escape:'htmlall':'UTF-8'}" type="hidden">
{*<input name="id_customization" value="0" placeholder="" type="hidden"> *}
{if $config.display_quantity!='1'}
<input name="qty" type="hidden" value="{$minimal_quantity|escape:'htmlall':'UTF-8'}" min="{$minimal_quantity|escape:'htmlall':'UTF-8'}">
{/if}
{block name='an_productattributes_content'}{/block}
</form>
</div>