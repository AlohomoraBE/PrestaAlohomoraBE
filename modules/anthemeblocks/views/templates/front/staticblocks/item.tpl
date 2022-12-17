<div class="product-banner">
  <div class="product-border"></div>
  <img src="{$an_staticblock->getImageLink()}" width="auto" height="auto" alt="{$an_staticblock->title|escape:'htmlall':'UTF-8'}">
  {if $an_staticblock->link!=''}
  <a href="{$an_staticblock->link}">
    {/if}
    <div class="banner-text-bl">
      <h2>{$an_staticblock->title|escape:'htmlall':'UTF-8'}</h2>
      {$an_staticblock->content nofilter}
      {if $an_staticblock->link!=''}
      <object>
        <a href="{$an_staticblock->link}">{l s='Shop now' mod='anthemeblocks'}</a>
      </object>
      {/if}
    </div>
    {if $an_staticblock->link!=''}
  </a>
  {/if}
</div>