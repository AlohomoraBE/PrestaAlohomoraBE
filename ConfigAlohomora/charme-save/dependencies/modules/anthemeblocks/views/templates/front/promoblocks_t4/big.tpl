<div class="promoblocks-item {if $an_staticblock->formdata}promoblocks-item_{$an_staticblock->formdata->additional_field_big_textpostion}{/if}">
	{if $an_staticblock->link!=''}
	<a href="{$an_staticblock->link}">
	{/if}
		<div class="promoblocks-img" {if $an_staticblock->getImageLink() != ''}style="background: url({$an_staticblock->getImageLink()}) no-repeat
			{if $an_staticblock->formdata}{$an_staticblock->formdata->additional_field_big_bgpostion}{/if}
		"{/if}>
			
		</div>
		<div class="promoblocks-desc">
			<div class="promoblocks-desc_wrap">
				<h2>{$an_staticblock->title|escape:'htmlall':'UTF-8'}</h2>
				{$an_staticblock->content nofilter}
			</div>
		</div>
	{if $an_staticblock->link != '' }
	</a>
	{/if}
</div>