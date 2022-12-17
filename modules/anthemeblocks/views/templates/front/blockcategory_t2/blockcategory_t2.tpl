<div class="anthemeblocks-staticblockcategory-wrap">
    <h2 class="h1">{$an_staticblock->title|escape:'htmlall':'UTF-8'}</h2>
    <div class="anthemeblocks-staticblockcategory">

        {foreach from=$an_staticblock->getChildrenBlocks() item=block}
            {$block->getContent() nofilter}
        {/foreach}
    </div>
</div>