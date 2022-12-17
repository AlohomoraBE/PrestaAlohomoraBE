{if version_compare($smarty.const._PS_VERSION_, '1.7.0.0', '<')}
    {foreach from=$an_staticblock->products item="product"}
        {include file='$tpl_dir./product-list.tpl' product=$product}
    {/foreach}
{else}
	<section class="featured-products clearfix">
		<div class="featured-products_header">
			<h2>{$an_staticblock->title|escape:'htmlall':'UTF-8'}</h2>
			{$an_staticblock->content nofilter}
		</div>
		<div class="products">
		{foreach from=$an_staticblock->products item="product"}
			{include file='catalog/_partials/miniatures/product.tpl' product=$product}
		{/foreach}
		</div>
    </section>
{/if}