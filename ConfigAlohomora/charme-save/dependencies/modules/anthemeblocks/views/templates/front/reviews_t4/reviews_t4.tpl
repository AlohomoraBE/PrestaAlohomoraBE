<div class="reviews-wrap">
    <div class="anthemeblocks-reviews owl-carousel owl-theme{if $an_staticblock->formdata && $an_staticblock->formdata->additional_field_reviews_t4_mobile=='0'}  anthemeblocks-reviews-hide-mobile{/if}" id="anthemeblocks-reviews_{$an_staticblock->id}" {if $an_staticblock->formdata} data-nav="{$an_staticblock->formdata->additional_field_reviews_t4_nav}" data-dots="{$an_staticblock->formdata->additional_field_reviews_t4_dots}" data-loop="{$an_staticblock->formdata->additional_field_reviews_t4_loop}"   data-autoplay="{$an_staticblock->formdata->additional_field_reviews_t4_autoplay}" data-autoplaytimeout="{$an_staticblock->formdata->additional_field_reviews_t4_autoplayTimeout}"{/if}>
      {foreach from=$an_staticblock->getChildrenBlocks() item=block}
      <div class="item">
        {if $an_staticblock->getImageLink() != ''}
        <img src="{$an_staticblock->getImageLink()}" class="bg" alt="{$an_staticblock->title|escape:'htmlall':'UTF-8'}">
        {/if}
        {$block->getContent() nofilter}
      </div>
      {/foreach}

    </div>
    <div class="reviews-nav">
        <div class="container"></div>
    </div>
</div>