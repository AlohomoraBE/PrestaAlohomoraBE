{*
* 2022 Anvanto
*
* NOTICE OF LICENSE
*
* This file is not open source! Each license that you purchased is only available for 1 wesite only.
* If you want to use this file on more websites (or projects), you need to purchase additional licenses. 
* You are not allowed to redistribute, resell, lease, license, sub-license or offer our resources to any third party.
*
*  @author Anvanto <anvantoco@gmail.com>
*  @copyright  2022 Anvanto
*  @license    Valid for 1 website (or project) for each purchase of license
*  International Registered Trademark & Property of Anvanto
*}

{if count($widget) > 0 }
<div class="anaccordion-block">
    {if $anabTitle.anab_title != ''}
    <div class="h2">
      {$anabTitle.anab_title|escape:'htmlall':'UTF-8'}
    </div>
    {/if}

  <div class="anaccordion-panel-box" id="js-anaccordion">
    {foreach from=$widget item=item}
    <div class="anaccordion-panel-item">
    <div class="anaccordion-panel-head">
      <span class="anaccordion-panel-head-title h5">{$item.accordion_title|escape:'htmlall':'UTF-8'}</span>
    </div>
    <div class="anaccordion-panel-body">
      {$item.accordion_content nofilter}
    </div>
  </div>
  {/foreach}
  </div>
</div>
{/if}




