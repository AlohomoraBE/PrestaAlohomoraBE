<div class="promoblocks-item">
	{if $an_staticblock->getImageLink() != ''}
	<div class="promoblocks-image">
		<img src="{$an_staticblock->getImageLink()}" alt="{$an_staticblock->title|escape:'htmlall':'UTF-8'}">
	</div>
	{/if}
	<div class="promoblocks-desc">
		<div class="promoblocks-additional-textp">
			{if $an_staticblock->formdata}
			{$an_staticblock->formdata->additional_field_big_additional_text}
			{/if}
		</div>
		<h2>{$an_staticblock->title|escape:'htmlall':'UTF-8'}</h2>
		{if $an_staticblock->content !=''}
		<div class="promoblocks-content">
			{$an_staticblock->content nofilter}
		</div>
		{/if}
		{if $an_staticblock->link!=''}
		<a href="{$an_staticblock->link}" class="btn btn-primary">{l s='Shop now' mod='anthemeblocks'}</a>
		{/if}
	</div>
</div>