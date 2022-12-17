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
<div class="an_sg">
    <div class="sg-cover"></div>
    <div class="sg-modal">
        <div class="an_sizeguide">
            <i class="material-icons sg-btn-close">clear</i>
           {$widget.sizeguide_content|escape:'htmlall':'UTF-8' nofilter}
        </div>
    </div>
    <div class="open-modal-btn">
		<svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
			 viewBox="0 0 488 488" style="enable-background:new 0 0 488 488;" xml:space="preserve" width="22px" height="22px">
		<g transform="translate(0 -540.36)">
			<g>
				<g>
					<path d="M133.035,894.739c-12.101-11.002-31.002-10.802-42.103,0.3c-6.1,6.101-9.301,13.902-9.101,22.203
						c0.2,7.701,3.4,14.902,9.101,20.203c5.3,5.701,12.401,8.901,20.202,9.101c0.2,0,0.5,0,0.7,0v0c8.001,0,15.601-3.201,21.602-9.001
						c11.101-11.202,11.301-30.005,0.3-42.106C133.535,895.14,133.235,894.939,133.035,894.739z M119.134,923.444
						c-2.2,2.1-4.9,3.201-7.601,3.201c-1.7-0.1-4.1-0.6-6.2-2.9c-0.2-0.3-0.5-0.5-0.7-0.7c-2.3-2-2.9-4.501-2.9-6.201
						c-0.1-2.8,1.1-5.501,3.2-7.601c1.8-1.7,4.3-2.6,6.8-2.6c2.6,0,5.3,0.9,7.401,2.7
						C122.634,913.542,122.634,919.943,119.134,923.444z"/>
					<path d="M485.062,654.603L373.754,543.285c-3.9-3.901-10.201-3.901-14.101,0L2.925,900.04c-3.9,3.901-3.9,10.202,0,14.102
						l111.309,111.317c1.9,1.9,4.4,2.9,7.101,2.9s5.2-1.1,7.101-2.9l356.727-356.755C488.962,664.804,488.962,658.503,485.062,654.603
						z M431.758,693.709L431.758,693.709l-49.004-48.308c-3.9-3.901-10.301-3.801-14.101,0.1c-3.9,3.901-3.8,10.302,0.1,14.102
						l48.904,48.207l-21.602,21.603l-23.002-23.004c-3.9-3.901-10.201-3.901-14.101,0c-3.9,3.901-3.9,10.202,0,14.102l23.002,23.004
						l-21.302,21.303l-48.604-48.507c-3.9-3.901-10.201-3.901-14.101,0c-3.9,3.901-3.9,10.202,0,14.102l48.604,48.507l-21.302,21.303
						l-23.002-23.004c-3.9-3.901-10.201-3.901-14.101,0c-3.9,3.901-3.9,10.202,0,14.102l23.002,23.004l-21.702,21.703l-48.104-48.908
						c-3.9-3.901-10.201-4.001-14.101-0.1c-3.9,3.901-4,10.202-0.1,14.102l48.304,49.008l-21.302,21.303l-23.402-23.404
						c-3.9-3.901-10.201-3.901-14.101,0c-3.9,3.901-3.9,10.202,0,14.102l23.402,23.404l-21.302,21.303l-44.003-43.307
						c-3.9-3.901-10.301-3.801-14.101,0.1c-3.9,3.901-3.8,10.302,0.1,14.102l43.903,43.207l-83.006,83.013l-97.107-97.115
						l342.626-342.653l97.107,97.115L431.758,693.709z"/>
				</g>
			</g>
		</g>
		</svg>
        <span>{$widget.sizeguide_title|escape:'htmlall':'UTF-8'}</span>
    </div>
</div>
{/foreach}