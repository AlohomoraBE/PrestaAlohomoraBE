{if $an_staticblock->link != ''}
<a class="anthemebanner-link" href="{$an_staticblock->link}">
{/if}
<div class="anthemebanner">
   <img src="{$an_staticblock->getImageLink()}" width="auto" height="auto" alt="{$an_staticblock->title|escape:'htmlall':'UTF-8'}">
</div>
{if $an_staticblock->link != ''}
</a>
{/if}
