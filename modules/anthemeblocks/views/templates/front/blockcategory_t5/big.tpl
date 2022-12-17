<div class="staticblockcategory-item staticblockcategory-item-big">
	{if $an_staticblock->link!=''}
	<a href="{$an_staticblock->link}">
	{/if}
		{if $an_staticblock->getImageLink() != ''}
		<div class="satitblock-image">
			<img src="{$an_staticblock->getImageLink()}" alt="{$an_staticblock->title|escape:'htmlall':'UTF-8'}">
		</div>
		{/if}
		<div class="anthemeblocks-staticblockcategory-desc">
			<h2>{$an_staticblock->title|escape:'htmlall':'UTF-8'}</h2>
            {$an_staticblock->content nofilter}

		</div>
	{if $an_staticblock->link != '' }
	</a>
	{/if}
</div>