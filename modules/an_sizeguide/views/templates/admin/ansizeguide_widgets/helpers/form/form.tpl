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
	
	{if $input.type == 'inputProducts'}
	<div class="col-lg-12">
		<div id="{if isset($input.id)}{$input.id|escape:'html':'utf-8'}{else}{$input.name|escape:'html':'utf-8'}{/if}"
			class="{if isset($input.class)}{$input.class|escape:'html':'utf-8'}{/if} {* fixed-width-xl *}"
		>
		{foreach from=$fields_value[$input.name] item=item name=fo}
		<div class="js-an_sizeguide_products-line an_sizeguide_products-line"><input type="hidden" name="productIds[]" value="{$item.id_product}" />{* <img src="'+img+'" />*}<div class="label">{$item.name} (ref: {$item.reference}) <i class="material-icons delete js-an_sizeguide_products-remove">delete</i></div></div>
		{/foreach}
		</div>
	</div>
	{elseif $input.type == 'selectProducts'}
	
		
		{if isset($input.options.query) && !$input.options.query && isset($input.empty_message)}
			{$input.empty_message}
			{$input.required = false}
			{$input.desc = null}
		{else}
		<div>
			<select name="{$input.name|escape:'html':'utf-8'}"
					class="{if isset($input.class)}{$input.class|escape:'html':'utf-8'}{/if} {* fixed-width-xl *}"
					id="{if isset($input.id)}{$input.id|escape:'html':'utf-8'}{else}{$input.name|escape:'html':'utf-8'}{/if}"
					{if isset($input.multiple) && $input.multiple} multiple="multiple"{/if}
					{if isset($input.size)} size="{$input.size|escape:'html':'utf-8'}"{/if}
					{if isset($input.onchange)} onchange="{$input.onchange|escape:'html':'utf-8'}"{/if}
					{if isset($input.disabled) && $input.disabled} disabled="disabled"{/if}>
				{if isset($input.options.default)}
					<option value="{$input.options.default.value|escape:'html':'utf-8'}">{$input.options.default.label|escape:'html':'utf-8'}</option>
				{/if}
				{if isset($input.options.optiongroup)}
					{foreach $input.options.optiongroup.query AS $optiongroup}
						<optgroup label="{$optiongroup[$input.options.optiongroup.label]}">
							{foreach $optiongroup[$input.options.options.query] as $option}
								<option value="{$option[$input.options.options.id]}"
									{if isset($input.multiple)}
										{foreach $fields_value[$input.name] as $field_value}
											{if $field_value == $option[$input.options.options.id]}selected="selected"{/if}
										{/foreach}
									{else}
										{if $fields_value[$input.name] == $option[$input.options.options.id]}selected="selected"{/if}
									{/if}
								>{$option[$input.options.options.name]}</option>
							{/foreach}
						</optgroup>
					{/foreach}
				{else}
					{foreach $input.options.query AS $option}
						{if is_object($option)}
							<option value="{$option->$input.options.id}"
								{if isset($input.multiple)}
									{foreach $fields_value[$input.name] as $field_value}
										{if $field_value == $option->$input.options.id}
											selected="selected"
										{/if}
									{/foreach}
								{else}
									{if $fields_value[$input.name] == $option->$input.options.id}
										selected="selected"
									{/if}
								{/if}
							>{$option->$input.options.name}</option>
						{elseif $option == "-"}
							<option value="">-</option>
						{else}
							<option value="{$option[$input.options.id]}"
								{if isset($input.multiple)}
									{foreach $fields_value[$input.name] as $field_value}
										{if $field_value == $option[$input.options.id]}
											selected="selected"
										{/if}
									{/foreach}
								{else}
									{if $fields_value[$input.name] == $option[$input.options.id]}
										selected="selected"
									{/if}
								{/if}
							>{$option[$input.options.name]}</option>

						{/if}
					{/foreach}
				{/if}
			</select>
			
			<a class="btn btn-primary js-an-dt-products-add">{l s='Add' mod='an_dt_multiaccessories'}</a>
			</div>
			<div class="an-dt-products-selected">
				{foreach from=$fields_value[$input.name] item=field}
				<div class="an-dt-products-item" data-id="{$field.fp_product}">{$field.name} <a class="an-dt-remove js-an-dt-remove">Remove</a><input type="hidden" name="related_products[]" value="{$field.fp_product}" /></div>
				{/foreach}
			</div>
		{/if}
	
	
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