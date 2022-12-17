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
 <div id="_desktop_user_info">
   <div class="user-info">
       {if $logged}
         <a
         class="account dropdown-item
         {if $an_width_on_mobile =='992'}
           hidden-lg-up
         {else}
           hidden-md-up
         {/if}
         "
         href="{$my_account_url}"
         title="{l s='View my customer account' d='Shop.Theme.Customeraccount'}"
         rel="nofollow"
         >
           {if (Module::isEnabled('an_theme') and (Module::getInstanceByName('an_theme')->getParam('header_typeHeader') == 'header3'))}
               <svg class="hidden-sm-down"
                xmlns="http://www.w3.org/2000/svg"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                width="18px" height="18px">
               <path fill-rule="evenodd"  fill="rgb(0, 0, 0)"
                d="M15.364,11.636 C14.384,10.656 13.217,9.930 11.944,9.491 C13.307,8.552 14.203,6.980 14.203,5.203 C14.203,2.334 11.869,-0.000 9.000,-0.000 C6.131,-0.000 3.797,2.334 3.797,5.203 C3.797,6.980 4.693,8.552 6.056,9.491 C4.783,9.930 3.616,10.656 2.636,11.636 C0.936,13.336 0.000,15.596 0.000,18.000 L1.406,18.000 C1.406,13.813 4.813,10.406 9.000,10.406 C13.187,10.406 16.594,13.813 16.594,18.000 L18.000,18.000 C18.000,15.596 17.064,13.336 15.364,11.636 ZM9.000,9.000 C6.906,9.000 5.203,7.297 5.203,5.203 C5.203,3.110 6.906,1.406 9.000,1.406 C11.094,1.406 12.797,3.110 12.797,5.203 C12.797,7.297 11.094,9.000 9.000,9.000 Z"/>
               </svg>
               {/if}
                {if (Module::isEnabled('an_theme') and (Module::getInstanceByName('an_theme')->getParam('header_typeHeader') == 'header4'))}
                <svg class="hidden-sm-down"
                 xmlns="http://www.w3.org/2000/svg"
                 xmlns:xlink="http://www.w3.org/1999/xlink"
                 width="14px" height="14px">
                <path fill-rule="evenodd"  fill="rgb(148, 148, 148)"
                 d="M11.950,9.050 C11.187,8.288 10.280,7.723 9.290,7.382 C10.350,6.651 11.047,5.429 11.047,4.047 C11.047,1.815 9.231,-0.000 7.000,-0.000 C4.769,-0.000 2.953,1.815 2.953,4.047 C2.953,5.429 3.650,6.651 4.710,7.382 C3.720,7.723 2.813,8.288 2.050,9.050 C0.728,10.372 0.000,12.130 0.000,14.000 L1.094,14.000 C1.094,10.743 3.743,8.094 7.000,8.094 C10.257,8.094 12.906,10.743 12.906,14.000 L14.000,14.000 C14.000,12.130 13.272,10.372 11.950,9.050 ZM7.000,7.000 C5.372,7.000 4.047,5.675 4.047,4.047 C4.047,2.419 5.372,1.094 7.000,1.094 C8.628,1.094 9.953,2.419 9.953,4.047 C9.953,5.675 8.628,7.000 7.000,7.000 Z"/>
                </svg>
                {/if}
                {if (Module::isEnabled('an_theme') and (Module::getInstanceByName('an_theme')->getParam('header_typeHeader') == 'header5'))}
                <svg class="hidden-sm-down"
                xmlns="http://www.w3.org/2000/svg"
                xmlns:xlink="http://www.w3.org/1999/xlink"
                width="17px" height="17px">
               <path fill-rule="evenodd"  fill="rgb(0, 0, 0)"
                d="M14.510,10.990 C13.585,10.064 12.483,9.378 11.280,8.964 C12.568,8.077 13.414,6.592 13.414,4.914 C13.414,2.204 11.210,-0.000 8.500,-0.000 C5.790,-0.000 3.586,2.204 3.586,4.914 C3.586,6.592 4.432,8.077 5.720,8.964 C4.517,9.378 3.415,10.064 2.490,10.990 C0.884,12.595 -0.000,14.730 -0.000,17.000 L1.328,17.000 C1.328,13.045 4.545,9.828 8.500,9.828 C12.455,9.828 15.672,13.045 15.672,17.000 L17.000,17.000 C17.000,14.730 16.116,12.595 14.510,10.990 ZM8.500,8.500 C6.523,8.500 4.914,6.891 4.914,4.914 C4.914,2.937 6.523,1.328 8.500,1.328 C10.477,1.328 12.086,2.937 12.086,4.914 C12.086,6.891 10.477,8.500 8.500,8.500 Z"/>
               </svg>
                {/if}
           <span>{$customerName|truncate:20:'...'}</span>
         </a>
         <div class="signin dropdown js-dropdown
         {if $an_width_on_mobile =='992'}
           hidden-md-down
         {else}
           hidden-sm-down
         {/if}
         ">
           <button data-toggle="dropdown" class="hidden-sm-down btn-unstyle" aria-haspopup="true" aria-expanded="false" aria-label="{l s='Logout dropdown' d='Shop.Theme.Global'}">
             {if (Module::isEnabled('an_theme') and (Module::getInstanceByName('an_theme')->getParam('header_typeHeader') == 'header3'))}
                 <svg class="hidden-sm-down"
                  xmlns="http://www.w3.org/2000/svg"
                  xmlns:xlink="http://www.w3.org/1999/xlink"
                  width="18px" height="18px">
                 <path fill-rule="evenodd"  fill="rgb(0, 0, 0)"
                  d="M15.364,11.636 C14.384,10.656 13.217,9.930 11.944,9.491 C13.307,8.552 14.203,6.980 14.203,5.203 C14.203,2.334 11.869,-0.000 9.000,-0.000 C6.131,-0.000 3.797,2.334 3.797,5.203 C3.797,6.980 4.693,8.552 6.056,9.491 C4.783,9.930 3.616,10.656 2.636,11.636 C0.936,13.336 0.000,15.596 0.000,18.000 L1.406,18.000 C1.406,13.813 4.813,10.406 9.000,10.406 C13.187,10.406 16.594,13.813 16.594,18.000 L18.000,18.000 C18.000,15.596 17.064,13.336 15.364,11.636 ZM9.000,9.000 C6.906,9.000 5.203,7.297 5.203,5.203 C5.203,3.110 6.906,1.406 9.000,1.406 C11.094,1.406 12.797,3.110 12.797,5.203 C12.797,7.297 11.094,9.000 9.000,9.000 Z"/>
                 </svg>
                 {/if}
                  {if (Module::isEnabled('an_theme') and (Module::getInstanceByName('an_theme')->getParam('header_typeHeader') == 'header4'))}
                  <svg class="hidden-sm-down"
                   xmlns="http://www.w3.org/2000/svg"
                   xmlns:xlink="http://www.w3.org/1999/xlink"
                   width="14px" height="14px">
                  <path fill-rule="evenodd"  fill="rgb(148, 148, 148)"
                   d="M11.950,9.050 C11.187,8.288 10.280,7.723 9.290,7.382 C10.350,6.651 11.047,5.429 11.047,4.047 C11.047,1.815 9.231,-0.000 7.000,-0.000 C4.769,-0.000 2.953,1.815 2.953,4.047 C2.953,5.429 3.650,6.651 4.710,7.382 C3.720,7.723 2.813,8.288 2.050,9.050 C0.728,10.372 0.000,12.130 0.000,14.000 L1.094,14.000 C1.094,10.743 3.743,8.094 7.000,8.094 C10.257,8.094 12.906,10.743 12.906,14.000 L14.000,14.000 C14.000,12.130 13.272,10.372 11.950,9.050 ZM7.000,7.000 C5.372,7.000 4.047,5.675 4.047,4.047 C4.047,2.419 5.372,1.094 7.000,1.094 C8.628,1.094 9.953,2.419 9.953,4.047 C9.953,5.675 8.628,7.000 7.000,7.000 Z"/>
                  </svg>
                  {/if}
                  {if (Module::isEnabled('an_theme') and (Module::getInstanceByName('an_theme')->getParam('header_typeHeader') == 'header5'))}
                  <svg class="hidden-sm-down"
                  xmlns="http://www.w3.org/2000/svg"
                  xmlns:xlink="http://www.w3.org/1999/xlink"
                  width="17px" height="17px">
                 <path fill-rule="evenodd"  fill="rgb(0, 0, 0)"
                  d="M14.510,10.990 C13.585,10.064 12.483,9.378 11.280,8.964 C12.568,8.077 13.414,6.592 13.414,4.914 C13.414,2.204 11.210,-0.000 8.500,-0.000 C5.790,-0.000 3.586,2.204 3.586,4.914 C3.586,6.592 4.432,8.077 5.720,8.964 C4.517,9.378 3.415,10.064 2.490,10.990 C0.884,12.595 -0.000,14.730 -0.000,17.000 L1.328,17.000 C1.328,13.045 4.545,9.828 8.500,9.828 C12.455,9.828 15.672,13.045 15.672,17.000 L17.000,17.000 C17.000,14.730 16.116,12.595 14.510,10.990 ZM8.500,8.500 C6.523,8.500 4.914,6.891 4.914,4.914 C4.914,2.937 6.523,1.328 8.500,1.328 C10.477,1.328 12.086,2.937 12.086,4.914 C12.086,6.891 10.477,8.500 8.500,8.500 Z"/>
                 </svg>
                  {/if}
             <span class="expand-more">{$customerName|truncate:20:'...'}</span>
             <i class="material-icons expand-more">&#xE313;</i>
           </button>
         <ul class="dropdown-menu  
           " aria-labelledby="signin-label">
           <li>
               <a
                 class="logout dropdown-item"
                 href="{$my_account_url}"
                 rel="nofollow"
               >
                 {l s='My profile' d='Shop.Theme.Actions'}
               </a>
             </li>
           <li>
             <a
               class="logout dropdown-item"
               href="{$logout_url}"
               rel="nofollow"
             >
               {l s='Sign out' d='Shop.Theme.Actions'}
             </a>
           </li>
         </ul>
       </div>
       {else}
         <a
           href="{$my_account_url}"
           title="{l s='Log in to your customer account' d='Shop.Theme.Customeraccount'}"
           rel="nofollow"
         >
        {if (Module::isEnabled('an_theme') and (Module::getInstanceByName('an_theme')->getParam('header_typeHeader') == 'header3'))}
                 <svg class="hidden-sm-down"
                  xmlns="http://www.w3.org/2000/svg"
                  xmlns:xlink="http://www.w3.org/1999/xlink"
                  width="18px" height="18px">
                 <path fill-rule="evenodd"  fill="rgb(0, 0, 0)"
                  d="M15.364,11.636 C14.384,10.656 13.217,9.930 11.944,9.491 C13.307,8.552 14.203,6.980 14.203,5.203 C14.203,2.334 11.869,-0.000 9.000,-0.000 C6.131,-0.000 3.797,2.334 3.797,5.203 C3.797,6.980 4.693,8.552 6.056,9.491 C4.783,9.930 3.616,10.656 2.636,11.636 C0.936,13.336 0.000,15.596 0.000,18.000 L1.406,18.000 C1.406,13.813 4.813,10.406 9.000,10.406 C13.187,10.406 16.594,13.813 16.594,18.000 L18.000,18.000 C18.000,15.596 17.064,13.336 15.364,11.636 ZM9.000,9.000 C6.906,9.000 5.203,7.297 5.203,5.203 C5.203,3.110 6.906,1.406 9.000,1.406 C11.094,1.406 12.797,3.110 12.797,5.203 C12.797,7.297 11.094,9.000 9.000,9.000 Z"/>
                 </svg>
                 {/if}
                  {if (Module::isEnabled('an_theme') and (Module::getInstanceByName('an_theme')->getParam('header_typeHeader') == 'header4'))}
                  <svg class="hidden-sm-down"
                   xmlns="http://www.w3.org/2000/svg"
                   xmlns:xlink="http://www.w3.org/1999/xlink"
                   width="14px" height="14px">
                  <path fill-rule="evenodd"  fill="rgb(148, 148, 148)"
                   d="M11.950,9.050 C11.187,8.288 10.280,7.723 9.290,7.382 C10.350,6.651 11.047,5.429 11.047,4.047 C11.047,1.815 9.231,-0.000 7.000,-0.000 C4.769,-0.000 2.953,1.815 2.953,4.047 C2.953,5.429 3.650,6.651 4.710,7.382 C3.720,7.723 2.813,8.288 2.050,9.050 C0.728,10.372 0.000,12.130 0.000,14.000 L1.094,14.000 C1.094,10.743 3.743,8.094 7.000,8.094 C10.257,8.094 12.906,10.743 12.906,14.000 L14.000,14.000 C14.000,12.130 13.272,10.372 11.950,9.050 ZM7.000,7.000 C5.372,7.000 4.047,5.675 4.047,4.047 C4.047,2.419 5.372,1.094 7.000,1.094 C8.628,1.094 9.953,2.419 9.953,4.047 C9.953,5.675 8.628,7.000 7.000,7.000 Z"/>
                  </svg>
                  {/if}
                  {if (Module::isEnabled('an_theme') and (Module::getInstanceByName('an_theme')->getParam('header_typeHeader') == 'header5'))}
                  <svg class="hidden-sm-down"
                  xmlns="http://www.w3.org/2000/svg"
                  xmlns:xlink="http://www.w3.org/1999/xlink"
                  width="17px" height="17px">
                 <path fill-rule="evenodd"  fill="rgb(0, 0, 0)"
                  d="M14.510,10.990 C13.585,10.064 12.483,9.378 11.280,8.964 C12.568,8.077 13.414,6.592 13.414,4.914 C13.414,2.204 11.210,-0.000 8.500,-0.000 C5.790,-0.000 3.586,2.204 3.586,4.914 C3.586,6.592 4.432,8.077 5.720,8.964 C4.517,9.378 3.415,10.064 2.490,10.990 C0.884,12.595 -0.000,14.730 -0.000,17.000 L1.328,17.000 C1.328,13.045 4.545,9.828 8.500,9.828 C12.455,9.828 15.672,13.045 15.672,17.000 L17.000,17.000 C17.000,14.730 16.116,12.595 14.510,10.990 ZM8.500,8.500 C6.523,8.500 4.914,6.891 4.914,4.914 C4.914,2.937 6.523,1.328 8.500,1.328 C10.477,1.328 12.086,2.937 12.086,4.914 C12.086,6.891 10.477,8.500 8.500,8.500 Z"/>
                 </svg>
                  {/if}
                   {if (Module::isEnabled('an_theme') and (Module::getInstanceByName('an_theme')->getParam('header_typeHeader') == 'header1'
                            or Module::getInstanceByName('an_theme')->getParam('header_typeHeader') == 'header2'
                            or Module::getInstanceByName('an_theme')->getParam('header_typeHeader') == 'header3'
                            or Module::getInstanceByName('an_theme')->getParam('header_typeHeader') == 'header4'
                            or Module::getInstanceByName('an_theme')->getParam('header_typeHeader') == 'header5'
                            or Module::getInstanceByName('an_theme')->getParam('header_typeHeader') == 'header6'))}
                  <span class="account-login">{l s='Sign in' d='Shop.Theme.Actions'}</span>
                  {/if}
         </a>
       {/if}
       <!--
     {if $logged}
       <a
         class="account"
         href="{$my_account_url}"
         title="{l s='View my customer account' d='Shop.Theme.Customeraccount'}"
         rel="nofollow"
       >
         <span>{$customerName}</span>
       </a>
       <a
         class="logout"
         href="{$logout_url}"
         rel="nofollow"
       >
         {l s='Sign out' d='Shop.Theme.Actions'}
       </a>
     {else}
       <a
         href="{$my_account_url}"
         title="{l s='Log in to your customer account' d='Shop.Theme.Customeraccount'}"
         rel="nofollow"
       >
         <span>{l s='Sign Up' d='Shop.Theme.Actions'}</span>
       </a>
     {/if}
     -->
   </div>
 </div>
 