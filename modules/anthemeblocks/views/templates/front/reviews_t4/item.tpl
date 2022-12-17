{if $an_staticblock->link!=''}
<a href="{$an_staticblock->link}">
	{/if}
	<div class="anthemeblocks-reviews-desc">
		{if $an_staticblock->getImageLink() != ''}
		<img src="{$an_staticblock->getImageLink()}" class="man" alt="{$an_staticblock->title|escape:'htmlall':'UTF-8'}">
		{/if}

		{$an_staticblock->content nofilter}
		<h2>{$an_staticblock->title|escape:'htmlall':'UTF-8'}</h2>
		<span class="review-contact">{$an_staticblock->formdata->additional_field_item_email}</span>

	</div>
	{if $an_staticblock->link != '' }
</a>
{/if}