<?php
/**
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
*/

$module = $this;

$fontSizes = array('10px', '11px', '12px', '13px', '14px', '15px', '16px', '17px', '18px', '19px', '20px', '21px', '22px', '23px', '24px', '25px', '26px', '27px', '28px', '29px', '30px', '31px', '32px', '33px', '34px', '35px', '36px', '37px', '38px', '39px', '40px', '41px', '42px', '43px', '44px', '45px', '46px', '47px', '48px', '49px', '50px', '51px', '52px', '53px', '54px', '55px', '56px', '57px', '58px', '59px', '60px',
);
$imagelimit = array('2', '3', '4', '5', '6', '7', '8');
$border_radius = array('0px', '1px', '2px', '3px', '4px', '5px', '6px', '7px', '8px', '9px','10px', '11px', '12px', '13px', '14px', '15px', '16px', '17px', '18px', '19px', '20px', '21px', '22px', '23px', '24px', '25px', '26px', '27px', '28px', '29px', '30px', '31px', '32px', '33px', '34px', '35px', '36px', '37px', '38px', '39px', '40px', '41px', '42px', '43px', '44px', '45px', '46px', '47px', '48px', '49px', '50px', '51px', '52px', '53px', '54px', '55px', '56px', '57px', '58px', '59px', '60px',
);
$border = array( '0px', '1px', '2px', '3px', '4px', '5px', '6px', '7px', '8px', '9px','10px' );
return array(
    array(
        'legend' => array(
            'title' => $module->l('Main', 'fields'),
            'class' => 'an_theme-global',
            'id' => 'an_themeglobal'
        ),

        'fields' => array(

            'global' => array(
                'title' => $module->l('Global', 'fields'),
                'options' => array(
                    
				/*
                    'animateWow' => array(
                        'title' => $module->l('animate.css', 'fields'),
                        'description' => '',
                        'source' => 'switch',
						'type' => 'fileAdd',
						'files' => array(
										array(
										    'type' => 'js',
											'position' => 'bottom',
											'path' => 'views/js/wow.min.js',
											'server' => 'local',
											'priority' => 200
										),
										array(
										    'type' => 'css',
											'priority' => 200,
											'path' => 'views/css/animate.min.css',
											'server' => 'local'
										),
									),
                    ),
					*/
					'typeHomepage' => array(
                        'title' => $module->l('Homepage type', 'fields'),
                        'description' => $module->l('Depending on the option selected some modules and content block can be replaced or disabled.', 'fields'),
                        'source' => 'exSelect',
                        'options' => array(
                            'homepage1' => array(
                                'name' => 'Homepage 1',
                                'unregisterAllHooks' => array(
                                    'ps_emailsubscription',
                                    'an_user_testimonials'
                                ),
                                'registerHook' => array(
                                    'an_user_testimonials' => array('displayReviewsBlock', 'fields'),
                                    'ps_emailsubscription' => array('displayEmailSubs', 'fields'),
                                ),
                                'toDisableTb' => array('5e982f60e13a1','5e982fed93bc5','5e983036e1b5f','5e9839e8d136e','5e983a7072af1','5e983aea204e2','5e983b5f6d557','5e983b8f509d3','5e9840c2becd1','5e9840566e2d2','5e98415347b24','5e9841c8277fb','5e9842e2ed5cd','5e9844f0a440e','5e98455498bed','603f4f927f083', '603f50a602a47','603f50fe6c48a','603f5264d34d2', 'fields'),
                                'toEnableTb' => array('596dcb4dc0a22','596e0fdeeefec','596e05a401301','596e15a47b236','596f2bbf8ca98','596f6fdb4272e','5970543a7a584', 'fields'),
                                'css' => array(
                                    array(
                                         'type' => 'css',
                                         'priority' => 200,
                                         'path' => 'views/css/homepage1.css',
                                         'server' => 'local'
                                    ),
                                ),
                            ),
                            'homepage2' => array(
                                'name' => 'Homepage 2',
                                'unregisterAllHooks' => array(
                                    'ps_emailsubscription',
                                    'an_user_testimonials',
                                ),
                                'toDisableTb' => array('596dcb4dc0a22','596e0fdeeefec','596e05a401301','596e15a47b236','596f2bbf8ca98','596f6fdb4272e','5970543a7a584','5e9839e8d136e','5e983a7072af1','5e983aea204e2','5e983b5f6d557','5e983b8f509d3','5e9840c2becd1','5e9840566e2d2','5e98415347b24','5e9841c8277fb','5e9842e2ed5cd','5e9844f0a440e','5e98455498bed','603f4f927f083', '603f50a602a47','603f50fe6c48a','603f5264d34d2', 'fields'),
                                'toEnableTb' => array('5e982f60e13a1','5e982fed93bc5','5e983036e1b5f', 'fields'),
                                'css' => array(
                                    array(
                                         'type' => 'css',
                                         'priority' => 200,
                                         'path' => 'views/css/homepage2.css',
                                         'server' => 'local'
                                    ),
                                ),
                            ),
                            'homepage3' => array(
                                'name' => 'Homepage 3',
                                'unregisterAllHooks' => array(
                                    'ps_emailsubscription',
                                    'an_user_testimonials',
                                ),
                                'registerHook' => array(
                                    'an_user_testimonials' => array('displayHome', 'fields'),
                                ),
                                'toDisableTb' => array('596dcb4dc0a22','596e0fdeeefec','596e05a401301','596e15a47b236','596f2bbf8ca98','596f6fdb4272e','5970543a7a584','5e982f60e13a1','5e982fed93bc5','5e983036e1b5f','5e9840c2becd1','5e9840566e2d2','5e98415347b24','5e9841c8277fb','5e9842e2ed5cd','5e9844f0a440e','5e98455498bed','603f4f927f083', '603f50a602a47','603f50fe6c48a','603f5264d34d2', 'fields'),
                                'toEnableTb' => array('5e9839e8d136e','5e983a7072af1','5e983b5f6d557','5e983b8f509d3', 'fields'),
                                'css' => array(
                                    array(
                                         'type' => 'css',
                                         'priority' => 200,
                                         'path' => 'views/css/homepage3.css',
                                         'server' => 'local'
                                    ),
                                ),
                            ),
                            'homepage4' => array(
                                'name' => 'Homepage 4',
                                'unregisterAllHooks' => array(
                                    'ps_emailsubscription',
                                    'an_user_testimonials',
                                ),
                                'toDisableTb' => array('596dcb4dc0a22','596e0fdeeefec','596e05a401301','596e15a47b236','596f2bbf8ca98','596f6fdb4272e','5970543a7a584','5e982f60e13a1','5e982fed93bc5','5e983036e1b5f','5e9839e8d136e','5e983a7072af1','5e983b5f6d557','5e983b8f509d3','5e9844f0a440e','5e98455498bed','603f4f927f083', '603f50a602a47','603f50fe6c48a','603f5264d34d2', 'fields'),
                                'toEnableTb' => array('5e9840c2becd1','5e9840566e2d2','5e98415347b24','5e9841c8277fb','5e9842e2ed5cd', 'fields'),
                                'css' => array(
                                    array(
                                         'type' => 'css',
                                         'priority' => 200,
                                         'path' => 'views/css/homepage4.css',
                                         'server' => 'local'
                                    ),
                                ),
                            ),
                            'homepage5' => array(
                                'name' => 'Homepage 5',
                                'unregisterAllHooks' => array(
                                    'ps_emailsubscription',
                                    'an_user_testimonials',
                                ),
                                'toDisableTb' => array('596dcb4dc0a22','596e0fdeeefec','596e05a401301','596e15a47b236','596f2bbf8ca98','596f6fdb4272e','5970543a7a584','5e982f60e13a1','5e982fed93bc5','5e983036e1b5f','5e9839e8d136e','5e983a7072af1','5e983b5f6d557','5e983b8f509d3','5e9840c2becd1','5e9840566e2d2','5e98415347b24','5e9841c8277fb','5e9842e2ed5cd','603f4f927f083', '603f50a602a47','603f50fe6c48a','603f5264d34d2', 'fields'),
                                'toEnableTb' => array('5e9844f0a440e','5e98455498bed', 'fields'),
                                'css' => array(
                                    array(
                                         'type' => 'css',
                                         'priority' => 200,
                                         'path' => 'views/css/homepage5.css',
                                         'server' => 'local'
                                    ),
                                ),
                            ),
                            'homepage6' => array(
                                'name' => 'Homepage 6',
                                'unregisterAllHooks' => array(
                                    'ps_emailsubscription',
                                    'an_brandslider',
                                    'an_user_testimonials',
                                ),
                                'registerHook' => array(
                                    'an_user_testimonials' => array('displayHome', 'fields'),
                                ),
                                'toDisableTb' => array('596dcb4dc0a22','596e0fdeeefec','596e05a401301','596e15a47b236','596f2bbf8ca98','596f6fdb4272e','5970543a7a584','5e982f60e13a1','5e982fed93bc5','5e983036e1b5f','5e9839e8d136e','5e983a7072af1','5e983b5f6d557','5e983b8f509d3','5e9840c2becd1','5e9840566e2d2','5e98415347b24','5e9841c8277fb','5e9842e2ed5cd','5e9844f0a440e','5e98455498bed', 'fields'),
                                'toEnableTb' => array('603f4f927f083', '603f50a602a47','603f50fe6c48a','603f5264d34d2', 'fields'),
                                'css' => array(
                                    array(
                                         'type' => 'css',
                                         'priority' => 200,
                                         'path' => 'views/css/homepage6.css',
                                         'server' => 'local'
                                    ),
                                ),
                            ),
                        ),
                        'default' => 'homepage1',
                    ),
                    'themeFont' => array(
                        'title' => $module->l('Font from theme', 'fields'),
						'description' => '',
                        'source' => 'select',
                        'default' => 'opensans',
                        'type' => 'font',
                    ),
                    'themeFontAN' => array(
                        'title' => $module->l('Font from ANThemeblock', 'fields'),
                        'description' => '',
                        'source' => 'select',
                        'default' => 'opensans',
                        'type' => 'font',
                    ),
                    'basicColor' => array(
                        'title' => $module->l('Basic Color', 'fields'),
                        'description' => '',
                        'source' => 'picker',
                        'default' => '#2fb5d2',
                    ),  
                    'bodyBackground' => array(
                        'title' => $module->l('body Background', 'fields'),
                        'description' => '',
                        'source' => 'picker',
                        'default' => '#ffffff',
                    ),   
                    'link' => array(
                        'title' => $module->l('Link', 'fields'),
                        'description' => '',
                        'source' => 'picker',
                        'default' => '#2fb5d2',
                    ),					
                    'linkHover' => array(
                        'title' => $module->l('Link hover', 'fields'),
                        'description' => '',
                        'source' => 'picker',
                        'default' => '#208094',
                    ),   
                    'basicfontcolor' => array(
                        'title' => $module->l('Basic font color', 'fields'),
                        'description' => '',
                        'source' => 'picker',
                        'default' => '#878787',
                    ),  
                    'basicfontsize' => array(
                        'title' => $module->l('Basic font size', 'fields'),
                        'description' => '',
                        'source' => 'select',
                        'options' => $fontSizes,
                        'default' => '16px',
                    ),
                    'BasicLineHeight' => array(
                        'title' => $module->l('Basic line height', 'fields'),
                        'description' => '',
                        'source' => 'select',
                        'options' => $fontSizes,
                        'default' => '16px',
                    ),
                    'pfontsize' => array(
                        'title' => $module->l('tag p font size', 'fields'),
                        'description' => '',
                        'source' => 'select',
                        'options' => $fontSizes,
                        'default' => '16px',
                    ),
                    'pLineHeight' => array(
                        'title' => $module->l('tag p line height', 'fields'),
                        'description' => '',
                        'source' => 'select',
                        'options' => $fontSizes,
                        'default' => '16px',
                    ),
                ),
            ),
           

			///////////////////////////////
            'h1h6' => array(
                'title' => $module->l('H1-H6', 'fields'),
                'options' => array(
                    'themeFontH' => array(
                        'title' => $module->l('Font H1-H4', 'fields'),
						'description' => '',
                        'source' => 'select',
                        'default' => 'opensans',
                        'type' => 'font',
                    ), 
                    'h1h5Color' => array(
                        'title' => $module->l('H1-H5 color', 'fields'),
                        'description' => '',
                        'source' => 'picker',
                        'default' => '#414141',
                    ),
                    'h1FontSize' => array(
                        'title' => $module->l('H1 font-size', 'fields'),
                        'description' => '',
                        'source' => 'select',
                        'options' => $fontSizes,
                        'default' => '22px',
                    ),
                    'h2FontSize' => array(
                        'title' => $module->l('H2 font-size', 'fields'),
                        'description' => '',
                        'source' => 'select',
                        'options' => $fontSizes,
                        'default' => '20px',
                    ),
                    'h3h4FontSize' => array(
                        'title' => $module->l('H3-H4 font-size', 'fields'),
                        'description' => '',
                        'source' => 'select',
                        'options' => $fontSizes,
                        'default' => '18px',
                    ),
                    'h5FontSize' => array(
                        'title' => $module->l('H5 font-size', 'fields'),
                        'description' => '',
                        'source' => 'select',
                        'options' => $fontSizes,
                        'default' => '14px',
                    ),
                    'h6FontSize' => array(
                        'title' => $module->l('H6 font-size', 'fields'),
                        'description' => '',
                        'source' => 'select',
                        'options' => $fontSizes,
                        'default' => '15px',
                    ),
                ),
            ),
        ),
    ),
    array(
        'legend' => array(
            'title' => $module->l('Header', 'fields'),
            'class' => 'an-theme-header',
            'id' => 'anthemeheader',
            'live' => true,
            'liveTitle' => 'Header test',
        ),
        
        

        'fields' => array(
            'header' => array(
                'title' => $module->l('Header Styles', 'fields'),
                'options' => array(
                    'typeHeader' => array(
                        'title' => $module->l('Header type', 'fields'),
                        'description' => '',
                        'source' => 'exSelect',
                        'options' => array(
                            'header1' => array(
                                'name' => 'Header 1',
                                'unregisterAllHooks' => array(
                                    'ps_languageselector',
                                    'ps_currencyselector',
                                    'an_wishlist',
                                    'ps_searchbar',
                                    'ps_customersignin',
                                    'ps_shoppingcart',
                                    'ps_contactinfo',
                                    'ps_socialfollow',
                                    'an_logo',
                                ),
                                'ignoreHooks' => array(
                                    'displayFooter',
                                    'displayFooterLogo',
                                    'displayProductListReviews',
                                    'displayProductListWishlist',
                                    'displayProductAdditionalInfo',
                                    'displayProductAdditionalInfo2',
                                    'displayCustomerAccount',
                                    'displayShoppingCartFooter',
                                    'displaySearch',
                                    'displayNotFound',
                                    'displayLogoAfter',
                                    'displayFixedMenuLeft',
                                ),
                                'registerHook' => array(
                                    'ps_languageselector' => array('displayNav1', 'fields'),
                                    'ps_currencyselector' => array('displayNav1', 'fields'),
                                    'ps_socialfollow' => array('displayNav3', 'fields'),
                                    'ps_customersignin' => array('displayNav2Left', 'fields'),
                                    'an_wishlist' => array('displayNav2', 'fields'),
                                    'ps_shoppingcart' => array('displayNav2', 'fields'),
                                    'an_logo' => array('displayTopMiddle', 'fields'),
                                    'ps_searchbar' => array('displayTop', 'fields'),

                                ),
                                'toDisableTb' => array(),
                                'toEnableTb' => array('5976e4fb7721b', 'fields'),
                                'css' => array(
                                    array(
                                         'type' => 'css',
                                         'priority' => 200,
                                         'path' => 'views/css/header1.css',
                                         'server' => 'local'
                                    ),
                                ),
                            ),
                            'header2' => array(
                                'name' => 'Header 2',
                                'unregisterAllHooks' => array(
                                    'ps_languageselector',
                                    'ps_currencyselector',
                                    'an_wishlist',
                                    'ps_searchbar',
                                    'ps_customersignin',
                                    'ps_shoppingcart',
                                    'ps_contactinfo',
                                    'ps_socialfollow',
                                    'an_logo',
                                ),
                                'ignoreHooks' => array(
                                    'displayFooter',
                                    'displayFooterLogo',
                                    'displayProductListReviews',
                                    'displayProductListWishlist',
                                    'displayProductAdditionalInfo',
                                    'displayProductAdditionalInfo2',
                                    'displayCustomerAccount',
                                    'displayShoppingCartFooter',
                                    'displaySearch',
                                    'displayNotFound',
                                    'displayLogoAfter',
                                    'displayFixedMenuLeft',
                                ),
                                'registerHook' => array(
                                    'ps_searchbar' => array('displayTopMiddle', 'fields'),
                                    'an_wishlist' => array('displayTopRight', 'fields'),
                                    'ps_shoppingcart' => array('displayTopRight', 'fields'),
                                    'ps_languageselector' => array('displayTopMenuRight', 'fields'),
                                    'ps_currencyselector' => array('displayTopMenuRight', 'fields'),
                                    'ps_customersignin' => array('displayTopMenuRight2', 'fields'),
                                    'ps_customersignin' => array('displayTopMenuRight2', 'fields'),
                                    'an_logo' => array('displayTopLeft', 'fields'),
                                ),
                                'toDisableTb' => array('5976e4fb7721b', 'fields'),
                                'toEnableTb' => array(),
                                'css' => array(
                                    array(
                                         'type' => 'css',
                                         'priority' => 200,
                                         'path' => 'views/css/header2.css',
                                         'server' => 'local'
                                    ),
                                ),
                            ),
                            'header3' => array(
                                'name' => 'Header 3',
                                'unregisterAllHooks' => array(
                                    'ps_languageselector',
                                    'ps_currencyselector',
                                    'an_wishlist',
                                    'ps_searchbar',
                                    'ps_customersignin',
                                    'ps_shoppingcart',
                                    'ps_contactinfo',
                                    'ps_socialfollow',
                                    'an_logo',
                                ),
                                'ignoreHooks' => array(
                                    'displayFooter',
                                    'displayFooterLogo',
                                    'displayProductListReviews',
                                    'displayProductListWishlist',
                                    'displayProductAdditionalInfo',
                                    'displayProductAdditionalInfo2',
                                    'displayCustomerAccount',
                                    'displayShoppingCartFooter',
                                    'displaySearch',
                                    'displayNotFound',
                                    'displayLogoAfter',
                                    'displayFixedMenuLeft',
                                ),
                                'registerHook' => array(
                                    'ps_languageselector' => array('displayNav1', 'fields'),
                                    'ps_currencyselector' => array('displayNav1', 'fields'),
                                    'ps_customersignin' => array('displayNav2', 'fields'),
                                    'an_wishlist' => array('displayNav2', 'fields'),
                                    'ps_shoppingcart' => array('displayNav2', 'fields'),
                                    'ps_searchbar' => array('displayTopRight', 'fields'),
                                    'an_logo' => array('displayTopLeft', 'fields'),

                                ),
                                'toDisableTb' => array('5976e4fb7721b', 'fields'),
                                'toEnableTb' => array(),
                                'css' => array(
                                    array(
                                         'type' => 'css',
                                         'priority' => 200,
                                         'path' => 'views/css/header3.css',
                                         'server' => 'local'
                                    ),
                                ),
                            ),
                            'header4' => array(
                                'name' => 'Header 4',
                                'unregisterAllHooks' => array(
                                    'ps_languageselector',
                                    'ps_currencyselector',
                                    'an_wishlist',
                                    'ps_searchbar',
                                    'ps_customersignin',
                                    'ps_shoppingcart',
                                    'ps_contactinfo',
                                    'ps_socialfollow',
                                    'an_logo',
                                ),
                                'ignoreHooks' => array(
                                    'displayFooter',
                                    'displayFooterLogo',
                                    'displayProductListReviews',
                                    'displayProductListWishlist',
                                    'displayProductAdditionalInfo',
                                    'displayProductAdditionalInfo2',
                                    'displayCustomerAccount',
                                    'displayShoppingCartFooter',
                                    'displaySearch',
                                    'displayNotFound',
                                    'displayLogoAfter',
                                    'displayFixedMenuLeft',
                                ),
                                'registerHook' => array(
                                    'ps_contactinfo' => array('displayNav1', 'fields'),
                                    'ps_languageselector' => array('displayNav2', 'fields'),
                                    'ps_currencyselector' => array('displayNav2', 'fields'),
                                    'ps_customersignin' => array('displayNav2', 'fields'),
                                    'an_wishlist' => array('displayTopRight', 'fields'),
                                    'ps_searchbar' => array('displayMenuRight', 'fields'),
                                    'ps_shoppingcart' => array('displayTopRight', 'fields'),
                                    'an_logo' => array('displayTopLeft', 'fields'),
                                ),
                                'toDisableTb' => array('5976e4fb7721b', 'fields'),
                                'toEnableTb' => array(),
                                'css' => array(
                                    array(
                                         'type' => 'css',
                                         'priority' => 200,
                                         'path' => 'views/css/header4.css',
                                         'server' => 'local'
                                    ),
                                ),
                            ),
                            'header5' => array(
                                'name' => 'Header 5',
                                'unregisterAllHooks' => array(
                                    'ps_languageselector',
                                    'ps_currencyselector',
                                    'an_wishlist',
                                    'ps_searchbar',
                                    'ps_customersignin',
                                    'ps_shoppingcart',
                                    'ps_contactinfo',
                                    'ps_socialfollow',
                                    'an_logo',
                                ),
                                'ignoreHooks' => array(
                                    'displayFooter',
                                    'displayFooterLogo',
                                    'displayProductListReviews',
                                    'displayProductListWishlist',
                                    'displayProductAdditionalInfo',
                                    'displayProductAdditionalInfo2',
                                    'displayCustomerAccount',
                                    'displayShoppingCartFooter',
                                    'displaySearch',
                                    'displayNotFound',
                                    'displayLogoAfter',
                                    'displayFixedMenuLeft',
                                ),
                                'registerHook' => array(
                                    'ps_contactinfo' => array('displayNav1', 'fields'),
                                    'ps_languageselector' => array('displayTopRight2', 'fields'),
                                    'ps_currencyselector' => array('displayTopRight2', 'fields'),
                                    'ps_customersignin' => array('displayTopMenuRight', 'fields'),
                                    'an_wishlist' => array('displayTopMenuRight', 'fields'),
                                    'ps_shoppingcart' => array('displayTopMenuRight', 'fields'),
                                    'ps_searchbar' => array('displayMenuRight', 'fields'),
                                    'an_logo' => array('displayTopLeft', 'fields'),
                                ),
                                'toDisableTb' => array('5976e4fb7721b', 'fields'),
                                'toEnableTb' => array(),
                                'css' => array(
                                    array(
                                         'type' => 'css',
                                         'priority' => 200,
                                         'path' => 'views/css/header5.css',
                                         'server' => 'local'
                                    ),
                                ),
                            ),
                            'header6' => array(
                                'name' => 'Header 6',
                                'unregisterAllHooks' => array(
                                    'ps_languageselector',
                                    'ps_currencyselector',
                                    'an_wishlist',
                                    'ps_searchbar',
                                    'ps_customersignin',
                                    'ps_shoppingcart',
                                    'ps_contactinfo',
                                    'ps_socialfollow',
                                    'an_logo',
                                ),
                                'ignoreHooks' => array(
                                    'displayFooter',
                                    'displayFooterLogo',
                                    'displayProductListReviews',
                                    'displayProductListWishlist',
                                    'displayProductAdditionalInfo',
                                    'displayProductAdditionalInfo2',
                                    'displayCustomerAccount',
                                    'displayShoppingCartFooter',
                                    'displaySearch',
                                    'displayNotFound',
                                    'displayLogoAfter',
                                    'displayFixedMenuLeft',
                                ),
                                'registerHook' => array(
                                    'ps_contactinfo' => array('displayNav3', 'fields'),
                                    'ps_searchbar' => array('displayTopMiddle', 'fields'),
                                    'ps_shoppingcart' => array('displayTopRight', 'fields'),
                                    'ps_languageselector' => array('displayTopMenuRight', 'fields'),
                                    'ps_customersignin' => array('displayTopMenuRight2', 'fields'),
                                    'an_logo' => array('displayTopLeft', 'fields'),
                                ),
                                'toDisableTb' => array('5976e4fb7721b', 'fields'),
                                'toEnableTb' => array(),
                                'css' => array(
                                    array(
                                         'type' => 'css',
                                         'priority' => 200,
                                         'path' => 'views/css/header6.css',
                                         'server' => 'local'
                                    ),
                                ),
                            ),
                        ),
                        'default' => 'header1',
                    ),
                    'navBackground' => array(
                        'title' => $module->l('Background Nav', 'fields'),
                        'description' => '',
                        'source' => 'picker',
                        'default' => '#ebebeb',
						'allow_empty' => true,
                    ),
                    'fontSizeNav' => array(
                        'title' => $module->l('Font Size Nav', 'fields'),
                        'description' => '',
                        'source' => 'select',
                        'options' => $fontSizes,
                        'default' => '16px',
                    ),
                    'navlinkone' => array(
                        'title' => $module->l('Nav Links Color one', 'fields'),
                        'description' => '',
                        'source' => 'picker',
                        'default' => '#2fb5d2',
                    ),
                    'navlinktwo' => array(
                        'title' => $module->l('Nav Links Color two', 'fields'),
                        'description' => '',
                        'source' => 'picker',
                        'default' => '#2fb5d2',
                    ),
                    'headerBackground' => array(
                        'title' => $module->l('Background Header', 'fields'),
                        'description' => '',
                        'source' => 'picker',
                        'default' => '#ffffff',
						'allow_empty' => true,
                    ),      
                    'logoMiddle' => array(
                        'title' => $module->l('Logo in the middle', 'fields'),
                        'description' => '',
                        'source' => 'switch',
                    ),
                    'freeShippingBackground' => array(
                        'title' => $module->l('Background Free Shipping', 'fields'),
                        'description' => '',
                        'source' => 'picker',
                        'default' => '#000000',
                        'allow_empty' => true,
                    ),
                    'freeShippingColor' => array(
                        'title' => $module->l('Color Free Shipping', 'fields'),
                        'description' => '',
                        'source' => 'picker',
                        'default' => '#ffffff',
                        'allow_empty' => true,
                    ),
                )
            ),
            'topmenu' => array(
                'title' => $module->l('Top horizontal menu', 'fields'),
                'options' => array(
                    'background' => array(
                        'title' => $module->l('Background', 'fields'),
                        'description' => '',
                        'source' => 'picker',
                        'default' => '#ffffff',
						'allow_empty' => true,
                    ),
                    'fontSize' => array(
                        'title' => $module->l('Font Size', 'fields'),
                        'description' => '',
                        'source' => 'select',
                        'options' => $fontSizes,
                        'default' => '16px',
                    ),
                    'stickyMenu' => array(
                        'title' => $module->l('Sticky Menu', 'fields'),
                        'description' => '',
                        'source' => 'switch',
						'type' => 'fileAdd',
						'files' => array(
										array(
											'position' => 'bottom',
											'path' => 'views/js/stickymenu.js',
											'server' => 'local',
											'priority' => 200
										),
									),
                    ),
                    'stickyMenuMobile' => array(
                        'title' => $module->l('Sticky Menu Mobile', 'fields'),
                        'description' => '',
                        'source' => 'switch',
                        'default' => '1',
                        'type' => 'fileAdd',
                        'files' => array(
                            array(
                                'type' => 'js',
                                'position' => 'bottom',
                                'path' => 'views/js/stickymenumobile.js',
                                'server' => 'local',
                                'priority' => 200
                                ),
                            array(
                                'type' => 'css',
                                'priority' => 200,
                                'path' => 'views/css/stickymenumobile.css',
                                'server' => 'local'
                                ),
                        ),
                    ),
                    'mobileLinks' => array(
                        'title' => $module->l('Titles as links on mobile', 'fields'),
                        'description' => '',
                        'source' => 'switch',
                        'default' => '0',
                    ),
                )
            ),  
        ),
    ),
    /**
     * 
     */
    array(
        'legend' => array(
            'title' => $module->l('Wrapper', 'fields'),
            'class' => 'an_theme-wrapper',
            'id' => 'an_themecontainer',
            'live' => true,
            'liveTitle' => 'wrapper test',
        ),

        'fields' => array(
            'wrapper' => array(
                'title' => $module->l('Main', 'fields'),
                 'options' => array(
                    'background' => array(
                        'title' => $module->l('Background', 'fields'),
                        'description' => '',
                        'source' => 'picker',
                        'default' => '#ebebeb',
						'allow_empty' => true,
                    ),
                ), 
            ),
            
            'newslet' => array(
                'title' => $module->l('Newsletter', 'fields'),
                'options' => array(
                    'backgroundImage' => array(
                        'title' => $module->l('Newsletter background', 'fields'),
                        'description' => '',
                        'source' => 'image',
                        'default' => '#3e3e3e',
                       /*  'allow_delete' => true */
                    ),
                )
            ), 
            
        ),
    ),  
    
    
    

    
    
    
    array(
        'legend' => array(
            'title' => $module->l('Footer', 'fields'),
            'class' => 'an_theme-footer',
            'id' => 'anthemefooter'
        ),

        'fields' => array(
            'footer' => array(
                'title' => $module->l('Footer', 'fields'),
                'options' => array(
                    'footerBackground' => array(
                        'title' => $module->l('Footer Background', 'fields'),
                        'description' => '',
                        'source' => 'picker',
                        'default' => '#ffffff',
						'allow_empty' => true,
                    ),
                    'footertitels' => array(
                        'title' => $module->l('Footer Titels Color', 'fields'),
                        'description' => '',
                        'source' => 'picker',
                        'default' => '#000000',
                    ),
                     'footerlink' => array(
                         'title' => $module->l('Footer Link Color', 'fields'),
                         'description' => '',
                         'source' => 'picker',
                         'default' => '#929292',
                    ), 
                     'footerlinkHover' => array(
                         'title' => $module->l( 'Footer Link Hover Color', 'fields'),
                         'description' => '',
                         'source' => 'picker',
                         'default' => '#000000',
                    ),
                    'footertextcolor' => array(
                         'title' => $module->l( 'Footer text Color', 'fields'),
                         'description' => '',
                         'source' => 'picker',
                         'default' => '#929292',
                    ),
                ),
            ),
            'copyright' => array(
                'title' => $module->l('Copyright', 'fields'),
                'options' => array(
                    'copyrightBackground' => array(
                        'title' => $module->l('Copyright Background', 'fields'),
                        'description' => '',
                        'source' => 'picker',
                        'default' => '#ffffff',
						'allow_empty' => true,
                    ),
                    'showcopyright' => array(
                         'title' => $module->l('Show copyright', 'fields'),
                         'description' => '',
                         'source' => 'switch',
                         'default' => '1',
                    ),
                ),
            ),
        ),
    ),  
    
    array(
        'legend' => array(
            'title' => $module->l('Product', 'fields'),
            'class' => 'an_theme-product',
            'id' => 'anthemeproduct'
        ),
        'fields' => array(
            'product' => array(
                'title' => $module->l('Product', 'fields'),
                 'options' => array(
                    'lazyLoad' => array(
                        'title' => $module->l('Lazy Load', 'fields'),
                        'description' => '',
                        'source' => 'switch',
                        'type' => 'fileAdd',
                        'files' => array(
                            array(
                                'type' => 'js',
                                'priority' => 200,
                                'path' => 'views/js/lazyload.js',
                                'server' => 'local'
                            ),
                        ),
                    ),
                    'productMobileRow' => array(
                        'title' => $module->l('Display 2 products in a row on mobile', 'fields'),
                        'description' => '',
                        'source' => 'switch',
                        'default' => '1',
                    ),
                    'productHeight' => array(
                        'title' => $module->l('Unify products height in row', 'fields'),
                        'description' => '',
                        'source' => 'switch',
                        'default' => '0',
                    ),
                    'productImageChange' => array(
                        'title' => $module->l('Catalog product image view type', 'fields'),
                        'description' => '',
                        'source' => 'select',
                        'options' => array(
                            'standart' => 'standart',
                            'hover' => 'hover',
                            'slider' => 'slider',
                            'hover-slider' => 'segmented view',
                        ),
                        'default' => '',
                        'type' => 'selectFileAdd',
                        'files' => array(
                            'hover' => array(
                                array(
                                    'type' => 'css',
                                    'priority' => 200,
                                    'path' => 'views/css/hoveronproducts.css',
                                    'server' => 'local'
                                   ),
                            ),
                            'slider' => array(
                                array(
                                    'type' => 'js',
                                    'position' => 'bottom',
                                    'path' => 'views/js/slideronproducts.js',
                                    'server' => 'local',
                                    'priority' => 200
                                    ),
                                array(
                                    'type' => 'css',
                                    'priority' => 200,
                                    'path' => 'views/css/slideronproducts.css',
                                    'server' => 'local'
                                   ),
                            ),
                        ),
                    ),
                    'titleCatalogColor' => array(
                        'title' => $module->l('Product title in catalog color', 'fields'),
                        'description' => '',
                        'source' => 'picker',
                        'default' => '#acaaa6',
                    ),
                    'titleCatalogFontSize' => array(
                        'title' => $module->l('Product title in catalog font-size', 'fields'),
                        'description' => '',
                        'source' => 'select',
                        'options' => $fontSizes,
                        'default' => '16px',
                    ),
                    'titleFontSize' => array(
                        'title' => $module->l('Product Title in product page font-size', 'fields'),
                        'description' => '',
                        'source' => 'select',
                        'options' => $fontSizes,
                        'default' => '20px',
                    ),
                    'productColorType' => array(
                        'title' => $module->l('Type color in product page', 'fields'),
                        'description' => '',
                        'source' => 'select',
                        'options' => array(
                            'standart' => 'standart',
                            'images' => 'images',
                        ),
                        'default' => '',
                    ),
                    //////
                    'priceColor' => array(
                        'title' => $module->l('Price color', 'fields'),
                        'description' => '',
                        'source' => 'picker',
                        'default' => '#414141',
                    ),
                    'priceFontSize' => array(
                        'title' => $module->l('Price in catalog font-size', 'fields'),
                        'description' => '',
                        'source' => 'select',
                        'options' => $fontSizes,
                        'default' => '20px',
                    ),
                    'oldPriceColor' => array(
                        'title' => $module->l('Non-discount price color', 'fields'),
                        'description' => '',
                        'source' => 'picker',
                        'default' => '#acaaa6',
                    ),
                    'oldPriceFontSize' => array(
                        'title' => $module->l('Non-discount in catalog font-size', 'fields'),
                        'description' => '',
                        'source' => 'select',
                        'options' => $fontSizes,
                        'default' => '20px',
                    ),
                     'borderImageCatalog' => array(
                        'title' => $module->l('Size of image border in catalog', 'fields'),
                        'description' => '',
                        'source' => 'number',
                        'min' => 0,
                        'max' => 30,
                        'default' => '0',
                        'allow_empty' => true
                    ),
                    'borderImageColorCatalog' => array(
                        'title' => $module->l('Color of image border in catalog', 'fields'),
                        'description' => '',
                        'source' => 'picker',
                        'allow_empty' => true
                    ),
                    'backgroundOnlineOnly' => array(
                        'title' => $module->l('Background Label Online Only', 'fields'),
                        'description' => '',
                        'source' => 'picker',
                        'allow_empty' => true,
                        'default' => '#2fb5d2'
                    ),
                    'colorOnlineOnly' => array(
                        'title' => $module->l('Color Online Only', 'fields'),
                        'description' => '',
                        'source' => 'picker',
                        'allow_empty' => true,
                        'default' => '#ffffff'
                    ),
                    'backgroundOnSale' => array(
                        'title' => $module->l('Background Label On Sale', 'fields'),
                        'description' => '',
                        'source' => 'picker',
                        'allow_empty' => true,
                        'default' => '#2fb5d2'
                    ),
                    'colorOnSale' => array(
                        'title' => $module->l('Color On Sale', 'fields'),
                        'description' => '',
                        'source' => 'picker',
                        'allow_empty' => true,
                        'default' => '#ffffff'
                    ),
                    'backgroundNew' => array(
                        'title' => $module->l('Background Label New', 'fields'),
                        'description' => '',
                        'source' => 'picker',
                        'allow_empty' => true,
                        'default' => '#2fb5d2'
                    ),
                    'colorNew' => array(
                        'title' => $module->l('Color New', 'fields'),
                        'description' => '',
                        'source' => 'picker',
                        'allow_empty' => true,
                        'default' => '#ffffff'
                    ),
                    'backgroundSale' => array(
                        'title' => $module->l('Background Label Discount Percentage', 'fields'),
                        'description' => '',
                        'source' => 'picker',
                        'allow_empty' => true,
                        'default' => '#2fb5d2'
                    ),
                    'colorSale' => array(
                        'title' => $module->l('Color Discount Percentage', 'fields'),
                        'description' => '',
                        'source' => 'picker',
                        'allow_empty' => true,
                        'default' => '#ffffff'
                    ),
                    'backgroundOutofstock' => array(
                        'title' => $module->l('Background Label Out of Stock', 'fields'),
                        'description' => '',
                        'source' => 'picker',
                        'allow_empty' => true,
                        'default' => '#2fb5d2'
                    ),
                    'colorOutofstock' => array(
                        'title' => $module->l('Color Out of Stock', 'fields'),
                        'description' => '',
                        'source' => 'picker',
                        'allow_empty' => true,
                        'default' => '#ffffff'
                    ),
                    'showquickview' => array(
                        'title' => $module->l('Quick view', 'fields'),
                        'description' => '',
                        'source' => 'switch',
                        'default' => '1',
                    ),
                    'miniatureTitleLength' => array(
                       'title' => $module->l('Thumbnail product title max length', 'fields'),
                       'description' => '',
                       'source' => 'number',
                       'min' => 10,
                       'max' => 350,
                       'default' => '65',
                       'allow_empty' => false
                    ),
                    'shortdescription' => array(
                        'title' => $module->l('Thumbnail product short description', 'fields'),
                        'description' => '',
                        'source' => 'switch',
                        'default' => '0',
                    ),
                    'shortdescriptionlength' => array(
                       'title' => $module->l('Thumbnail product short description max length', 'fields'),
                       'description' => '',
                       'source' => 'number',
                       'min' => 10,
                       'max' => 350,
                       'default' => '65',
                       'allow_empty' => false
                    ),
                    ///
                ),
            ),
            'productslider' => array(
                'title' => $module->l('Product Page Slider', 'fields'),
                'options' => array(
                    'minisPos' => array(
                        'title' => $module->l('Miniatures position', 'fields'),
                        'description' => '',
                        'source' => 'select',
                        'options' => array(
                            'left' => 'Left Side',
                            'right' => 'Right Side',
                            'bottom' => 'Bottom Side',
                            'bottomlist' => 'Bottom Side (Thumbs List)',
                            'none' => 'None',
                        ),
                        'default' => 'bottom',
                    ),
                    'zoomclick' => array(
                        'title' => $module->l('Zoom image on click', 'fields'),
                        'description' => '',
                        'source' => 'switch',
                        'type' => 'fileAdd',
                        'files' => array(
                            array(
                                'type' => 'js',
                                'position' => 'bottom',
                                'path' => 'views/js/productzoomclick.js',
                                'server' => 'local',
                                'priority' => 200
                            ),
                            array(
                                'type' => 'css',
                                'priority' => 200,
                                'path' => 'views/css/productzoomclick.css',
                                'server' => 'local'
                            ),
                        ),
                    ),
                    'zoomhover' => array(
                        'title' => $module->l('Zoom image on hover', 'fields'),
                        'description' => '',
                        'source' => 'switch',
                        'type' => 'fileAdd',
                        'files' => array(
                            array(
                                'type' => 'js',
                                'position' => 'bottom',
                                'path' => 'views/js/productzoomhover.js',
                                'server' => 'local',
                                'priority' => 200
                            ),
                        ),
                    ),
                    'stickyProduct' => array(
                        'title' => $module->l('Sticky Product Image', 'fields'),
                        'description' => '',
                        'source' => 'switch',
                        'default' => '1',
                        'type' => 'fileAdd',
                        'files' => array(
                            array(
                                'type' => 'js',
                                'position' => 'bottom',
                                'path' => 'views/js/stickyproduct.js',
                                'server' => 'local',
                                'priority' => 200
                                ),
                            array(
                                'type' => 'css',
                                'priority' => 200,
                                'path' => 'views/css/stickyproduct.css',
                                'server' => 'local'
                                ),
                        ),
                    ),
                ),
            ),
            'productinfo' => array(
                'title' => $module->l('Product Info', 'fields'),
                'options' => array(
                    'detailstab' => array(
                        'title' => $module->l('Show Product Details Tab', 'fields'),
                        'description' => '',
                        'source' => 'switch',
                        'default' => '1',
                    ),
                    'reference' => array(
                        'title' => $module->l('Reference', 'fields'),
                        'description' => '',
                        'source' => 'switch',
                        'default' => '1',
                    ),
                    'ean13' => array(
                        'title' => $module->l('EAN13', 'fields'),
                        'description' => '',
                        'source' => 'switch',
                        'default' => '1',
                    ),
                    'brand' => array(
                        'title' => $module->l('Brand', 'fields'),
                        'description' => '',
                        'source' => 'select',
                        'options' => array(
                            'hide' => 'Hide brand',
                            'title' => 'Show Title',
                            'image' => 'Show Image',
                        ),
                        'default' => 'image',
                    ),
                ),
            ),
            'segmentedviewsettinds' => array(
                'title' => $module->l('Segmented view settings', 'fields'),
                'options' => array(
                    'imagelimit' => array(
                        'title' => $module->l('Image limit', 'fields'),
                        'description' => '',
                        'source' => 'select',
                        'options' => $imagelimit,
                        'default' => '5',
                    ),
                    'linecolor' => array(
                        'title' => $module->l('Lines color', 'fields'),
                        'description' => '',
                        'source' => 'picker',
                        'allow_empty' => true,
                        'default' => '#e8e8e8'
                    ),
                    'activelinecolor' => array(
                        'title' => $module->l('Active line color', 'fields'),
                        'description' => '',
                        'source' => 'picker',
                        'allow_empty' => true,
                        'default' => '#000000'
                    ),
                    'textcolorsh' => array(
                        'title' => $module->l('Text color', 'fields'),
                        'description' => '',
                        'source' => 'picker',
                        'allow_empty' => true,
                        'default' => '#000000'
                    ),
                    'textonlastimg' => array(
                        'title' => $module->l('More images', 'fields'),
                        'description' => '',
                        'source' => 'switch',
                        'default' => '1',
                    ),
                ),
            ),
        ),
    ),

    array(
        'legend' => array(
            'title' => $module->l('Category Page', 'fields'),
            'class' => 'an_theme-categorypage',
            'id' => 'anthemecategorypage'
        ),

        'fields' => array(
            'categoryPage' => array(
                'title' => $module->l('Category Page', 'fields'),
                'options' => array(
                    'productsAmount' => array(
                        'title' => $module->l('Quantity of products in a row', 'fields'),
                        'description' => '',
                        'source' => 'select',
                        'options' => array(
                            'col-xs-12' => '1 product',
                            'col-xs-6' => '2 products',
                            'col-xs-4' => '3 products',
                            'col-xs-3' => '4 products',
                        ),
                        'default' => 'col-xs-4',
                    ),
                    'showCategoryDescription' => array(
                        'title' => $module->l('Show Category Description on mobile', 'fields'),
                        'description' => '',
                        'source' => 'switch',
                    ),
                    'facetedsearch' => array(
                        'title' => $module->l('Faceted search type of view', 'fields'),
                        'description' => '',
                        'source' => 'select',
                        'options' => array(
                            'standard' => 'Expanded and unavailable to collapse (default)',
                            'turnon' => 'Expanded and available to collapse',
                            'turnoff' => 'Collapsed and available to expand',
                        ),
                        'default' => 'standard',
                    ),
                ),
            ),
        ),
    ), 

	array(
        'legend' => array(
            'title' => $module->l('Shopping cart', 'fields'),
            'class' => 'an_theme-shoping-cart',
            'id' => 'anthemeshoppingcart'
        ),

        'fields' => array(
           'shoppingCart' => array(
               'title' => $module->l('Shopping Cart', 'fields'),
               'options' => array(
                 'sidebarCart' => array(
                   'title' => $module->l('Sidebar Mini Cart', 'fields'),
                   'description' => '',
                   'source' => 'switch',
                   'type' => 'fileAdd',
                   'files' => array(
                       array(
                           'type' => 'js',
                           'position' => 'bottom',
                           'path' => 'views/js/sidebarcart.js',
                           'server' => 'local',
                           'priority' => 200
                           ),
                       array(
                           'type' => 'css',
                           'priority' => 200,
                           'path' => 'views/css/sidebarcart.css',
                           'server' => 'local'
                           ),
                       ),
                   ),
                 'fontsizegsc' => array(
                       'title' => $module->l('Sidebar title font size', 'fields'),
                       'description' => '',
                       'source' => 'select',
                       'options' => $fontSizes,
                       'default' => '24px',
                   ),
                   'backgroundsc' => array(
                       'title' => $module->l('Title and prices block background color', 'fields'),
                       'description' => '',
                       'source' => 'picker',
                       'default' => '#f4f4f4',
                       'allow_empty' => true,
                   ),
                 ),
               ),
        ),
    ),

    array(
        'legend' => array(
            'title' => $module->l('Checkout', 'fields'),
            'class' => 'an_theme-checkout',
            'id' => 'an_themecheckout'
        ),

        'fields' => array(
            'orderpage' => array(
                'title' => $module->l('Order Pages', 'fields'),
                'options' => array(
                     'minimize' => array(
                         'title' => $module->l('Minimized checkout', 'fields'),
                         'description' => '',
                         'source' => 'switch',
                         'default' => '0',
                     ),
                ),
            ),
        ),
    ),
	
    array(
        'legend' => array(
            'title' => $module->l('Home Slider', 'fields'),
            'class' => 'an_theme-anthemeblocks-homeslider',
            'id' => 'anthemecategorypage'
        ),

        'fields' => array(
            'homeSlider' => array(
                'title' => $module->l('Home Slider (if enabled)', 'fields'),
                'options' => array(
                    'sliderFont' => array(
                        'title' => $module->l('Slider font', 'fields'),
						'description' => '',
                        'source' => 'select',
                        'default' => 'opensans',
                        'type' => 'font',
                    ),
                    'titleColor' => array(
                        'title' => $module->l('Title Color', 'fields'),
                        'description' => '',
                        'source' => 'picker',
                        'default' => '#ffffff',
						'allow_empty' => true,
                    ),
                    'TitleFontSize' => array(
                        'title' => $module->l('Title Font Size', 'fields'),
                        'description' => '',
                        'source' => 'select',
                        'options' => $fontSizes,
                        'default' => '16px',
                    ),
                    'descriptionColor' => array(
                        'title' => $module->l('Description Color', 'fields'),
                        'description' => '',
                        'source' => 'picker',
                        'default' => '#ffffff',
						'allow_empty' => true,
                    ),
                    'descriptionFontSize' => array(
                        'title' => $module->l('Description Font Size', 'fields'),
                        'description' => '',
                        'source' => 'select',
                        'options' => $fontSizes,
                        'default' => '16px',
                    ),
                ),
            ),
        ),
    ), 
	array(
        'legend' => array(
            'title' => $module->l('Buttons', 'fields'),
            'class' => 'an_theme-buttons',
            'id' => 'anthemebuttons'
        ),

        'fields' => array(
            'buttons' => array(
                'title' => $module->l('Buttons', 'fields'),
                'options' => array(
                    'backgroundButton' => array(
                        'title' => $module->l('Background Button', 'fields'),
                        'description' => '',
                        'source' => 'picker',
                        'default' => '#2fb5d2',
                    ),
                    'backgroundHoverButton' => array(
                        'title' => $module->l('Background Hover Button', 'fields'),
                        'description' => '',
                        'source' => 'picker',
                        'default' => '#ffff00',
                    ),
                    'borderwidthButton' => array(
                        'title' => $module->l('Size of button border', 'fields'),
                        'description' => '',
                        'source' => 'select',
                        'options' => $border,
                        'default' => '0px',
                    ),
                    'bordercolorButton' => array(
                        'title' => $module->l('Color of button border', 'fields'),
                        'description' => '',
                        'source' => 'picker',
                        'default' => '#2fb5d2',
                    ),
                    'colorHoverBorder' => array(
                        'title' => $module->l('Color of hover button border', 'fields'),
                        'description' => '',
                        'source' => 'picker',
                        'default' => '#ffff00',
                    ),
                    'ButtonBorderRadius' => array(
                        'title' => $module->l('Button border-radius', 'fields'),
                        'description' => '',
                        'source' => 'select',
                        'options' => $border_radius,
                        'default' => '0px',
                    ),
                    'colorButton' => array(
                        'title' => $module->l('Color Font Button', 'fields'),
                        'description' => '',
                        'source' => 'picker',
                        'default' => '#000000',
                    ),
                    'colorButtonHover' => array(
                        'title' => $module->l('Color Font Hover Button', 'fields'),
                        'description' => '',
                        'source' => 'picker',
                        'default' => '#000000',
                    ),
                    'buttoneffect' => array(
                        'title' => $module->l('Button animation effect', 'fields'),
                        'description' => '',
                        'source' => 'switch',
                        'type' => 'fileAdd',
                        'files' => array(
                            array(
                                'type' => 'css',
                                'priority' => 200,
                                'path' => 'views/css/buttons_effect.css',
                                'server' => 'local'
                            ),
                        ),
                    ),
                ),
            ),
            'btnAddToCart' => array (
                'title' => $module->l('Add to cart button on miniature', 'fields'),
                'options' => array(
                    
                    'backgroundAddtocart' => array(
                        'title' => $module->l('Background Button', 'fields'),
                        'description' => '',
                        'source' => 'picker',
                        'default' => '#2fb5d2',
                    ),
                    'backgroundHoverAddtocart' => array(
                        'title' => $module->l('Background Hover Button', 'fields'),
                        'description' => '',
                        'source' => 'picker',
                        'default' => '#ffff00',
                    ),
                    'borderWidthAddtocart' => array(
                        'title' => $module->l('Size of button border', 'fields'),
                        'description' => '',
                        'source' => 'select',
                        'options' => $border,
                        'default' => '0px',
                    ),
                    'borderColorAddtocart' => array(
                        'title' => $module->l('Color of button border', 'fields'),
                        'description' => '',
                        'source' => 'picker',
                        'default' => '#2fb5d2',
                    ),
                    'borderColorHoverAddtocart' => array(
                        'title' => $module->l('Color of hover button border', 'fields'),
                        'description' => '',
                        'source' => 'picker',
                        'default' => '#ffff00',
                    ),
                    'borderRadiusAddtocart' => array(
                        'title' => $module->l('Button border-radius', 'fields'),
                        'description' => '',
                        'source' => 'select',
                        'options' => $border_radius,
                        'default' => '0px',
                    ),
                    'colorAddtocart' => array(
                        'title' => $module->l('Color Font Button', 'fields'),
                        'description' => '',
                        'source' => 'picker',
                        'default' => '#000000',
                    ),
                    'colorHoverAddtocart' => array(
                        'title' => $module->l('Color Font Hover Button', 'fields'),
                        'description' => '',
                        'source' => 'picker',
                        'default' => '#000000',
                    ),
                ),
            ),
        ),
    ),
    array(
        'legend' => array(
            'title' => $module->l('JS/CSS', 'fields'),
            'class' => 'an_theme-code',
            'id' => 'anthemecode'
        ),

        'fields' => array(
            'custom_code' => array(
                'title' => $module->l('Custom code', 'fields'),
                'options' => array(
                    'code_css' => array(
                        'title' => $module->l('Header code CSS', 'fields'),
                        'description' => '',
                        'type' => 'textarea',
                        'file_type' => 'css',
                        'source' => 'textarea',
                        'rows' => '16',
                        'default' => '',
                    ),
                    'code_js' => array(
                        'title' => $module->l('Header code JS', 'fields'),
                        'description' => '',
                        'type' => 'textarea',
                        'file_type' => 'js',
                        'source' => 'textarea',
                        'rows' => '16',
                        'default' => '',
                    ),
                ),
            ),
        ),
    ),
    array(
        'legend' => array(
            'title' => $module->l('Import', 'fields'),
            'class' => 'an_theme-import',
            'id' => 'anthemeimport'
        ),

        'fields' => array(
            'importPresets' => array(
                'title' => $module->l('Import', 'fields'),
                'options' => array(

                    'preset' => array(
                        'title' => $module->l('Presets', 'fields'),
                        'description' => '',
                        'source' => 'presets',
                        'options' => array(),
                    ),



                ),
            ),
        ),
    ),
);



