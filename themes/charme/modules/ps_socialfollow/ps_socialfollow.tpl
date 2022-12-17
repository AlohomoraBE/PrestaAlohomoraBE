{*
* 2007-2016 PrestaShop
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
*  @copyright  2007-2016 PrestaShop SA

*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}

{block name='block_social'}
  <div class="block-social">
    <ul>
      {foreach from=$social_links item='social_link'}
        <li class="{$social_link.class}">
          <a href="{$social_link.url}" target="_blank">
                <span class="anicon">
                    {if $social_link.class=="facebook"}
                       <svg id="Layer_1" data-name="Layer 1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 7 12"><path class="cls-1" d="M13.24,3.5H11.56a2.84,2.84,0,0,0-3.11,3V7.81H6.76a.26.26,0,0,0-.26.25v2a.26.26,0,0,0,.26.25H8.45v5a.26.26,0,0,0,.27.24h2.2a.25.25,0,0,0,.26-.24v-5h2a.26.26,0,0,0,.26-.25v-2a.21.21,0,0,0-.08-.17.25.25,0,0,0-.18-.08h-2V6.66c0-.55.15-.84.92-.84h1.14a.25.25,0,0,0,.26-.24V3.75A.26.26,0,0,0,13.24,3.5Z" transform="translate(-6.5 -3.5)"/></svg>
                   {elseif $social_link.class=="instagram"}
                       <svg id="Layer_1" data-name="Layer 1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 12 12"><path class="cls-1" d="M16.47,7a4.39,4.39,0,0,0-.28-1.46,3,3,0,0,0-.69-1.06,2.9,2.9,0,0,0-1.07-.69A4.32,4.32,0,0,0,13,3.54c-.64,0-.85,0-2.48,0s-1.83,0-2.47,0a4.42,4.42,0,0,0-1.46.27,3,3,0,0,0-1.06.7,2.86,2.86,0,0,0-.69,1.06A4.39,4.39,0,0,0,4.54,7c0,.64,0,.84,0,2.47s0,1.83,0,2.47a4.42,4.42,0,0,0,.27,1.46,3,3,0,0,0,.7,1.06,2.89,2.89,0,0,0,1.06.7A4.42,4.42,0,0,0,8,15.46c.64,0,.84,0,2.47,0s1.83,0,2.47,0a4.42,4.42,0,0,0,1.46-.27,3.11,3.11,0,0,0,1.76-1.76A4.42,4.42,0,0,0,16.46,12c0-.64,0-.84,0-2.47S16.5,7.67,16.47,7Zm-1.08,4.9A3.43,3.43,0,0,1,15.18,13,2,2,0,0,1,14,14.18a3.43,3.43,0,0,1-1.11.21c-.63,0-.82,0-2.43,0s-1.79,0-2.42,0A3.37,3.37,0,0,1,7,14.18,2,2,0,0,1,5.83,13a3.43,3.43,0,0,1-.21-1.11c0-.63,0-.82,0-2.42s0-1.8,0-2.43A3.43,3.43,0,0,1,5.83,6,2,2,0,0,1,7,4.83a3.24,3.24,0,0,1,1.11-.2c.64,0,.83,0,2.43,0s1.79,0,2.42,0a3.31,3.31,0,0,1,1.12.2,1.84,1.84,0,0,1,.68.45,1.76,1.76,0,0,1,.45.69,3.43,3.43,0,0,1,.21,1.11c0,.63,0,.82,0,2.43S15.42,11.29,15.39,11.93ZM10.5,6.42A3.08,3.08,0,1,0,13.59,9.5,3.08,3.08,0,0,0,10.5,6.42Zm0,5.08a2,2,0,1,1,2-2A2,2,0,0,1,10.5,11.5Zm3.21-5.92a.72.72,0,1,0,.72.72A.72.72,0,0,0,13.71,5.58Z" transform="translate(-4.5 -3.5)"/></svg>
                   {elseif $social_link.class=="twitter"}
                       <svg id="Layer_1" data-name="Layer 1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 13 11"><path class="cls-1" d="M16.5,5.8A5.35,5.35,0,0,1,15,6.24a2.71,2.71,0,0,0,1.18-1.53,5.38,5.38,0,0,1-1.69.67A2.64,2.64,0,0,0,12.5,4.5,2.72,2.72,0,0,0,9.84,7.28a2.59,2.59,0,0,0,.06.63A7.43,7.43,0,0,1,4.41,5a2.85,2.85,0,0,0,.81,3.71A2.53,2.53,0,0,1,4,8.37v0a2.76,2.76,0,0,0,2.14,2.73,2.69,2.69,0,0,1-.7.09,2.85,2.85,0,0,1-.51,0,2.73,2.73,0,0,0,2.49,1.93,5.2,5.2,0,0,1-3.3,1.18,4.49,4.49,0,0,1-.64,0A7.24,7.24,0,0,0,7.59,15.5a7.7,7.7,0,0,0,7.58-7.9c0-.12,0-.24,0-.36A5.41,5.41,0,0,0,16.5,5.8Z" transform="translate(-3.5 -4.5)"/></svg>
                   {elseif $social_link.class=="youtube"}
                       <svg id="Layer_1" data-name="Layer 1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 14 10"><path class="cls-1" d="M16.19,5.93l0,.11A1.8,1.8,0,0,0,15,4.8h0a40.93,40.93,0,0,0-5.48-.3A39.57,39.57,0,0,0,4,4.8,1.76,1.76,0,0,0,2.81,6h0a20,20,0,0,0,0,7l0-.11A1.8,1.8,0,0,0,4,14.2H4a41.07,41.07,0,0,0,5.49.3A41,41,0,0,0,15,14.2,1.8,1.8,0,0,0,16.21,13h0a19.12,19.12,0,0,0,.29-3.33V9.37a19.39,19.39,0,0,0-.31-3.44ZM8.1,11.65V7.36l3.66,2.15Z" transform="translate(-2.5 -4.5)"/></svg>
                   {elseif $social_link.class=="linkedin"}
                       <svg id="Layer_1" data-name="Layer 1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 12 12"><path class="cls-1" d="M12.52,7.29a2.6,2.6,0,0,0-2.35,1.29h0V7.49H7.74v8h2.49v-4c0-1,.2-2,1.49-2S13,10.67,13,11.6v3.9H15.5V11.1C15.5,9,15,7.29,12.52,7.29ZM3.7,15.5H6.19v-8H3.7Zm1.24-12A1.45,1.45,0,1,0,6.38,4.94,1.45,1.45,0,0,0,4.94,3.5Z" transform="translate(-3.5 -3.5)"/></svg>
                   {elseif $social_link.class=="googleplus"}
                        <svg id="Layer_1" data-name="Layer 1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 12 12"><path class="cls-1" d="M12.52,7.29a2.6,2.6,0,0,0-2.35,1.29h0V7.49H7.74v8h2.49v-4c0-1,.2-2,1.49-2S13,10.67,13,11.6v3.9H15.5V11.1C15.5,9,15,7.29,12.52,7.29ZM3.7,15.5H6.19v-8H3.7Zm1.24-12A1.45,1.45,0,1,0,6.38,4.94,1.45,1.45,0,0,0,4.94,3.5Z" transform="translate(-3.5 -3.5)"/></svg>
                    {elseif $social_link.class=="rss"}
                       <svg id="Layer_1" data-name="Layer 1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 11 11"><path class="cls-1" d="M6.13,12.23a1.64,1.64,0,0,0,0,3.27,1.64,1.64,0,0,0,0-3.27ZM4.82,8.37H4.5v1.94l.32,0A4.91,4.91,0,0,1,9.7,15.18c0,.11,0,.21,0,.32h1.94c0-.11,0-.21,0-.32A6.85,6.85,0,0,0,4.82,8.37Zm0-3.87-.32,0V6.45l.32,0a8.79,8.79,0,0,1,8.75,8.75c0,.11,0,.21,0,.32h1.93c0-.11,0-.21,0-.32A10.7,10.7,0,0,0,4.82,4.5Z" transform="translate(-4.5 -4.5)"/></svg>
                   {elseif $social_link.class=="pinterest"}
                       <svg id="Layer_1" data-name="Layer 1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 12 12"><path class="cls-1" d="M12.51,4.3a6.06,6.06,0,0,0-6,0A6.05,6.05,0,0,0,4.3,6.49a5.92,5.92,0,0,0-.8,3,5.85,5.85,0,0,0,1,3.31A6,6,0,0,0,7.09,15a5.06,5.06,0,0,1,.11-1.38L8,10.35a2.06,2.06,0,0,1-.2-.95,1.83,1.83,0,0,1,.34-1.11,1,1,0,0,1,.82-.45.74.74,0,0,1,.6.26,1,1,0,0,1,.21.65,2.42,2.42,0,0,1-.09.59c-.06.23-.14.5-.23.8s-.17.55-.21.74a.89.89,0,0,0,.18.81,1,1,0,0,0,.77.34,1.58,1.58,0,0,0,1.37-.93,4.52,4.52,0,0,0,.53-2.26,2.21,2.21,0,0,0-.66-1.66,2.51,2.51,0,0,0-1.84-.64A2.85,2.85,0,0,0,6.61,9.41,1.74,1.74,0,0,0,7,10.59a.34.34,0,0,1,.08.34L7,11.16,7,11.41a.19.19,0,0,1-.3.15,1.73,1.73,0,0,1-.91-.86,3.13,3.13,0,0,1-.31-1.43,3.48,3.48,0,0,1,.16-1,3.63,3.63,0,0,1,.53-1A3.83,3.83,0,0,1,8.2,5.74a5,5,0,0,1,1.53-.22,4,4,0,0,1,2,.49,3.53,3.53,0,0,1,1.35,1.27A3.21,3.21,0,0,1,13.53,9a5.26,5.26,0,0,1-.4,2.11A3.59,3.59,0,0,1,12,12.54a2.87,2.87,0,0,1-1.69.53,1.81,1.81,0,0,1-.89-.22,1.29,1.29,0,0,1-.57-.53Q8.47,13.7,8.41,14a5,5,0,0,1-.61,1.28,5.74,5.74,0,0,0,1.7.25,5.92,5.92,0,0,0,3-.8,6.05,6.05,0,0,0,2.19-2.19,6.06,6.06,0,0,0,0-6A6.05,6.05,0,0,0,12.51,4.3Z" transform="translate(-3.5 -3.5)"/></svg>
                   {elseif $social_link.class=="vimeo"}
                       <svg id="Layer_1" data-name="Layer 1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 13 11"><path class="cls-1" d="M14.6,4.5q-2.7-.09-3.66,3a2.29,2.29,0,0,1,1-.21c.66,0,.95.36.88,1.09a4.86,4.86,0,0,1-.88,1.92c-.54.84-1,1.26-1.22,1.26-.83,0-1.32-3.82-1.49-4.86-.23-1.45-.86-2.12-1.87-2S4.77,6.36,3.5,7.46l.61.77a3.93,3.93,0,0,1,1-.6c1,0,1.5,3.34,2.29,5.82C8,14.82,8.58,15.5,9.35,15.5q1.83,0,4.49-3.37c1.71-2.15,2.59-3.85,2.65-5.08h0c.08-1.66-.55-2.51-1.89-2.54Z" transform="translate(-3.5 -4.5)"/></svg>
                   {/if}
                </span>
                <span class="block-social-label">{$social_link.label}</span>
              </a>
        </li>
      {/foreach}
    </ul>
  </div>
{/block}
