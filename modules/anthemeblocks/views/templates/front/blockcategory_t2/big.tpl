<div class="staticblockcategory-item staticblockcategory-item-big">
    {if $an_staticblock->getImageLink() != ''}
    <div class="satitblock-image">
        <img src="{$an_staticblock->getImageLink()}" alt="{$an_staticblock->title|escape:'htmlall':'UTF-8'}">
    </div>
    {/if}
    <div class="anthemeblocks-staticblockcategory-desc">
        <h2>{$an_staticblock->title|escape:'htmlall':'UTF-8'}</h2>
        {if $an_staticblock->content !=''}
        <div class="anthemeblocks-staticblockcategory-content">
            {$an_staticblock->content nofilter}
        </div>
        {/if}
        <div class="an_link-block">
             {if $an_staticblock->link!=''}
                <a class="btn btn-primary" href="{$an_staticblock->link}">{l s='Read more' mod='anthemeblocks'}</a>
             {/if}
        </div>
    </div>

</div>