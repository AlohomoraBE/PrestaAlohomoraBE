{$param['count'] = count($an_staticblock->getChildrenBlocks())}
<div class="advantages-box" {if $an_staticblock->getImageLink() != ''} style="background: url({$an_staticblock->getImageLink()}); background-size: cover;" {/if}>
  <div class="advantages-type-1 {if $an_staticblock->formdata and $an_staticblock->formdata->additional_field_advantagestype1_canteredimage == '1'} advantages-type-1-center{/if}">
    <div class="additional-text-type-1 {if $an_staticblock->formdata and $an_staticblock->formdata->additional_field_advantagestype1_additionaltext == '0'} additional-text-type-1-hidden{/if}">
    <h2 class="additional-text-type-1-title">{$an_staticblock->title|escape:'htmlall':'UTF-8'}</h2>
      {$an_staticblock->content nofilter}
    </div>
    {foreach from=$an_staticblock->getChildrenBlocks() item=block}
      {$block->getContent($param) nofilter}
    {/foreach}
  </div>
</div>

