


{if count($widget) > 0}
<div class="anut-block owl-carousel owl-theme" id="anut_1" data-nav="1" data-dots="1" data-loop="1"   data-autoplay="0" >
    {foreach from=$widget item=item}
    <div class="anut-item">
        <div class="anut-desc">
            {if $item.file_name != ''}
                <div class="anut-icon" >
                    <img src="{$iconsUrl|escape:'htmlall':'UTF-8'}{$item.file_name|escape:'htmlall':'UTF-8'}" width="auto" height="auto" alt="{$item.testimonial_title|escape:'htmlall':'UTF-8'}">
                </div>
            {/if}
            <p class="anut-user h3">{$item.testimonial_title|escape:'htmlall':'UTF-8'}</p>
            <div class="anut-text">{$item.testimonial_content nofilter}</div>
        </div>
    </div>
    {/foreach}
</div>
{/if}





