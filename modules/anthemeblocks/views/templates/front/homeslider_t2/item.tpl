{if $an_staticblock->link!=''}
<a href="{$an_staticblock->link}">
{/if}
	{if $an_staticblock->getImageLink() != ''}
	<img src="{$an_staticblock->getImageLink()}" alt="{$an_staticblock->title|escape:'htmlall':'UTF-8'}">
	{/if}
	{if ($an_staticblock->formdata->additional_field_item_showtitle != 0) or ($an_staticblock->formdata->additional_field_item_showbutton != 0) or ($an_staticblock->content != "")}
	<div class="anthemeblocks-caption">
		<div class="container">
			<div class="anthemeblocks-homeslider-desc">
			    {if $an_staticblock->formdata->additional_field_item_showtitle == 1}
				<h2>{$an_staticblock->title|escape:'htmlall':'UTF-8'}</h2>
				{/if}
				{$an_staticblock->content nofilter}
				{if $an_staticblock->formdata->additional_field_item_showbutton == 1}
				<button class="btn btn-primary">{l s='Shop now' mod='anthemeblocks'}</button>
				{/if}
			</div>
		</div>
	</div>
	{/if}
{if $an_staticblock->link!=''}
</a>
{/if}