<div class="anthemeblocks_homeslider-block {if $an_staticblock->formdata && $an_staticblock->formdata->additional_field_homeslider_t4_mobile=='0'}  anthemeblocks-homeslider-hide-mobile{/if} {if $an_staticblock->formdata && $an_staticblock->formdata->additional_field_homeslider_t4_desktop=='0'}  anthemeblocks-homeslider-hide-desktop{/if} {if $an_staticblock->formdata && $an_staticblock->formdata->additional_field_homeslider_t4_desktopcontent=='0'}  anthemeblocks-homeslider-hide-desktop-content{/if} {if $an_staticblock->formdata && $an_staticblock->formdata->additional_field_homeslider_t4_mobilecontent=='0'}  anthemeblocks-homeslider-hide-mobile-content{/if}">
	<div class="homeslider-text-{$an_staticblock->formdata->additional_field_homeslider_t4_textposition} {if $an_staticblock->formdata->additional_field_homeslider_t4_responsiveImage =='1'}img-responsive{/if} anthemeblocks-homeslider {if $an_staticblock->formdata->additional_field_homeslider_t4_preloader =='0'}owl-carousel{/if} owl-theme{if $an_staticblock->formdata && $an_staticblock->formdata->additional_field_homeslider_t4_mobile=='0'}  anthemeblocks-homeslider-hide-mobile{/if}" id="anthemeblocks-homeslider_{$an_staticblock->id}" {if $an_staticblock->formdata} data-items="{$an_staticblock->formdata->additional_field_homeslider_t4_items}" data-nav="{$an_staticblock->formdata->additional_field_homeslider_t4_nav}" data-dots="{$an_staticblock->formdata->additional_field_homeslider_dots}" data-loop="{$an_staticblock->formdata->additional_field_homeslider_t4_loop}"   data-autoplay="{$an_staticblock->formdata->additional_field_homeslider_t4_autoplay}" data-autoplaytimeout="{$an_staticblock->formdata->additional_field_homeslider_t4_autoplayTimeout}"{/if}>

	{foreach from=$an_staticblock->getChildrenBlocks() item=block}
		<div class="item">{$block->getContent() nofilter}</div>
	{/foreach}

	</div>
	{if $an_staticblock->formdata}
        {if $an_staticblock->formdata->additional_field_homeslider_t4_preloader}
        <div class="anthemeblocks-homeslider-loader">
            <div class="loader-dots">
                <div class="loader-image"></div>
            </div>
        </div>
        {/if}
    {/if}
</div>