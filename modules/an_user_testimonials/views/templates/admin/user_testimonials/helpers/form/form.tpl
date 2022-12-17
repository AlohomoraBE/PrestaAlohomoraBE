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

{block name="input"}

	{if $input.type == 'html'}
		{if isset($input.html_content)}
			{if $input.html_content == 'hr'}
			<hr />
			{else}
			{$input.html_content}
			{/if}
		{else}
			{$input.name|escape:'htmlall':'UTF-8'}
		{/if}
	{else}	
		{$smarty.block.parent}
		{if $input.type == 'file'}
		<div class="form-group">
			<div class="col-lg-8">		
				<a class="btn btn-default usertestimonials-del-img-bt"><i class="icon-trash"></i>{l s='Delete' mod='an_user_testimonials'}</a>	
				<input class ="usertestimonials-input-del" type = "hidden" name = "image" id = "image_del" value = "0">
			</div>
		</div>
		{/if}


    {/if}
{/block}