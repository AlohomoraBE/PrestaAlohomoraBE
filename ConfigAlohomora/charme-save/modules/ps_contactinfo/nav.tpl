{**
 * 2007-2017 PrestaShop
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
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
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright 2007-2017 PrestaShop SA
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}
<div id="_desktop_contact_link">
{if (Module::isEnabled('an_theme') and Module::getInstanceByName('an_theme')->getParam('header_typeHeader') == 'header1')
or (Module::isEnabled('an_theme') and Module::getInstanceByName('an_theme')->getParam('header_typeHeader') == 'header2')
or (Module::isEnabled('an_theme') and Module::getInstanceByName('an_theme')->getParam('header_typeHeader') == 'header3')}
  <div id="contact-link">
    <a href="{$urls.pages.contact}">{l s='Contact us' d='Shop.Theme.Global'}</a>
  </div>
 {/if}
 {if (Module::isEnabled('an_theme') and Module::getInstanceByName('an_theme')->getParam('header_typeHeader') == 'header6')}
    <ul id="nav_contact_info">
        {if $contact_infos.phone}
        <li>
          <span>{l s='Phone' d='Shop.Theme.Global'}:</span>
          {* [1][/1] is for a HTML tag. *}
          {l s='[1]%phone%[/1]'
            sprintf=[
            '[1]' => '<a href="tel:'|cat:$contact_infos.phone|cat:'">',
            '[/1]' => '</a>',
            '%phone%' => $contact_infos.phone
            ]
            d='Shop.Theme.Global'
          }
        </li>
        {/if}

        {if $contact_infos.email}
        <li>
        <span>{l s='Email' d='Shop.Theme.Global'}:</span>
        {* [1][/1] is for a HTML tag. *}
        {l
          s='[1]%email%[/1]'
          sprintf=[
            '[1]' => '<a href="mailto:'|cat:$contact_infos.email|cat:'" class="dropdown">',
            '[/1]' => '</a>',
            '%email%' => $contact_infos.email
          ]
          d='Shop.Theme.Global'
        }
        </li>
      {/if}
  {/if}
 {if (Module::isEnabled('an_theme') and Module::getInstanceByName('an_theme')->getParam('header_typeHeader') == 'header4')}
  <ul id="nav_contact_info">
      {if $contact_infos.phone}
      <li>
        <svg
         xmlns="http://www.w3.org/2000/svg"
         xmlns:xlink="http://www.w3.org/1999/xlink"
         width="15px" height="14px">
        <path fill-rule="evenodd"  fill="rgb(148, 148, 148)"
         d="M13.872,10.537 L11.710,8.524 C11.280,8.125 10.567,8.137 10.121,8.552 L9.032,9.565 C8.963,9.530 8.892,9.493 8.817,9.454 C8.130,9.099 7.189,8.613 6.198,7.690 C5.205,6.765 4.682,5.888 4.300,5.247 C4.260,5.179 4.221,5.114 4.183,5.052 L4.914,4.372 L5.273,4.037 C5.719,3.621 5.731,2.958 5.302,2.557 L3.140,0.544 C2.711,0.144 1.998,0.157 1.552,0.572 L0.942,1.143 L0.959,1.158 C0.755,1.401 0.584,1.681 0.457,1.983 C0.340,2.270 0.267,2.544 0.234,2.819 C-0.052,5.022 1.029,7.035 3.964,9.768 C8.020,13.544 11.289,13.259 11.430,13.245 C11.737,13.211 12.031,13.143 12.330,13.034 C12.652,12.917 12.952,12.759 13.212,12.569 L13.226,12.580 L13.843,12.017 C14.288,11.602 14.301,10.938 13.872,10.537 Z"/>
        </svg>
        {* [1][/1] is for a HTML tag. *}
        {l s='[1]%phone%[/1]'
          sprintf=[
          '[1]' => '<a href="tel:'|cat:$contact_infos.phone|cat:'">',
          '[/1]' => '</a>',
          '%phone%' => $contact_infos.phone
          ]
          d='Shop.Theme.Global'
        }
      </li>
      {/if}

      {if $contact_infos.email}
      <li>
      <svg
       xmlns="http://www.w3.org/2000/svg"
       xmlns:xlink="http://www.w3.org/1999/xlink"
       width="13px" height="10px">
      <path fill-rule="evenodd"  fill="rgb(148, 148, 148)"
       d="M9.755,5.534 C10.447,5.061 11.286,4.497 12.275,3.842 C12.550,3.658 12.792,3.452 13.000,3.225 L13.000,8.710 L9.755,5.534 ZM11.760,3.082 C10.586,3.880 9.700,4.482 9.099,4.891 C8.768,5.116 8.522,5.283 8.365,5.390 C8.341,5.407 8.305,5.432 8.256,5.466 C8.204,5.503 8.138,5.549 8.056,5.607 C7.899,5.718 7.769,5.808 7.665,5.877 C7.560,5.945 7.435,6.023 7.287,6.108 C7.140,6.193 7.001,6.257 6.870,6.300 C6.740,6.342 6.619,6.363 6.507,6.363 L6.500,6.363 L6.493,6.363 C6.382,6.363 6.261,6.342 6.130,6.300 C6.000,6.257 5.861,6.193 5.713,6.108 C5.565,6.023 5.440,5.946 5.336,5.877 C5.232,5.808 5.101,5.718 4.944,5.607 C4.862,5.549 4.796,5.503 4.744,5.466 C4.696,5.432 4.659,5.407 4.636,5.390 C4.433,5.251 4.188,5.083 3.903,4.889 C3.570,4.661 3.182,4.397 2.735,4.094 C1.908,3.533 1.412,3.196 1.248,3.082 C0.948,2.884 0.665,2.610 0.399,2.262 C0.133,1.914 0.000,1.591 0.000,1.293 C0.000,0.924 0.100,0.616 0.301,0.370 C0.502,0.124 0.788,0.000 1.161,0.000 L11.839,0.000 C12.154,0.000 12.426,0.112 12.656,0.334 C12.885,0.557 13.000,0.824 13.000,1.137 C13.000,1.511 12.881,1.868 12.645,2.209 C12.408,2.550 12.113,2.841 11.760,3.082 ZM3.246,5.532 L-0.000,8.710 L-0.000,3.225 C0.213,3.457 0.457,3.663 0.733,3.842 C1.760,4.526 2.597,5.088 3.246,5.532 ZM4.338,6.292 C4.614,6.491 4.837,6.646 5.009,6.757 C5.181,6.869 5.409,6.982 5.695,7.098 C5.980,7.214 6.246,7.272 6.493,7.272 L6.500,7.272 L6.507,7.272 C6.754,7.272 7.020,7.214 7.305,7.098 C7.591,6.982 7.819,6.869 7.991,6.757 C8.162,6.646 8.386,6.491 8.662,6.292 C8.743,6.235 8.828,6.175 8.917,6.113 L12.600,9.718 C12.385,9.905 12.131,9.999 11.839,9.999 L1.161,9.999 C0.869,9.999 0.615,9.905 0.400,9.718 L4.084,6.112 C4.176,6.177 4.261,6.237 4.338,6.292 Z"/>
      </svg>
      {* [1][/1] is for a HTML tag. *}
      {l
        s='[1]%email%[/1]'
        sprintf=[
          '[1]' => '<a href="mailto:'|cat:$contact_infos.email|cat:'" class="dropdown">',
          '[/1]' => '</a>',
          '%email%' => $contact_infos.email
        ]
        d='Shop.Theme.Global'
      }
      </li>
    {/if}
{/if}
{if (Module::isEnabled('an_theme') and Module::getInstanceByName('an_theme')->getParam('header_typeHeader') == 'header5')}
     {if $contact_infos.phone}
      <li>
       <svg
        xmlns="http://www.w3.org/2000/svg"
        xmlns:xlink="http://www.w3.org/1999/xlink"
        width="15px" height="14px">
       <path fill-rule="evenodd"  fill="rgb(148, 148, 148)"
        d="M13.872,10.537 L11.710,8.524 C11.280,8.125 10.567,8.137 10.121,8.552 L9.032,9.566 C8.963,9.530 8.892,9.493 8.817,9.454 C8.130,9.099 7.189,8.613 6.198,7.690 C5.205,6.765 4.682,5.888 4.300,5.247 C4.260,5.179 4.221,5.114 4.183,5.051 L4.914,4.372 L5.273,4.037 C5.719,3.622 5.732,2.958 5.302,2.557 L3.140,0.544 C2.711,0.145 1.998,0.157 1.552,0.572 L0.942,1.143 L0.959,1.158 C0.755,1.401 0.584,1.681 0.457,1.983 C0.340,2.270 0.267,2.544 0.234,2.819 C-0.051,5.022 1.030,7.035 3.964,9.768 C8.020,13.544 11.289,13.259 11.430,13.245 C11.737,13.211 12.031,13.143 12.330,13.034 C12.652,12.917 12.952,12.759 13.212,12.569 L13.226,12.580 L13.843,12.017 C14.288,11.602 14.301,10.938 13.872,10.537 Z"/>
       </svg>
        {* [1][/1] is for a HTML tag. *}
        {l s='[1]%phone%[/1]'
          sprintf=[
          '[1]' => '<a href="tel:'|cat:$contact_infos.phone|cat:'">',
          '[/1]' => '</a>',
          '%phone%' => $contact_infos.phone
          ]
          d='Shop.Theme.Global'
        }
      </li>
      {/if}

      {if $contact_infos.email}
      <li>
      <svg
       xmlns="http://www.w3.org/2000/svg"
       xmlns:xlink="http://www.w3.org/1999/xlink"
       width="14px" height="11px">
      <path fill-rule="evenodd"  fill="rgb(148, 148, 148)"
       d="M10.505,6.087 C11.250,5.567 12.155,4.947 13.219,4.227 C13.516,4.023 13.776,3.797 14.000,3.547 L14.000,9.581 L10.505,6.087 ZM12.664,3.391 C11.400,4.268 10.447,4.930 9.799,5.380 C9.443,5.627 9.178,5.811 9.008,5.929 C8.983,5.947 8.944,5.975 8.891,6.013 C8.835,6.053 8.764,6.104 8.676,6.168 C8.507,6.290 8.366,6.389 8.254,6.465 C8.142,6.540 8.007,6.625 7.848,6.719 C7.689,6.812 7.539,6.883 7.398,6.930 C7.258,6.976 7.128,7.000 7.008,7.000 L7.000,7.000 L6.992,7.000 C6.873,7.000 6.743,6.976 6.602,6.930 C6.461,6.883 6.311,6.812 6.153,6.719 C5.994,6.625 5.858,6.540 5.746,6.465 C5.634,6.389 5.494,6.290 5.324,6.168 C5.237,6.104 5.165,6.053 5.109,6.013 C5.057,5.975 5.017,5.947 4.992,5.929 C4.774,5.776 4.510,5.591 4.204,5.378 C3.844,5.127 3.426,4.837 2.945,4.504 C2.055,3.887 1.521,3.516 1.344,3.391 C1.021,3.172 0.716,2.871 0.430,2.489 C0.143,2.106 0.000,1.750 0.000,1.422 C0.000,1.016 0.108,0.677 0.324,0.407 C0.540,0.136 0.849,0.001 1.250,0.001 L12.750,0.001 C13.088,0.001 13.381,0.123 13.629,0.368 C13.876,0.613 14.000,0.907 14.000,1.251 C14.000,1.662 13.872,2.055 13.617,2.430 C13.362,2.805 13.044,3.125 12.664,3.391 ZM3.496,6.086 L-0.000,9.581 L-0.000,3.547 C0.229,3.802 0.492,4.029 0.789,4.227 C1.895,4.978 2.797,5.597 3.496,6.086 ZM4.672,6.922 C4.969,7.140 5.209,7.311 5.394,7.433 C5.579,7.556 5.825,7.680 6.133,7.808 C6.440,7.936 6.726,7.999 6.992,7.999 L7.000,7.999 L7.008,7.999 C7.273,7.999 7.560,7.936 7.867,7.808 C8.174,7.680 8.420,7.556 8.605,7.433 C8.790,7.311 9.031,7.140 9.328,6.922 C9.415,6.858 9.508,6.792 9.603,6.724 L13.569,10.690 C13.337,10.895 13.065,10.999 12.750,10.999 L1.250,10.999 C0.935,10.999 0.662,10.895 0.431,10.690 L4.398,6.723 C4.497,6.794 4.589,6.861 4.672,6.922 Z"/>
      </svg>
      {* [1][/1] is for a HTML tag. *}
      {l
        s='[1]%email%[/1]'
        sprintf=[
          '[1]' => '<a href="mailto:'|cat:$contact_infos.email|cat:'" class="dropdown">',
          '[/1]' => '</a>',
          '%email%' => $contact_infos.email
        ]
        d='Shop.Theme.Global'
      }
      </li>
    {/if}
     {if $contact_infos.address.address1}
    <li class="hidden-lg-down">
        <svg
         xmlns="http://www.w3.org/2000/svg"
         xmlns:xlink="http://www.w3.org/1999/xlink"
         width="11px" height="14px">
        <path fill-rule="evenodd"  fill="rgb(148, 148, 148)"
         d="M5.500,-0.000 C2.436,-0.000 -0.000,2.257 -0.000,5.096 C-0.000,8.882 5.500,14.000 5.500,14.000 C5.500,14.000 11.000,8.882 11.000,5.096 C11.000,2.257 8.564,-0.000 5.500,-0.000 ZM5.500,6.916 C4.400,6.916 3.536,6.115 3.536,5.096 C3.536,4.077 4.400,3.276 5.500,3.276 C6.600,3.276 7.464,4.077 7.464,5.096 C7.464,6.115 6.600,6.916 5.500,6.916 Z"/>
        </svg>
      {* [1][/1] is for a HTML tag. *}
      {l
        s='[1]%city% %address%[/1]'
        sprintf=[
          '[1]' => '<a href="#">',
          '[/1]' => '</a>',
          '%city%' => $contact_infos.address.city,
          '%address%' => $contact_infos.address.address1
        ]
        d='Shop.Theme.Global'
      }
    </li>
    {/if}
{/if}
</div>
