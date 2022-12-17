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

{if isset($file_name) && $file_name != ''}
<img src="{$file_name|escape:'htmlall':'UTF-8'}" alt="" class="an-user-testimonials-list" />
{else}
{l s='No image' mod='an_user_testimonials'}
{/if}


