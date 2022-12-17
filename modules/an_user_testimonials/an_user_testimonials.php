<?php
/**
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
 */

if (!defined('_PS_VERSION_')) {
    exit;
}

use PrestaShop\PrestaShop\Core\Module\WidgetInterface;

require_once _PS_MODULE_DIR_ . 'an_user_testimonials/classes/AnUserTestimonials.php';

class an_user_testimonials extends Module implements WidgetInterface
{

    protected $_tabs = array(

        array(
            'class_name' => 'AdminUserTestimonials',
            'parent' => 'AdminParentModulesSf',
            'name' => 'User testimonials',
            'active' => 0
        ),
    
    );    

    public function __construct()
    {
        $this->name = 'an_user_testimonials';
        $this->tab = 'others';
        $this->version = '1.0.0';
        $this->author = 'Anvanto';
        $this->need_instance = 0;

        $this->bootstrap = true;
        $this->module_key = '';

        parent::__construct();

        $this->displayName = $this->l('User testimonials');
        $this->description = $this->l('User testimonials');

        $this->confirmUninstall = $this->l('Are you sure you want to uninstall the module?');

        $this->ps_versions_compliancy = array('min' => '1.7', 'max' => _PS_VERSION_);
        $this->front_css_path = $this->local_path.'views/css/';
        
        $this->iconsUrl = $this->getPathUri() . 'img/';
        $this->iconsPath = _PS_MODULE_DIR_ . 'an_user_testimonials/img/';
        $this->modulePath = _MODULE_DIR_ . 'an_user_testimonials/';

    }

    /**
     * @return bool
     */

    public function install()
    {
        $sql = include _PS_MODULE_DIR_ . $this->name . '/sql/install.php';
        foreach ($sql as $_sql) {
            Db::getInstance()->Execute($_sql);
        }
        
        $this->sampleInstall();
        
        $languages = Language::getLanguages();
        foreach ($this->_tabs as $tab) {
            $_tab = new Tab();
            $_tab->active = $tab['active'];
            $_tab->class_name = $tab['class_name'];
            $_tab->id_parent = Tab::getIdFromClassName($tab['parent']);
            if (empty($_tab->id_parent)) {
                $_tab->id_parent = 0;
            }

            $_tab->module = $this->name;
            foreach ($languages as $language) {
                $_tab->name[$language['id_lang']] = $this->l($tab['name']);
            }

            $_tab->add();
        }        
        
        return parent::install()
            && $this->registerHook('header')
            && $this->registerHook('displayReviewsBlock')
            && $this->registerHook('backOfficeHeader');
    }

    /**
     * @return bool
     */

    public function uninstall()
    {
        $sql = include _PS_MODULE_DIR_ . $this->name .  '/sql/uninstall.php';
        foreach ($sql as $_sql) {
            Db::getInstance()->Execute($_sql);
        }    
        
        foreach ($this->_tabs as $tab) {
            $_tab_id = Tab::getIdFromClassName($tab['class_name']);
            $_tab = new Tab($_tab_id);
            $_tab->delete();
        }        

        return parent::uninstall();
    }
    
    
    public function sampleInstall()
    {
        $defaultTitle = 'Lorean M.';
        $defaultContent = $this->display($this->name, 'views/templates/front/default_content.tpl');
                   
        $languages = Language::getLanguages(false);

        for ($i = 1; $i < 4; $i++){

            copy(_PS_MODULE_DIR_ . $this->name.'/views/img/avatar.png', $this->iconsPath.'/avatar_'.$i.'.png');

            $userTestimonials = new AnUserTestimonials();

            foreach ($languages as $lang) {  
                $userTestimonials->testimonial_title[$lang['id_lang']] = $defaultTitle;
                $userTestimonials->testimonial_content[$lang['id_lang']] = $defaultContent;
                $userTestimonials->file_name = 'avatar_'.$i.'.png';
            }
            $userTestimonials->save();
        }   
    }    
    
    /**
     *
     */

