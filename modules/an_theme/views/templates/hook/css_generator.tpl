{**
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
  *  @author    Apply Novation <applynovation@gmail.com>
  *  @copyright 2016-2017 Apply Novation
  *  @license   http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
  *}
  
  {* 
  default in theme Classic: 
  
  font-family: -apple-system, BlinkMacSystemFont, Segoe UI, Roboto, Helvetica Neue, Arial, sans-serif; 
  
  *}
  html {
    font-size: {$global_basicfontsize};
    font-weight: 400;
  }
  body {
    font-size: {$global_basicfontsize};
    line-height: {$global_BasicLineHeight};
    background: {$global_bodyBackground};
    {$global_themeFont}
  }
  .page-home .product-banner .banner-text-bl h2 {
    {$global_themeFontAN}
  }
  
  body,
  p {
    color: {$global_basicfontcolor};
  }
  
  p {
    font-size: {$global_pfontsize};
    line-height: {$global_pLineHeight};
  }
  
  .h1,
  .h2,
  .h3,
  .h4,
  h1,
  h2,
  h3,
  h4 {
    {$h1h6_themeFontH};
    font-weight: 300;
  }
  
  .h1,
  h1 {
    font-size: {$h1h6_h1FontSize};
    line-height: 36px;
  }
  .h2,
  h2 {
    font-size: {$h1h6_h2FontSize};
    line-height: 32px;
  }
  .h3,
  .h4,
  h3,
  h4 {
    font-size: {$h1h6_h3h4FontSize};
    line-height: 28px;
  }
  .h5,
  h5 {
    font-size: {$h1h6_h5FontSize};
    font-weight: 300;
    line-height: 24px;
  }
  .h6,
  h6 {
    font-size: {$h1h6_h6FontSize};
    font-weight: 300;
    line-height: 24px;
  }
  
  .h1,
  .h2,
  .h3 {
    color: {$h1h6_h1h5Color};
  }
  
  {* color: #2fb5d2; color: #208094;	*}
  a {
    color: {$global_link};
  }
  
  a:focus,
  a:hover,
  .btn-link:focus,
  .btn-link:hover,
  .page-link:focus,
  .page-link:hover,
  a.text-primary:focus,
  a.text-primary:hover {
    color: {$global_linkHover};
  }
  
  a.bg-primary:focus,
  a.bg-primary:hover {
    background-color: {$global_linkHover}!important
  }
  .btn-primary.focus,
  .btn-primary:focus,
  .btn-primary:hover {
      
  }
  .btn-primary.active,
  .btn-primary:active,
  .open>.btn-primary.dropdown-toggle {
      background-color: {$global_linkHover};
  }
  .tag-primary[href]:focus,
  .tag-primary[href]:hover {
      background-color: {$global_linkHover}
  }
  {*     Product     *}
  .hover_slider ul li::after{
      background: {$segmentedviewsettinds_linecolor};
  }
  .hover_slider:not(:hover) li:first-child::after,
  .hover_slider ul li:hover::after{
      background: {$segmentedviewsettinds_activelinecolor};
  }
  .hover_slider .more-images{
      color: {$segmentedviewsettinds_textcolorsh};
  }
  {if $product_productImageChange == 'hover-slider'}
    #products .thumbnail-container:hover .highlighted-informations, 
    .featured-products .thumbnail-container:hover .highlighted-informations, 
    .product-accessories .thumbnail-container:hover .highlighted-informations, 
    .product-miniature .thumbnail-container:hover .highlighted-informations {
        bottom: 6px;
    }
  {/if}
  
  {*Shopping cart*}
  .cart-preview .cart-title .h4{
    font-size: {$shoppingCart_fontsizegsc};
  }
  .cart-detailed-totals,
    .cart-preview .cart-title,
    .cart-preview .cart-bottom{
      background: {$shoppingCart_backgroundsc};
    }

   {*   Footer  *}

  .an_copyright a,
  .an_copyright p,
  .footer-container a,
  .block-contact{
    color: {$footer_footerlink};
  }
  .an_copyright a:hover p,
  .footer-container a:hover,
  .footer-container a:focus{
    color: {$footer_footerlinkHover};
  }
  .links .h3,
  #block_myaccount_infos .h3 a,
  .links .h4.block-contact-title,
  .links>h3 {
    color: {$footer_footertitels};
  }
  .block-contact>div{
    color: {$footer_footertextcolor};
  }
  .footer-container li a:before {
      border-bottom: 1px solid {$footer_footerlinkHover};
  }

  {*   Header Link color    *}

  .block-social li a svg path {
    fill: {$header_navlinkone};
  }
  .block-social li a:hover svg path {
    fill: {$header_navlinktwo};
  }
  .dropdown,
  .block-social li a,
  .language-selector-wrapper span {
    color: {$header_navlinkone};
  }
  .block-social li a:hover{
    color: {$header_navlinktwo};
  }
  .dropdown .expand-more,
  #header .header-nav .user-info a,
  .search-widget>i.search,
  #header .header-nav .cart-preview .shopping-cart,
  #header .header-nav .blockcart a{
    color: {$header_navlinktwo};
  }
  .dropdown:hover .expand-more,
  .dropdown:hover a i,
  #header .header-nav .user-info a:hover,
  .search-widget>i.search:hover,
  #header .header-nav .cart-preview .shopping-cart:hover,
  #header .header-nav .blockcart a:hover{
    color: {$header_navlinkone};
  }
  {***********************************

  Basic color

  ***********************************}
  .anthemeblocks-homeslider .owl-dots .owl-dot.active span,
  .anthemeblocks-homeslider .owl-dots .owl-dot:hover span {
    background: {$global_basicColor} !important;
  }
  .form-control:focus,
  .input-group.focus {
      outline: 1px solid {$global_basicColor};
  }

  .bootstrap-touchspin .group-span-filestyle .btn-touchspin,
  .group-span-filestyle .bootstrap-touchspin .btn-touchspin,
  .group-span-filestyle .btn-default {
    background:  {$global_basicColor};
  }

  .custom-radio input[type=radio]:checked+span {
    background-color: {$global_basicColor};
  }

  .search-widget form input[type=text]:focus {
    outline: 0;
  }

  body#checkout section.checkout-step .address-item.selected {
    border: 3px solid {$global_basicColor};
  }

  .products-sort-order .select-list:hover {
    background: {$global_basicColor};
  }
  .tabs .nav-tabs .nav-link.active,
  .tabs .nav-tabs .nav-link:hover {

  }
  #product-modal .modal-content .modal-body .product-images img:hover {
    border: 3px solid {$global_basicColor};
  }
  .product-images>li.thumb-container>.thumb.selected,
  .product-images>li.thumb-container>.thumb:hover {
    opacity: 1;
  }
  li.product-flag {
    background:  {$global_basicColor};
  }
  .dropdown-item:focus,
  .page-my-account #content .links a:hover i,
  .dropdown-item:hover,
  .search-widget form input[type=text]:focus+button .search,
  #header .top-menu a[data-depth="0"]:hover,
  .search-widget form button[type=submit] .search:hover,
  #products .highlighted-informations .quick-view:hover,
  .featured-products .highlighted-informations .quick-view:hover,
  .product-accessories .highlighted-informations .quick-view:hover,
  .product-miniature .highlighted-informations .quick-view:hover,
  .block-categories .collapse-icons .add:hover,
  .block-categories .collapse-icons .remove:hover,
  .block-categories .arrows .arrow-down:hover,
  .block-categories .arrows .arrow-right:hover,
  .cart-grid-body a.label:hover
  .product-price,
  #blockcart-modal .product-name,
  .tabs .nav-tabs .nav-link.active {
    color: {$global_basicColor};
  }
  #header .header-nav .language-selector:hover .language-selector .expand-more{
    color: #fff;
  }
  .block_newsletter {
    background: url(../img/{$newslet_backgroundImage}) no-repeat center;
    background-size: cover;
  }

  .block_newsletter form input[type=text]:focus {

  }
  .block_newsletter form input[type=text]:focus+button .search {
    color: {$global_basicColor};
  }
  .block_newsletter form button[type=submit] .search:hover {
    color: {$global_basicColor};
  }
  .block_newsletter form input[type=text]:focus {

  }
  .account-list a:hover {
    color: {$global_basicColor};
  }
  .social-sharing li:hover {
    background-color: {$global_basicColor};
  }
  @media (max-width: 767px) {
    #header .header-nav .user-info .logged {
      color: {$global_basicColor};
    }
  }
  .btn-primary {
    background-color: {$global_basicColor};
  }
  .btn-primary.disabled.focus,
  .btn-primary.disabled:focus,
  .btn-primary.disabled:hover,
  .btn-primary:disabled.focus,
  .btn-primary:disabled:focus,
  .btn-primary:disabled:hover {
      background-color: {$global_basicColor};
  }
  .btn-outline-primary {
      color: {$global_basicColor};
      border-color: {$global_basicColor};
  }
  .btn-outline-primary.active,
  .btn-outline-primary.focus,
  .btn-outline-primary:active,
  .btn-outline-primary:focus,
  .btn-outline-primary:hover,
  .open>.btn-outline-primary.dropdown-toggle {
      background-color: {$global_basicColor};
      border-color: {$global_basicColor};
  }
  .btn-link {
    color: {$global_basicColor};
  }
  .dropdown-item.active,
  .dropdown-item.active:focus,
  .dropdown-item.active:hover {
    background-color: {$global_basicColor};
  }
  .nav-pills .nav-item.open .nav-link,
  .nav-pills .nav-item.open .nav-link:focus,
  .nav-pills .nav-item.open .nav-link:hover,
  .nav-pills .nav-link.active,
  .nav-pills .nav-link.active:focus,
  .nav-pills .nav-link.active:hover {
    background-color: {$global_basicColor};
  }
  .card-primary {
    background-color: {$global_basicColor};
    border-color: {$global_basicColor};
  }
  .card-outline-primary {
    border-color: {$global_basicColor};
  }
  .page-item.active .page-link,
  .page-item.active .page-link:focus,
  .page-item.active .page-link:hover {
    background-color: {$global_basicColor};
    border-color: {$global_basicColor};
  }
  .tag-primary {
    background-color: {$global_basicColor};
  }
  .page-link {
    color: {$global_basicColor};
  }
  .bg-primary {
      background-color: {$global_basicColor}!important
  }
  .text-primary {
      color: {$global_basicColor}!important;
  }
  .anthemeshipping-line {
    background-color: {$header_freeShippingBackground};
  }
  .anthemeshipping-line p {
      color: {$header_freeShippingColor};
    }
  {***********************************

  Product

  ***********************************}
  #products .product-title a,
  .featured-products .product-title a,
  .product-accessories .product-title a,
  .product-miniature .product-title a,
  .product-name a {
    color: {$product_titleCatalogColor};
    font-size: {$product_titleCatalogFontSize};
  }

  .page-product h1 {
    font-size: {$product_titleFontSize};
  }

  #products .product-price-and-shipping,
  .featured-products .product-price-and-shipping,
  .product-accessories .product-price-and-shipping,
  .product-miniature .product-price-and-shipping,
  .product-price {
    color: {$product_priceColor};
    font-size: {$product_priceFontSize};
  }
  .current-price {
    color: {$product_priceColor};
  }
  .featured-products .regular-price,
  .product-accessories .regular-price,
  .product-miniature .regular-price,
  .regular-price {
   color: {$product_oldPriceColor};
   font-size: {$product_oldPriceFontSize};
  }
  #products .regular-price {
    color: {$product_oldPriceColor};
  }
  .product-discount {
   color: {$product_oldPriceColor};
  }

  {if $product_borderImageCatalog > 0}
  .thumbnail-container-image {
   {if $product_borderImageColorCatalog != ''}
   border: {$product_borderImageCatalog}px solid {$product_borderImageColorCatalog};
   {else}
   border: {$product_borderImageCatalog}px solid transparent;
   {/if}
  }
  {/if}


  {if $header_headerBackground != ''}
  #header {
    background: {$header_headerBackground};
  }
  {else}

  {/if}
  {if $header_navBackground != ''}
  .header-nav {
    background: {$header_navBackground};
  }
  {else}

  {/if}
  #header.header5 #_desktop_contact_link,
  #header.header5 .header-right,
  #header.header3 .left-nav,
  #header.header3 .header-nav .right-nav,
  .header-nav {
    font-size: {$header_fontSizeNav};
  }


  {if $header_logoMiddle == '1'}
  #_desktop_logo {
    text-align: center;
    padding-bottom: 10px;
  }
  {/if}
  {if $topmenu_background != ''}
  #_desktop_top_menu,
  #amegamenu {
    background: {$topmenu_background};
  }
  {else}

  {/if}
  #_desktop_top_menu,
  #amegamenu {
    font-size: {$topmenu_fontSize};
  }

  {if $topmenu_stickyMenu == '1'}
  /* fixed-menu */
  @media (min-width: 992px) {
    .fixed-menu {
      z-index: 9;
    background: rgba(0,0,0,0.4);
      padding-top: 0px!important;
      position: fixed !important;
      top: 0;
      left: 0;
    width: 100%;
    }
    #top-menu {
      margin-bottom: 0px !important;
    position: relative;
    }
  }
  {/if}

  {if $wrapper_background != ''}
  #wrapper {
    background: {$wrapper_background};
  }
  {else}

  {/if}
  {if $newslet_background != ''}
  .block_newsletter {
    background: {$newslet_background};
  }
  {else}

  {/if}
  {if $footer_footerBackground != ''}
  .footer-container {
    background: {$footer_footerBackground};
  }
  {else}

  {/if}
  {if $copyright_copyrightBackground != ''}
  .copyright-container {
    background: {$copyright_copyrightBackground};
  }
  {else}

  {/if}

  {* HOME SLIDER *}
  .anthemeblocks-homeslider-desc h2 {
    color: {$homeSlider_titleColor};
    font-size: {$homeSlider_TitleFontSize};
    {$homeSlider_sliderFont}
  }

  .anthemeblocks-homeslider-desc,
  .anthemeblocks-homeslider-desc p {
    color: {$homeSlider_descriptionColor};
    font-size: {$homeSlider_descriptionFontSize};
    line-height: normal;
  }

  {*






  *}

  {*	Page load progress bar	*}
  {if $pageLoadProgressBar_status == '1'}

  #nprogress {
    pointer-events: none;
  }

  #nprogress .bar {
    background: {$pageLoadProgressBar_color};

    position: fixed;
    z-index: 1031;
    top: 0;
    left: 0;

    width: 100%;
    height: 2px;
  }

  /* Fancy blur effect */
  #nprogress .peg {
    display: block;
    position: absolute;
    right: 0px;
    width: 100px;
    height: 100%;
    box-shadow: 0 0 10px {$pageLoadProgressBar_color}, 0 0 5px {$pageLoadProgressBar_color};
    opacity: 1.0;

    -webkit-transform: rotate(3deg) translate(0px, -4px);
        -ms-transform: rotate(3deg) translate(0px, -4px);
            transform: rotate(3deg) translate(0px, -4px);
  }

  /* Remove these to get rid of the spinner */
  #nprogress .spinner {
    display: block;
    position: fixed;
    z-index: 1031;
    top: 15px;
    right: 15px;
  }

  #nprogress .spinner-icon {
    width: 18px;
    height: 18px;
    box-sizing: border-box;

    border: solid 2px transparent;
    border-top-color: {$pageLoadProgressBar_color};
    border-left-color: {$pageLoadProgressBar_color};
    border-radius: 50%;

    -webkit-animation: nprogress-spinner 400ms linear infinite;
            animation: nprogress-spinner 400ms linear infinite;
  }

  .nprogress-custom-parent {
    overflow: hidden;
    position: relative;
  }

  .nprogress-custom-parent #nprogress .spinner,
  .nprogress-custom-parent #nprogress .bar {
    position: absolute;
  }

  @-webkit-keyframes nprogress-spinner {
    0%   { -webkit-transform: rotate(0deg); }
    100% { -webkit-transform: rotate(360deg); }
  }
  @keyframes nprogress-spinner {
    0%   { transform: rotate(0deg); }
    100% { transform: rotate(360deg); }
  }
  {/if}


  .ui-widget {
    font-family: inherit !important;
  }


  .an_productattributes-qty-add .btn-primary {
    background-color: {$btnAddToCart_backgroundAddtocart};
    border-color: {$btnAddToCart_borderColorAddtocart};
    color: {$btnAddToCart_colorAddtocart};
    border-radius: {$btnAddToCart_borderRadiusAddtocart};
  }

  .an_productattributes-qty-add .btn-primary:hover,
  .an_productattributes-qty-add .btn-primary:focus {
    background-color: {$btnAddToCart_backgroundHoverAddtocart};
    border-color: {$btnAddToCart_borderColorHoverAddtocart};
    color: {$btnAddToCart_colorHoverAddtocart};
  }

  {if $btnAddToCart_borderWidthAddtocart != '0px'}
    .an_productattributes-qty-add .btn-primary {
      border: {$btnAddToCart_borderWidthAddtocart} solid {$btnAddToCart_borderColorAddtocart}
    }
    .an_productattributes-qty-add .btn-primary:hover,
    .an_productattributes-qty-add .btn-primary:focus{
      border: {$btnAddToCart_borderWidthAddtocart} solid {$btnAddToCart_borderColorHoverAddtocart}
    }
  {else}
    .an_productattributes-qty-add .btn-primary {
      border: 0!important;
    }
  {/if}

  .btn-primary,
  .anthemeblocks-homeslider-desc .btn-primary {
    background-color: {$buttons_backgroundButton};
    color: {$buttons_colorButton};
    border-radius: {$buttons_ButtonBorderRadius};
  }
  {if $buttons_borderwidthButton != '0px'}
  .btn-primary{
    border: {$buttons_borderwidthButton} solid {$buttons_bordercolorButton}
  }
  .btn-primary:hover,
  .btn-primary:focus{
    border: {$buttons_borderwidthButton} solid {$buttons_colorHoverBorder}
  }
  {/if}
  .btn-primary.focus,
  .btn-primary:focus,
  .btn-primary:hover {
      background-color: {$buttons_backgroundHoverButton};
      color: {$buttons_colorButtonHover};
  }

  .btn-secondary {
    background-color: {$buttons_backgroundButton};
    color: {$buttons_colorButton};
  }
  .btn-secondary:hover {
    background-color: {$buttons_backgroundHoverButton};
    color: {$buttons_colorButtonHover};
  }

  header .clientservice_open-modal-btn {
      color: {$header_headerlink};
  }
  #header .clientservice_open-modal-btn:hover {
      color: {$header_headerlinkHover};
  }



  /* header2 */
  #header.header2 .topmenu-wrapper,
  #header.header2 #amegamenu {
      background: {$topmenu_background}!important;
  }

  #header.header2 .user-info .btn-unstyle:hover .expand-more,
  #header.header2 .amenu-item .amenu-link,
  #header.header2 .clientservice_open-modal-btn:hover,
  #header.header2 .topmenu-wrapper .btn-unstyle:hover,
  #header.header2 .topmenu-wrapper .lang_and_сr .expand-more,
  #header.header2 .topmenu-wrapper #_desktop_user_info a:not(.dropdown-item):hover {
      color: {$header_navlinktwo}!important;
  }
  #header.header2 .user-info .btn-unstyle .expand-more,
  #header.header2 .amenu-item .amenu-link:hover,
  #header.header2 .clientservice_open-modal-btn,
  #header.header2 .topmenu-wrapper .btn-unstyle,
  #header.header2 .topmenu-wrapper .lang_and_сr .dropdown:hover .expand-more,
  #header.header2 .topmenu-wrapper #_desktop_user_info a:not(.dropdown-item) {
      color: {$header_navlinkone}!important;
  }

  /* header6 */
    #header.header6 .user-info .btn-unstyle:hover .expand-more,
    #header.header6 .amenu-item .amenu-link,
    #header.header6 .clientservice_open-modal-btn:hover,
    #header.header6 .topmenu-wrapper .btn-unstyle:hover,
    #header.header6 .topmenu-wrapper .lang_and_сr .expand-more,
    #header.header6 .topmenu-wrapper #_desktop_user_info a:not(.dropdown-item):hover {
        color: {$header_navlinktwo}!important;
    }
    #header.header6 .user-info .btn-unstyle .expand-more,
    #header.header6 .amenu-item .amenu-link:hover,
    #header.header6 .clientservice_open-modal-btn,
    #header.header6 .topmenu-wrapper .btn-unstyle,
    #header.header6 .topmenu-wrapper .lang_and_сr .dropdown:hover .expand-more,
    #header.header6 .topmenu-wrapper #_desktop_user_info a:not(.dropdown-item) {
        color: {$header_navlinkone}!important;
    }
  
  #header.header3 .user-info .btn-unstyle .expand-more,
  #header.header3 .clientservice_open-modal-btn,
  #header.header3 .header-nav .blockcart a,
  #header.header3 #_desktop_an_wishlist-nav a > span,
  #header.header3 .header-nav .user-info a,
  #header.header3 .header-nav .dropdown:hover .expand-more,
  #header.header3 .header-nav a:hover,
  #header.header3 .dropdown:hover .expand-more,
  #header.header3 .lang_and_сr .dropdown .expand-more {
      color: {$header_navlinkone};
  }
  
  #header .dropdown-item:hover {
      color: {$global_linkHover}!important;
  }
  #header.header3 .user-info .btn-unstyle:hover .expand-more,
  #header.header3 .lang_and_сr .dropdown:hover .expand-more,
  #header.header3 .clientservice_open-modal-btn:hover,
  #header.header3 .header-nav .blockcart a:hover,
  #header.header3 #_desktop_an_wishlist-nav a:hover > span,
  #header.header3 .header-nav .user-info a:hover,
  .header3 .lang_and_сr .dropdown:hover .expand-more {
      color: {$header_navlinktwo};
  }
  #header.header3 .header-nav {
    background: {$header_headerBackground};
  }
  
  
  #header.header4 .user-info .btn-unstyle .expand-more,
  #header.header4 #_desktop_contact_link a,
  #header.header4 .clientservice_open-modal-btn,
  #header.header4 .header-nav .user-info a,
  #header.header4 .header-nav .dropdown:hover .expand-more,
  #header.header4 .header-nav a:hover,
  #header.header4 .dropdown:hover .expand-more,
  #header.header4 .lang_and_сr .dropdown .expand-more {
      color: {$header_navlinkone};
  }
  #header.header4 .user-info .btn-unstyle:hover .expand-more,
  #header.header4 #_desktop_contact_link a:hover,
  #header.header4 .lang_and_сr .dropdown:hover .expand-more,
  #header.header4 .clientservice_open-modal-btn:hover,
  #header.header4 .header-nav .user-info a:hover,
  #header.header4 .lang_and_сr .dropdown:hover .expand-more {
      color: {$header_navlinktwo};
  }
  
  #header.header5 #_desktop_contact_link a,
  #header.header5 .clientservice_open-modal-btn,
  #header.header5 .dropdown .expand-more {
       color: {$header_navlinkone};
  }
  #header.header5 #_desktop_contact_link a:hover,
  #header.header5 .clientservice_open-modal-btn:hover,
  #header.header5 .dropdown:hover .expand-more {
       color: {$global_linkHover};
  }
  #header.header5 .user-info > a,
  #header.header5 .dropdown:hover .expand-more,
  #header.header5 .header-top-wrapper a:not(.dropdown-item):hover,
  #header.header5 .blockcart-link,
  #header.header5 .amenu-item .amenu-link,
  #header.header5 #_desktop_an_wishlist-nav a,
  #header.header5 .topmenu-right .dropdown .expand-more {
      color: {$global_basicfontcolor}!important;
  }
  #header.header5 .user-info > a:hover,
  #header.header5 .blockcart-link:hover,
  #header.header5 .amenu-item .amenu-link:hover,
  #header.header5 #_desktop_an_wishlist-nav a:hover,
  #header.header5 .topmenu-right .dropdown:hover .expand-more {
      color: {$header_navlinkone}!important;
  }



  body#checkout .login-form-forgot a:hover,
  body#checkout .nav-item .nav-link.active {
      color: {$global_basicColor};
  }


  body#checkout .custom-radio input[type=radio]:checked+span,
  body#checkout section.checkout-step.-reachable.-complete h1 .done {
      background: {$global_link};
  }
  .custom-checkbox input[type=checkbox]:checked+span .checkbox-checked svg path,
  body#checkout .cart-summary-products a svg path {
      fill: {$global_link};
  }
  body#checkout .login-form-forgot a,
  body#checkout .nav-item .nav-link,
  body#checkout .card-block .checkout-summary-dropdown a,
  body#checkout section.checkout-step .add-address a
  body#checkout .cart-summary-products a,
  body#checkout section.checkout-step #conditions-to-approve a,
  body#checkout section.checkout-step.-current.-reachable .add-address-comment a,
  body#checkout section.checkout-step.-current.-reachable .add-address a,
  .custom-checkbox input[type=checkbox]:checked+span i,
  .form-link {
      color: {$global_link};
  }
body#checkout .custom-checkbox input[type=checkbox]:checked+span {
    border-color: {$global_link};
}
.mobile-cart-item-count {
    background-color: {$global_basicColor}!important;
}

.product-flags .online-only {
  background:  {$product_backgroundOnlineOnly};
  color: {$product_colorOnlineOnly}
}
.product-flags .on-sale {
  background:  {$product_backgroundOnSale};
  color: {$product_colorOnSale}
}
.product-flags .out_of_stock {
  background:  {$product_backgroundOutofstock};
  color: {$product_colorOutofstock}
}
.product-flags .new,
.product-flags .pack{
  background:  {$product_backgroundNew};
  color: {$product_colorNew}
}
.product-flags .discount-percentage,
.product-discount .discount.discount-percentage,
.modal-body .discount-percentage {
  background:  {$product_backgroundSale};
  color: {$product_colorSale}
}