$animateCss = array(
    array(
        'label' => 'none',
        'query' => array(
            'none' => 'none',
        ),
    ),
    array(
        'label' => 'Attention Seekers',
        'query' => array(
			'wow bounce' => 'bounce',
			'wow flash' => 'flash',
			'wow pulse' => 'pulse',
			'wow rubberBand' => 'rubberBand',
			'wow shake' => 'shake',
			'wow headShake' => 'headShake',
			'wow swing' => 'swing',
			'wow tada' => 'tada',
			'wow wobble' => 'wobble',
			'wow jello' => 'jello',
        ),
    ),
    array(
        'label' => 'Bouncing Entrances',
        'query' => array(
			'wow bounceIn' => 'bounceIn',
			'wow bounceInDown' => 'bounceInDown',
			'wow bounceInLeft' => 'bounceInLeft',
			'wow bounceInRight' => 'bounceInRight',
			'wow bounceInUp' => 'bounceInUp',
        ),
    ),
    array(
        'label' => 'Bouncing Exits',
        'query' => array(
			'wow bounceOut' => 'bounceOut',
			'wow bounceOutDown' => 'bounceOutDown',
			'wow bounceOutLeft' => 'bounceOutLeft',
			'wow bounceOutRight' => 'bounceOutRight',
			'wow bounceOutUp' => 'bounceOutUp',
        ),
    ),
    array(
        'label' => 'Fading Entrances',
        'query' => array(
			'wow fadeIn' => 'fadeIn',
			'wow fadeInDown' => 'fadeInDown',
			'wow fadeInDownBig' => 'fadeInDownBig',
			'wow fadeInLeft' => 'fadeInLeft',
			'wow fadeInLeftBig' => 'fadeInLeftBig',
			'wow fadeInRight' => 'fadeInRight',
			'wow fadeInRightBig' => 'fadeInRightBig',
			'wow fadeInUp' => 'fadeInUp',
			'wow fadeInUpBig' => 'fadeInUpBig',
        ),
    ),
    array(
        'label' => 'Fading Exits',
        'query' => array(
			'wow fadeOut' => 'fadeOut',
			'wow fadeOutDown' => 'fadeOutDown',
			'wow fadeOutDownBig' => 'fadeOutDownBig',
			'wow fadeOutLeft' => 'fadeOutLeft',
			'wow fadeOutLeftBig' => 'fadeOutLeftBig',
			'wow fadeOutRight' => 'fadeOutRight',
			'wow fadeOutRightBig' => 'fadeOutRightBig',
			'wow fadeOutUp' => 'fadeOutUp',
			'wow fadeOutUpBig' => 'fadeOutUpBig',
        ),
    ),
    array(
        'label' => 'Flippers',
        'query' => array(
			'wow flipInX' => 'flipInX',
			'wow flipInY' => 'flipInY',
			'wow flipOutX' => 'flipOutX',
			'wow flipOutY' => 'flipOutY',
        ),
    ),
    array(
        'label' => 'Lightspeed',
        'query' => array(
			'wow lightSpeedIn' => 'lightSpeedIn',
			'wow lightSpeedOut' => 'lightSpeedOut',
        ),
    ),
    array(
        'label' => 'Rotating Entrances',
        'query' => array(
			'wow rotateIn' => 'rotateIn',
			'wow rotateInDownLeft' => 'rotateInDownLeft',
			'wow rotateInDownRight' => 'rotateInDownRight',
			'wow rotateInUpLeft' => 'rotateInUpLeft',
			'wow rotateInUpRight' => 'rotateInUpRight',
        ),
    ),
    array(
        'label' => 'Rotating Exits',
        'query' => array(
			'wow rotateOut' => 'rotateOut',
			'wow rotateOutDownLeft' => 'rotateOutDownLeft',
			'wow rotateOutDownRight' => 'rotateOutDownRight',
			'wow rotateOutUpLeft' => 'rotateOutUpLeft',
			'wow rotateOutUpRight' => 'rotateOutUpRight',
        ),
    ),
    array(
        'label' => 'Specials',
        'query' => array(
			'wow hinge' => 'hinge',
			'wow rollIn' => 'rollIn',
			'wow rollOut' => 'rollOut',
        ),
    ),
    array(
        'label' => 'Sliding Entrances',
        'query' => array(
			'wow slideInDown' => 'slideInDown',
			'wow slideInLeft' => 'slideInLeft',
			'wow slideInRight' => 'slideInRight',
        ),
    ),
    array(
        'label' => 'Sliding Entrances',
        'query' => array(
			'wow slideInUp' => 'slideInUp',
			'wow slideOutDown' => 'slideOutDown',
			'wow slideOutLeft' => 'slideOutLeft',
			'wow slideOutRight' => 'slideOutRight',
			'wow slideOutUp' => 'slideOutUp',
        ),
    ),
    array(
        'label' => 'Zoom Entrances',
        'query' => array(
			'wow zoomIn' => 'zoomIn',
			'wow zoomInDown' => 'zoomInDown',
			'wow zoomInLeft' => 'zoomInLeft',
			'wow zoomInRight' => 'zoomInRight',
			'wow zoomInUp' => 'zoomInUp',
        ),
    ),
    array(
        'label' => 'Zoom Exits',
        'query' => array(
			'wow zoomOut' => 'zoomOut',
			'wow zoomOutDown' => 'zoomOutDown',
			'wow zoomOutLeft' => 'zoomOutLeft',
			'wow zoomOutRight' => 'zoomOutRight',
			'wow zoomOutUp' => 'zoomOutUp',
        ),
    ),
);