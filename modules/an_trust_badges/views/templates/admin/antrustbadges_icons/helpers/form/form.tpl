{*
* 2021 Anvanto
*
* NOTICE OF LICENSE
*
* This file is not open source! Each license that you purchased is only available for 1 wesite only.
* If you want to use this file on more websites (or projects), you need to purchase additional licenses. 
* You are not allowed to redistribute, resell, lease, license, sub-license or offer our resources to any third party.
*
*  @author Anvanto <anvantoco@gmail.com>
*  @copyright  2021 Anvanto
*  @license    Valid for 1 website (or project) for each purchase of license
*  International Registered Trademark & Property of Anvanto
*}

{extends file="helpers/form/form.tpl"}

{block name="script"}
$(document).ready(function(){

});
{/block}

{block name="input"}
		
	{if $input.type == 'html'}
		{if isset($input.html_content)}
			{if $input.html_content == 'hr'}
			<hr />
			{else}
			{$input.html_content}
			{/if}
		{else}
			{$input.name}
		{/if}
	{elseif $input.type == 'codecssjs'}
        <div class="col-lg-9">
            <div class="form-group">
                <div {if  isset($input.classCol)}class="{$input.classCol|escape:'htmlall':'UTF-8'}"{/if}>
				{if $input.name == 'an_logo_codeCss'}
				<p><strong>{l s='Please, clean the cache of your browser, if you have changed this field.' mod='an_logo'}</strong></p>
				{/if}
					<textarea
							id="{if isset($input.id)}{$input.id|intval}{else}{$input.name|escape:'htmlall':'UTF-8'}{/if}"
							name="{$input.name|escape:'htmlall':'UTF-8'}"
							class="form-control"
							style="height: {$input.height|escape:'htmlall':'UTF-8'}"
							{if  isset($input.rows)}rows="{$input.rows|escape:'htmlall':'UTF-8'}"{/if}
							>{$fields_value[$input.name]|escape:'html':'UTF-8'}</textarea>		
				</div>
			</div>
			{block name="description"}
				{if isset($input.desc) && !empty($input.desc)}
					<p class="help-block">
						{if is_array($input.desc)}
							{foreach $input.desc as $p}
								{if is_array($p)}
									<span id="{$p.id}">{$p.text}</span><br />
								{else}
									{$p}<br />
								{/if}
							{/foreach}
						{else}
							{$input.desc}
						{/if}
					</p>
				{/if}
			{/block}
		</div>		
	{else}	
		{$smarty.block.parent}
    {/if}
{/block}