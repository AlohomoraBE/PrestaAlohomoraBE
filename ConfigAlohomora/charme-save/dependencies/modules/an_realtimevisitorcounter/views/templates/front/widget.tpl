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

<div class="an_realtimevisitorcounter-block"
data-min-value="{$widget.min_value|intval}"
data-max-value="{$widget.max_value|intval}"
data-stroke-value="{$widget.stroke_value|intval}"
data-min-interval="{$widget.min_interval|intval}"
data-max-interval="{$widget.max_interval|intval}"
>
    <div class="an_realtimevisitorcounter-block-text">
        <span class="an_realtimevisitorcounter-label">{$widget.title_left|escape:'htmlall':'UTF-8'}</span>
        <span class="an_realtimevisitorcounter-counter visitors-counter">{$widget.min_value|intval}</span>
        <span class="an_realtimevisitorcounter-label_visitors">{$widget.title_right|escape:'htmlall':'UTF-8'}</span>
    </div>
</div>