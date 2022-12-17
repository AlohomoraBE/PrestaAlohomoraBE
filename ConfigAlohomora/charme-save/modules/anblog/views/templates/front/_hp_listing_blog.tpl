{*
* 2018 Anvanto
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author Anvanto (anvantoco@gmail.com)
*  @copyright  2018 anvanto.com

*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}
<article class="blog-item">
	<div class="blog-image-container">
		<a href="{$blog.link|escape:'html':'UTF-8'}" title="{$blog.title|escape:'html':'UTF-8'}">
			{if $blog.preview_url && $config->get('listing_show_image',1)}
				<div class="blog-image">
					<img src="{$blog.preview_url|escape:'html':'UTF-8'}" title="{$blog.title|escape:'html':'UTF-8'}" alt="" class="img-fluid" />
				</div>
			{elseif $blog.thumb_url && $config->get('listing_show_image',1)}
				<div class="blog-image">
					<img src="{$blog.thumb_url|escape:'html':'UTF-8'}" title="{$blog.title|escape:'html':'UTF-8'}" alt="" class="img-fluid" />
				</div>
			{/if}
		</a>
		<div class="blog-meta">
            {if $config->get('listing_show_author','1')&&!empty($blog.author)}
				<span class="blog-author">
					<span>{l s='Posted By' d='Shop.Theme.Global'}:</span>
					<a href="{$blog.author_link|escape:'html':'UTF-8'}" title="{$blog.author|escape:'html':'UTF-8'}">{$blog.author|escape:'html':'UTF-8'}</a>
				</span>
            {/if}

            {if $config->get('listing_show_category','1')}
				<span class="blog-cat">
					<span>{l s='In' d='Shop.Theme.Global'}:</span>
					<a href="{$blog.category_link|escape:'html':'UTF-8'}" title="{$blog.category_title|escape:'html':'UTF-8'}">{$blog.category_title|escape:'html':'UTF-8'}</a>
				</span>
            {/if}

            {if $config->get('listing_show_created','1')}
				<span class="blog-created">
					<span>{l s='On' d='Shop.Theme.Global'}: </span>
					<time class="date" datetime="{strtotime($blog.date_add)|date_format:"%Y"|escape:'html':'UTF-8'}">
						{assign var='blog_month' value=strtotime($blog.date_add)|date_format:"%B"}
                        {l s=$blog_month d='Shop.Theme.Global'},		<!-- month-->
                        {assign var='blog_day' value=strtotime($blog.date_add)|date_format:"%e"}
                        {l s=$blog_day d='Shop.Theme.Global'}, <!-- day of month -->
                        {assign var='blog_year' value=strtotime($blog.date_add)|date_format:"%Y"}
                        {l s=$blog_year d='Shop.Theme.Global'}	<!-- year -->
					</time>
				</span>
            {/if}

            {if isset($blog.comment_count)&&$config->get('listing_show_counter','1')}
				<span class="blog-ctncomment">
					<span>{l s='Comments' d='Shop.Theme.Global'}:</span>
                    {$blog.comment_count|intval}
				</span>
            {/if}

            {if $config->get('listing_show_hit','1')}
				<span class="blog-hit">
					<span>{l s='Views' d='Shop.Theme.Global'}:</span>
                    {$blog.hits|intval}
				</span>
            {/if}
		</div>
        {if $config->get('listing_show_title','1')}
			<h4 class="title">
				<a href="{$blog.link|escape:'html':'UTF-8'}" title="{$blog.title|escape:'html':'UTF-8'}">{$blog.title|escape:'html':'UTF-8'}</a>
			</h4>
        {/if}
	</div>
	<!--div class="blog-info">
		{if $config->get('listing_show_description','1')}
			<div class="blog-shortinfo">
				{$blog.description|strip_tags:'UTF-8'|truncate:160:'...' nofilter}{* HTML form , no escape necessary *}
			</div>
		{/if}
		{if $config->get('listing_show_readmore',1)}
			<p>
				<a href="{$blog.link|escape:'html':'UTF-8'}" title="{$blog.title|escape:'html':'UTF-8'}" class="more btn btn-primary">{l s='Read more' d='Shop.Theme.Global'}</a>
			</p>
		{/if}
	</div -->
	
	<div class="hidden-xl-down hidden-xl-up datetime-translate">
		{l s='Sunday' d='Shop.Theme.Global'}
		{l s='Monday' d='Shop.Theme.Global'}
		{l s='Tuesday' d='Shop.Theme.Global'}
		{l s='Wednesday' d='Shop.Theme.Global'}
		{l s='Thursday' d='Shop.Theme.Global'}
		{l s='Friday' d='Shop.Theme.Global'}
		{l s='Saturday' d='Shop.Theme.Global'}
		
		{l s='January' d='Shop.Theme.Global'}
		{l s='February' d='Shop.Theme.Global'}
		{l s='March' d='Shop.Theme.Global'}
		{l s='April' d='Shop.Theme.Global'}
		{l s='May' d='Shop.Theme.Global'}
		{l s='June' d='Shop.Theme.Global'}
		{l s='July' d='Shop.Theme.Global'}
		{l s='August' d='Shop.Theme.Global'}
		{l s='September' d='Shop.Theme.Global'}
		{l s='October' d='Shop.Theme.Global'}
		{l s='November' d='Shop.Theme.Global'}
		{l s='December' d='Shop.Theme.Global'}
					
	</div>
</article>
