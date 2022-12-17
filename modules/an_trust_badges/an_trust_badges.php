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

require_once _PS_MODULE_DIR_ . 'an_trust_badges/classes/AnTrustBadgesWidgets.php';
require_once _PS_MODULE_DIR_ . 'an_trust_badges/classes/AnTrustBadgesIcons.php';

class an_trust_badges extends Module implements WidgetInterface
{

	const PREFIX = 'an_tb_';
	
    protected $_tabs = array(
 
        [
            'class_name' => 'AdminAntrustbadgesIcons',
            'parent' => 'AdminParentModulesSf',
            'name' => 'Trust Badges: Icons',
			'active' => 0
        ],

        [
            'class_name' => 'AdminAntrustbadgesWidgets',
            'parent' => 'AdminParentModulesSf',
            'name' => 'Trust Badges: Widgets',
			'active' => 0
        ],
		
    );	

    public function __construct()
    {
        $this->name = 'an_trust_badges';
        $this->tab = 'others';
        $this->version = '1.0.1';
        $this->author = 'Anvanto';
        $this->need_instance = 0;

        $this->bootstrap = true;
        $this->module_key = '';

        parent::__construct();

        $this->displayName = $this->l('Trust Badges');
        $this->description = $this->l('Trust Badges');

        $this->confirmUninstall = $this->l('Are you sure you want to uninstall the module?');

        $this->ps_versions_compliancy = array('min' => '1.7', 'max' => _PS_VERSION_);
        $this->front_css_path = $this->local_path.'views/css/';
		
		$this->iconsJson = _PS_MODULE_DIR_ . 'an_trust_badges/icons.json';
		$this->iconsWidgets = _PS_MODULE_DIR_ . 'an_trust_badges/widgets.json';
		$this->iconsPath = _PS_MODULE_DIR_ . 'an_trust_badges/icons/';
		$this->iconsUrl = $this->getPathUri() . 'icons/';
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
		
		$this->importIsonsJson();
		$this->importWidgetsJson();
		$this->setDefaultForAllShops();
		
        return parent::install()
            && $this->registerHook('header')
            && $this->registerHook('displayProductAdditionalInfo')
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
		
		$this->deleteParams($this->getParamList());

        return parent::uninstall();
    }
	
	
	public function importIsonsJson()
	{
		$data = Tools::jsonDecode(Tools::file_get_contents($this->iconsJson), true);
		
		if ($data){
			foreach ($data as $item){
				$iconsObj = new AnTrustBadgesIcons();
				$iconsObj->icon_id = $item['icon_id'];
				$iconsObj->active = $item['active'];
				$iconsObj->position = $item['position'];
				$iconsObj->icon_title = $item['icon_title'];
				$iconsObj->file_name = $item['file_name'];
				$iconsObj->code = $item['code'];
				$iconsObj->type_icon = $item['type_icon'];
				$iconsObj->save();
			}
		}
	}
	
	public function importWidgetsJson()
	{
		$data = Tools::jsonDecode(Tools::file_get_contents($this->iconsWidgets), true);
		
		if ($data){
			
			foreach ($data as $item){

				$widgetObj = new AnTrustBadgesWidgets();
				$widgetObj->id_widget = $item['id_widget'];
				$widgetObj->active = $item['active'];
				$widgetObj->position = $item['position'];
				
				$widgetObj->hook = $item['hook'];
				$this->registerHook($item['hook']);
				
				$widgetObj->class = $item['class'];
				
				$languages = Language::getLanguages();
				foreach ($languages as $language) {
					$widgetObj->widget_title[$language['id_lang']] = $item['widget_title'];
				}				
				
				$widgetObj->save();
			}
		}
		
	}	

	public function setDefaultForAllShops()
	{
		if (!Shop::isFeatureActive()) {
			return false;
		}

		$shops = Shop::getShops(true, null, true);
		$allIcons = AnTrustBadgesIcons::getAllIcons();
		$allWidgets = AnTrustBadgesWidgets::getAllWidgets();
		
		$dataIcons = [];
		foreach ($shops as $shop){
			foreach ($allIcons as $icon){
				Db::getInstance()->insert('an_trust_badges_icons_shop', ['icon_id' => (int) $icon['icon_id'], 'id_shop' => (int) $shop]);
			}

			foreach ($allWidgets as $widget){
				Db::getInstance()->insert('an_trust_badges_widgets_shop', ['id_widget' => (int) $widget['id_widget'], 'id_shop' => (int) $shop]);
			}
		}

		return true;
	}
	
