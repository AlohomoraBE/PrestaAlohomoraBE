{*
* 2007-2017 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author PrestaShop SA <contact@prestashop.com>
*  @copyright  2007-2017 PrestaShop SA
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}

<div class="block-contact col-md-3 links wrapper">
  <div class="hidden-sm-down">
     {hook h="displayFooterLogo"}
     <ul>
        {if $contact_infos.company}
            <li>
                {l s='[1]%company%[/1]'
                 sprintf=[
                 '[1]' => '<span>',
                 '[/1]' => '</span>',
                 '%company%' => $contact_infos.company
                 ]
                 d='Shop.Theme.Global'
                }
            </li>
        {/if}
        <li>
            {$contact_infos.address.country nofilter}
        </li>
        {if $contact_infos.address.address1}
            <li>
                {l s='[1]%address1%[/1]'
                sprintf=[
                '[1]' => '<span>',
                '[/1]' => '</span>',
                '%address1%' => $contact_infos.address.address1
                ]
                d='Shop.Theme.Global'
                }
            </li>
        {/if}
        {if $contact_infos.address.address2}
            <li>
                {l s='[1]%address2%[/1]'
                sprintf=[
                '[1]' => '<span>',
                '[/1]' => '</span>',
                '%address2%' => $contact_infos.address.address2
                ]
                d='Shop.Theme.Global'
                }
            </li>
        {/if}
        {if $contact_infos.address.city}
            <li>
                {l s='[1]%city%[/1]'
                sprintf=[
                '[1]' => '<span>',
                '[/1]' => '</span>',
                '%city%' => $contact_infos.address.city
                ]
                d='Shop.Theme.Global'
                }
            </li>
        {/if}
        {if $contact_infos.address.postcode}
            <li>
                {l s='[1]%postcode%[/1]'
                sprintf=[
                '[1]' => '<span>',
                '[/1]' => '</span>',
                '%postcode%' => $contact_infos.address.postcode
                ]
                d='Shop.Theme.Global'
                }
            </li>
        {/if}
        {if $contact_infos.phone}
            <li>
                {* [1][/1] is for a HTML tag. *}
                {l s='[1]%phone%[/1]'
                  sprintf=[
                  '[1]' => '<span>',
                  '[/1]' => '</span>',
                  '%phone%' => $contact_infos.phone
                  ]
                  d='Shop.Theme.Global'
                }
            </li>
        {/if}
        {if $contact_infos.fax}
            <li>
                {* [1][/1] is for a HTML tag. *}
                {l
                  s='Fax: [1]%fax%[/1]'
                  sprintf=[
                    '[1]' => '<span>',
                    '[/1]' => '</span>',
                    '%fax%' => $contact_infos.fax
                  ]
                  d='Shop.Theme.Global'
                }
            </li>
        {/if}
        {if $contact_infos.email}
            <li>
                {* [1][/1] is for a HTML tag. *}
                {l
                  s='[1]%email%[/1]'
                  sprintf=[
                    '[1]' => '<span>',
                    '[/1]' => '</span>',
                    '%email%' => $contact_infos.email
                  ]
                  d='Shop.Theme.Global'
                }
            </li>
        {/if}
      </ul>
  </div>
  <div class="hidden-md-up">
    {hook h="displayFooterLogo"}
    <div class="title">
      <a class="h3" href="{$urls.pages.stores}">{l s='Store information' d='Shop.Theme.Global'}</a>
    </div>
  </div>
</div>
