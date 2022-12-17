<div class="anthemeblocks-promoblocks">
	{foreach from=$an_staticblock->getChildrenBlocks() item=block}
		{$block->getContent() nofilter}
	{/foreach}
</div>