<div class="anthemeblocks_homeslider-block {if $an_staticblock->formdata && $an_staticblock->formdata->additional_field_homeslider_mobile=='0'}  anthemeblocks-homeslider-hide-mobile{/if} {if $an_staticblock->formdata && $an_staticblock->formdata->additional_field_homeslider_desktop=='0'}  anthemeblocks-homeslider-hide-desktop{/if} {if $an_staticblock->formdata && $an_staticblock->formdata->additional_field_homeslider_desktopcontent=='0'}  anthemeblocks-homeslider-hide-desktop-content{/if} {if $an_staticblock->formdata && $an_staticblock->formdata->additional_field_homeslider_mobilecontent=='0'}  anthemeblocks-homeslider-hide-mobile-content{/if}">
	<div class="{if $an_staticblock->formdata->additional_field_homeslider_responsiveImage =='1'}img-responsive{/if} anthemeblocks-homeslider {if $an_staticblock->formdata->additional_field_homeslider_preloader =='0'}owl-carousel{/if} owl-theme{if $an_staticblock->formdata && $an_staticblock->formdata->additional_field_homeslider_mobile=='0'}  anthemeblocks-homeslider-hide-mobile{/if}" id="anthemeblocks-homeslider_{$an_staticblock->id}" data-lazy="{$an_staticblock->formdata->additional_field_homeslider_lazyload}" {if $an_staticblock->formdata} data-items="{$an_staticblock->formdata->additional_field_homeslider_items}" data-nav="{$an_staticblock->formdata->additional_field_homeslider_nav}" data-dots="{$an_staticblock->formdata->additional_field_homeslider_dots}" data-loop="{$an_staticblock->formdata->additional_field_homeslider_loop}"   data-autoplay="{$an_staticblock->formdata->additional_field_homeslider_autoplay}" data-autoplaytimeout="{$an_staticblock->formdata->additional_field_homeslider_autoplayTimeout}"{/if}>

	{foreach from=$an_staticblock->getChildrenBlocks() item=block}
        {$param['lazyload'] = $an_staticblock->formdata->additional_field_homeslider_lazyload}
        <div class="item">{$block->getContent($param) nofilter}</div>
	{/foreach}

	</div>
	{if $an_staticblock->formdata}
        <style>
            {if $an_staticblock->formdata->additional_field_homeslider_preloader1920}
            .anthemeblocks_homeslider-block:not(.initialized),
            .anthemeblocks-homeslider-loader {
                height: {$an_staticblock->formdata->additional_field_homeslider_preloader1920}px;
            }
            {/if}
            @media (max-width: 1600px) {
                {if $an_staticblock->formdata->additional_field_homeslider_preloader1600}
                .anthemeblocks_homeslider-block:not(.initialized),
                .anthemeblocks-homeslider-loader {
                    height: {$an_staticblock->formdata->additional_field_homeslider_preloader1600}px;
                }
                {/if}
            }
            @media (max-width: 1366px) {
                {if $an_staticblock->formdata->additional_field_homeslider_preloader1366}
                .anthemeblocks_homeslider-block:not(.initialized),
                .anthemeblocks-homeslider-loader {
                    height: {$an_staticblock->formdata->additional_field_homeslider_preloader1366}px;
                }
                {/if}
            }
            @media (max-width: 991px) {
                {if $an_staticblock->formdata->additional_field_homeslider_preloader991}
                .anthemeblocks_homeslider-block:not(.initialized),
                .anthemeblocks-homeslider-loader {
                    height: {$an_staticblock->formdata->additional_field_homeslider_preloader991}px;
                }
                {/if}
            }
            @media (max-width: 767px) {
                {if $an_staticblock->formdata->additional_field_homeslider_preloader767}
                .anthemeblocks_homeslider-block:not(.initialized),
                .anthemeblocks-homeslider-loader {
                    height: {$an_staticblock->formdata->additional_field_homeslider_preloader767}px;
                }
                {/if}
            }
        </style>
        {if $an_staticblock->formdata->additional_field_homeslider_preloader}
        <div class="anthemeblocks-homeslider-loader">
            <div class="anthemeblocks-loader-image"></div>
        </div>
        {/if}
    {/if}
</div>