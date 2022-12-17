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

<div id="_desktop_clientservice">
    <div class="clientservice_sg-cover"></div>
    <div class="mobile_item_wrapper">
        <span>{$widget.title|escape:'htmlall':'UTF-8'}</span>
        <span class="mobile-toggler">
            <svg 
              xmlns="http://www.w3.org/2000/svg"
              xmlns:xlink="http://www.w3.org/1999/xlink"
              width="5px" height="9px">
             <path fill-rule="evenodd"  fill="rgb(0, 0, 0)"
              d="M4.913,4.292 L0.910,0.090 C0.853,0.030 0.787,-0.000 0.713,-0.000 C0.639,-0.000 0.572,0.030 0.515,0.090 L0.086,0.541 C0.029,0.601 -0.000,0.670 -0.000,0.749 C-0.000,0.827 0.029,0.896 0.086,0.956 L3.462,4.500 L0.086,8.044 C0.029,8.104 -0.000,8.173 -0.000,8.251 C-0.000,8.330 0.029,8.399 0.086,8.459 L0.515,8.910 C0.572,8.970 0.639,9.000 0.713,9.000 C0.787,9.000 0.853,8.970 0.910,8.910 L4.913,4.707 C4.970,4.647 4.999,4.578 4.999,4.500 C4.999,4.422 4.970,4.353 4.913,4.292 Z"/>
             </svg>
        </span>
    </div>
    <div class="adropdown-mobile clientservice_sg-modal">
        <div class="an_clientservice">
            <i class="material-icons clientservice_sg-btn-close">clear</i>
            <h2 class="clientservice-title">{$widget.title|escape:'htmlall':'UTF-8'}</h2>
            {$widget.text_popup nofilter}
        </div>
    </div>
    <div class="clientservice_open-modal-btn">
        <span>{$widget.title|escape:'htmlall':'UTF-8'}</span>
    </div>
</div>