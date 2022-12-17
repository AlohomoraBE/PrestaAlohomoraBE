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

{foreach from=$widgets item=widget}
<div class="an_trust_badges-container clearfix {$widget.class|escape:'htmlall':'UTF-8'}">
	{if $widget.widget_title != ''}
	<div class="an_trust_badges-title">{$widget.widget_title|escape:'htmlall':'UTF-8'}</div>
	{/if}
	<ul class="an_trust_badges-list">
		{foreach from=$icons item=icon}
		<li>
			{if $icon.type_icon == '1'}
			<div class="an_trust_badges-svg">{$icon.code nofilter}</div>
			{elseif $icon.file_name !=''}
			<img src="{$iconsUrl}{$icon.file_name}"{if $icon.icon_title !=''} alt="{$icon.icon_title}"{/if} class="an_trust_badges-list-image" />
			{/if}
		</li>	
		{/foreach}
	</ul>
</div>
{/foreach}



