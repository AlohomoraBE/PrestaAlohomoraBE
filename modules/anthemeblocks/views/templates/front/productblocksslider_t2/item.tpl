{if version_compare($smarty.const._PS_VERSION_, '1.7.0.0', '<')}
    {foreach from=$an_staticblock->products item="product"}
        {include file='$tpl_dir./product-list.tpl' product=$product}
    {/foreach}
{else}
	<section class="featured-products clearfix">
		<h2 class="h1 products-section-title">{$an_staticblock->title|escape:'htmlall':'UTF-8'}</h2>
		<div class="js-anthemeblocks-product-block-slider products owl-carousel" id="js-anthemeblocks-product-block-slider-{$an_staticblock->id}" {if $an_staticblock->formdata} data-nav="{$an_staticblock->formdata->additional_field_item_nav}" data-dots="{$an_staticblock->formdata->additional_field_item_dots}" data-loop="{$an_staticblock->formdata->additional_field_item_loop}" data-autoplay="{$an_staticblock->formdata->additional_field_item_autoplay}" data-autoplaytimeout="{$an_staticblock->formdata->additional_field_item_autoplayTimeout}"{/if}{if Module::isEnabled('an_theme') and  Module::getInstanceByName('an_theme')->getParam('product_productMobileRow')}data-items="{Module::getInstanceByName('an_theme')->getParam('product_productMobileRow')}{/if}">
		{foreach from=$an_staticblock->products item="product"}
			{include file='catalog/_partials/miniatures/product.tpl' product=$product}
		{/foreach}
		</div>
    </section>
{/if}