    /**
     *
     */
    public function hookDisplayBackOfficeHeader()
    {
		if (Tools::getValue('controller') == 'AdminAntrustbadgesIcons'){
           
            $this->context->controller->addJquery();
            $this->context->controller->addJS($this->_path . 'views/js/back.js');
			$this->context->controller->addCSS($this->_path . '/views/css/back.css');
			
		//	return $this->display(__FILE__, 'views/templates/admin/js_header.tpl');
        }
    }
	
    /**
     *
     */
    public function hookHeader()
    {
		$this->context->controller->addJquery();
		
		$this->context->controller->registerStylesheet(
			$this->name . "_css",
			'modules/' . $this->name . '/views/css/front.css',
			['server' => 'local', 'priority' => 150]
		);
    }
	
    /**
     * @param $hookName
     * @param array $params
     * @return mixed|void
     */
    public function renderWidget($hookName, array $params)
    {
		$widgets = $this->getWidgetVariables($hookName, $params);
		
		$icons = AnTrustBadgesIcons::getIcons();
				
		$this->smarty->assign('iconsUrl', $this->iconsUrl);
		$this->smarty->assign('icons', $icons);
		$this->smarty->assign('widgets', $widgets);
		return $this->fetch('module:' . $this->name . '/views/templates/front/widget.tpl');
    }

    /**
     * @param $hookName
     * @param array $params
     * @return array
     */
    public function getWidgetVariables($hookName, array $params)
    {			
		$widgets = AnTrustBadgesWidgets::getWidgets($hookName);
		return $widgets;
    }
	
	
    /**
     * @return bool
     */
    public function hookFilter($hook)
    {
        $res = strpos(Tools::strtolower($hook['name']), 'admin') === false;
        $res &= strpos(Tools::strtolower($hook['name']), 'backoffice') === false;
		
		$ignoreHooks = $this->getHooksList('hooks_ignore');
		if (in_array($hook['name'], $ignoreHooks)){
			 $res &= false;
		}
	
        return $res;
    }	
	
    /**
     * @return array
     */
    public function getHooksList($file = 'hooks')
    {
        if (Tools::file_exists_no_cache(_PS_MODULE_DIR_ . 'an_trust_badges/'.$file.'.php')) {
            return include _PS_MODULE_DIR_ . 'an_trust_badges/'.$file.'.php';
        } else {
            return array();
        }
    }	
	
    /**
     * @return array
     */
    public function getHooksQuery()
    {
        $hooksQuery = [];

		foreach ($this->getHooksList() as $hookname) {
			$hooksQuery[] = ['name' => $hookname];
		}
		
		return $hooksQuery;
		
    }	
	
    /**
     * @param $key
     * @param null $value
     * @param null $id_lang
     * @return bool|string
     */
    public static function getParam($key, $value = null, $id_lang = null)
    {
        return $value === null ? Configuration::get(
            self::PREFIX . $key,
            $id_lang
        ) : Configuration::updateValue(self::PREFIX . $key, $value);
    }

    public function getParamList()
    {
        return [
            'title',
            'text_popup',
        ];
    }
	
    protected function deleteParams($keys)
    {
        foreach ($keys as $key) {
            $this->deleteParam($key);
        }
    }

    protected function deleteParam($key)
    {
        return Configuration::deleteByName(self::PREFIX.$key);
    }
	
	public function getContent()
	{
		Tools::redirectAdmin($this->context->link->getAdminLink('AdminAntrustbadgesWidgets'));
	}
    
	public function topPromo()
	{
		
		$this->context->smarty->assign([
			'widgetsUrl' => $this->context->link->getAdminLink('AdminAntrustbadgesWidgets'),
			'iconsUrl' => $this->context->link->getAdminLink('AdminAntrustbadgesIcons'),
		]);
		
		$this->context->smarty->assign('theme', $this->getThemeInfo());
        return $this->display(__FILE__, 'views/templates/admin/top.tpl');
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
