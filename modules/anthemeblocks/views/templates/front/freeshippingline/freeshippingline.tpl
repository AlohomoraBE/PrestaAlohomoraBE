{if $an_staticblock->link != ''}
<a class="anthemeshipping-link" href="{$an_staticblock->link}">
{/if}
<div class="anthemeshipping-line">
   {$an_staticblock->content nofilter}
   <a class="btn-close-line"><i class="material-icons">&#xE5CD;</i></a>
</div>
{if $an_staticblock->link != ''}
</a>
{/if}
