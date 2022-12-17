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

require_once _PS_MODULE_DIR_ . 'an_sizeguide/classes/AnSizeGuide.php';

class an_sizeguide extends Module implements WidgetInterface
{

	const PREFIX = 'an_sg_';
	
    protected $_tabs = array(

        array(
            'class_name' => 'AdminAnsizeguideWidgets',
            'parent' => 'AdminParentModulesSf',
            'name' => 'Size Guide',
			'active' => 0
        ),
		
    );	

    public function __construct()
    {
        $this->name = 'an_sizeguide';
        $this->tab = 'others';
        $this->version = '1.0.2';
        $this->author = 'Anvanto';
        $this->need_instance = 0;

        $this->bootstrap = true;
        $this->module_key = '';

        parent::__construct();

        $this->displayName = $this->l('Size Guide');
        $this->description = $this->l('Size Guide');

        $this->confirmUninstall = $this->l('Are you sure you want to uninstall the module?');

        $this->ps_versions_compliancy = array('min' => '1.7', 'max' => _PS_VERSION_);
        $this->front_css_path = $this->local_path.'views/css/';
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
	
	
	public function sampleInstall()
	{
		$defaulTitles['en'] = 'Size Guide';
		$defaulTitles['fr'] = 'Guide des tailles';
		$defaulTitles['es'] = 'Guia de tallas';
		$defaulTitles['pl'] = 'Tabela rozmiarów';
		$defaulTitles['it'] = 'Guida alle taglie';
		$defaulTitles['nl'] = 'Maattabel';
		$defaulTitles['de'] = 'Größentabelle';

		$defaultContent = $this->display($this->name, 'views/templates/front/default_content.tpl');
				
		$sizeguide = new AnSizeGuideWidgets();
		$languages = Language::getLanguages(false);
		foreach ($languages as $lang) {
			if (isset($defaulTitles[$lang['iso_code']])){
				$sizeguide->sizeguide_title[$lang['id_lang']] = $defaulTitles[$lang['iso_code']];
			} else {
				$sizeguide->sizeguide_title[$lang['id_lang']] = $defaulTitles['en'];
			}
			
			$sizeguide->sizeguide_content[$lang['id_lang']] = $defaultContent;
		}
		$sizeguide->save();
	}	
	
    /**
     *
     */
    public function hookDisplayBackOfficeHeader()
    {
		if (Tools::getValue('controller') == 'AdminAnsizeguideWidgets'){
           
            $this->context->controller->addJquery();
            $this->context->controller->addJS($this->_path . 'views/js/back.js');
			$this->context->controller->addCSS($this->_path . '/views/css/back.css');
			
			return $this->display(__FILE__, 'views/templates/admin/js_header.tpl');
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
			array('server' => 'local', 'priority' => 150)
		);
		
		$this->context->controller->registerJavascript(
			$this->name . "_js",
			'modules/' . $this->name . '/views/js/front.js',
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
		$widgets = $this->getWidgetVariables($hookName, $params);
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
		$id_product = 0;
		if (isset($params['product']['id_product'])){
			$id_product = $params['product']['id_product'];
		}
		
		$cats = product::getProductCategories($id_product);

		$widgets = AnSizeGuideWidgets::getSizeGuide($id_product, $cats);
	
		return $widgets;
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
		Tools::redirectAdmin($this->context->link->getAdminLink('AdminAnsizeguideWidgets'));
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
