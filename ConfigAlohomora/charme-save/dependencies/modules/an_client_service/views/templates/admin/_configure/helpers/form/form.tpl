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
{block name="field"}

    {if $input.type == 'number' or $input.type == 'float'}
        <div class="{if isset($input.col)}col-lg-{$input.col}{else}col-lg-9{/if}">
			<input type="number"
				   id="{if isset($input.id)}{$input.id|intval}{else}{$input.name|escape:'htmlall':'UTF-8'}{/if}"
				   name="{$input.name|escape:'htmlall':'UTF-8'}"
				   class="form-control {if isset($input.class)} {$input.class} {/if}"
				   value="{$fields_value[$input.name]|escape:'html':'UTF-8'}"
					{if isset($input.size)} size="{$input.size|intval}"{/if}
					{if isset($input.maxchar) && $input.maxchar} data-maxchar="{$input.maxchar|intval}"{/if}
					{if isset($input.maxlength) && $input.maxlength} maxlength="{$input.maxlength|intval}"{/if}
					{if isset($input.readonly) && $input.readonly} readonly="readonly"{/if}
					{if isset($input.disabled) && $input.disabled} disabled="disabled"{/if}
					{if isset($input.autocomplete) && !$input.autocomplete} autocomplete="off"{/if}
					{if isset($input.required) && $input.required} required="required" {/if}
					{if isset($input.max)} max="{$input.max|intval}"{/if}
					{if isset($input.min)} min="{$input.min|intval}"{/if}
					{if isset($input.placeholder) && $input.placeholder} placeholder="{$input.placeholder|escape:'htmlall':'UTF-8'}"{/if} />
			{if !empty($input.suffix)}
				<span class="input-group-addon">
				{$input.suffix|escape:'htmlall':'UTF-8'}
			</span>
			{/if}
		</div>
		
		{elseif $input.type == 'html'}
			{if isset($input.html_content)}
				{if $input.html_content == 'hr'}
				<hr />
				{else}
				{$input.html_content}
				{/if}
			{else}
				{$input.name}
			{/if}
		{else}
        {$smarty.block.parent}
    {/if}
{/block}