    public function hookHeader()
    {
        $this->context->controller->addJquery();

        $pathCSS = '';
        if (Tools::file_exists_no_cache('modules/anthemeblocks/views/css/owl.carousel.min.css')){
            $pathCSS = 'modules/anthemeblocks/views/css/owl.carousel.min.css'; 
        } else if (Tools::file_exists_no_cache(_PS_THEME_DIR_.'/assets/lib/owl.carousel.min.css')){           
            $pathCSS = 'themes/'._THEME_NAME_.'/assets/lib/owl.carousel.min.css';
        } else {
            $pathCSS = 'modules/' . $this->name . '/views/css/owl.carousel.min.css';  
        }

        $this->context->controller->registerStylesheet(
            $this->name . "_css_carusel",
            $pathCSS,
            array('server' => 'local', 'priority' => 150)
        );

        $this->context->controller->registerStylesheet(
            $this->name . "_css",
            'modules/' . $this->name . '/views/css/testimonials.css',
            array('server' => 'local', 'priority' => 150)
        );

        $pathJS = '';
        if (Tools::file_exists_no_cache('modules/anthemeblocks/views/js/owl.carousel.min.js')){
            $pathJS = 'modules/anthemeblocks/views/js/owl.carousel.min.js'; 
        } else if (Tools::file_exists_no_cache(_PS_THEME_DIR_.'/assets/lib/owl.carousel.min.js')){
            $pathJS = 'themes/'._THEME_NAME_.'/assets/lib/owl.carousel.min.js';   
        } else {    
            $pathJS = 'modules/' . $this->name . '/views/js/owl.carousel.min.js';      
        } 

        $this->context->controller->registerJavascript(
            $this->name . "_js_carusel",
            $pathJS,
            array('server' => 'local', 'priority' => 150)
        ); 

        $this->context->controller->registerJavascript(
            $this->name . "_js",
            'modules/' . $this->name . '/views/js/init.slider.js',
            array('server' => 'local', 'priority' => 150)
        );
            
    }

    
    /**
     * @param $hookName
     * @param array $params
     * @return mixed|void
     */

    public function renderWidget($hookName, array $params)
    {
        if ($hookName != 'backOfficeHeader'){
            $widget = $this->getWidgetVariables($hookName, $params);
            $this->smarty->assign('widget', $widget);
            $this->smarty->assign('iconsUrl', $this->iconsUrl);
            return $this->fetch('module:' . $this->name . '/views/templates/front/widget.tpl');
        }
    }

    /**
     * @param $hookName
     * @param array $params
     * @return array
     */
    
    public function getWidgetVariables($hookName, array $params)
    {        
        return AnUserTestimonials::getUserTestimonials();
    }
    
    public function getContent()
    {
        Tools::redirectAdmin($this->context->link->getAdminLink('AdminUserTestimonials'));
    }
    
    public function topPromo()
    {
        $this->context->smarty->assign('theme', $this->getThemeInfo());
        return $this->display(__FILE__, 'views/templates/admin/suggestions.tpl');
    }
    
    public function getThemeInfo()
    {
        $theme = [];
        $themeFileJson = _PS_THEME_DIR_.'/config/theme.json';
        if (Tools::file_exists_no_cache($themeFileJson)) {
            $theme = (array)Tools::jsonDecode(Tools::file_get_contents($themeFileJson), 1);            
        }

        if (!isset($theme['url_contact_us']) || $theme['url_contact_us'] == ''){
            
            $urlContactUs = 'https://addons.prestashop.com/contact-form.php';

            if (isset($theme['addons_id']) && $theme['addons_id'] != ''){
                $urlContactUs .= '?id_product=' .$theme['addons_id'];
            } elseif (isset($this->url_contact_us) && $this->url_contact_us != ''){
                $urlContactUs = $this->url_contact_us;
            } elseif (isset($this->addons_product_id) && $this->addons_product_id != ''){
                $urlContactUs .= '?id_product=' .$this->addons_product_id;
            }
            
            $theme['url_contact_us'] = $urlContactUs;
        }
        
        if (!isset($theme['url_rate']) || $theme['url_rate'] == ''){
            
            $urlRate = 'https://addons.prestashop.com/ratings.php';

            if (isset($theme['addons_id']) && $theme['addons_id'] != ''){
                $urlRate .= '?id_product=' .$theme['addons_id'];
            } elseif (isset($this->url_rate) && $this->url_rate != ''){
                $urlRate = $this->url_rate;
            } elseif (isset($this->addons_product_id) && $this->addons_product_id != ''){
                $urlRate .= '?id_product=' .$this->addons_product_id;
            }
            
            $theme['url_rate'] = $urlRate;
        }        
        
        return $theme;
    }
}
