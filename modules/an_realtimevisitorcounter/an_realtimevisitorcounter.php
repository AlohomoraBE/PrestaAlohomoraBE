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

class an_realtimevisitorcounter extends Module implements WidgetInterface
{

	const PREFIX = 'an_rtvc_';

    public function __construct()
    {
        $this->name = 'an_realtimevisitorcounter';
        $this->tab = 'others';
        $this->version = '1.0.1';
        $this->author = 'Anvanto';
        $this->need_instance = 0;

        $this->bootstrap = true;
        $this->module_key = '';

        parent::__construct();

        $this->displayName = $this->l('Real time visitor counter');
        $this->description = $this->l('Real time visitor counter');

        $this->confirmUninstall = $this->l('Are you sure you want to uninstall the module?');

        $this->ps_versions_compliancy = array('min' => '1.7', 'max' => _PS_VERSION_);
        $this->front_css_path = $this->local_path.'views/css/';
    }

    /**
     * @return bool
     */
    public function install()
    {
        $languages = Language::getLanguages(false);
		$valueTitleLeft = [];
		$valueTitleRight = [];
        foreach ($languages as $lang) {
			$valueTitleLeft[$lang['id_lang']] = 'Real Time:';
			$valueTitleRight[$lang['id_lang']] = 'Visitor right now';
		}
		Configuration::updateValue(self::PREFIX.'title_left', $valueTitleLeft);
		Configuration::updateValue(self::PREFIX.'title_right', $valueTitleRight);	

		Configuration::updateValue(self::PREFIX.'min_value', '5');
		Configuration::updateValue(self::PREFIX.'max_value', '25');
		Configuration::updateValue(self::PREFIX.'stroke_value', '8');
		Configuration::updateValue(self::PREFIX.'min_interval', '2');
		Configuration::updateValue(self::PREFIX.'max_interval', '6');

        return parent::install()
            && $this->registerHook('header')
            && $this->registerHook('displayProductVisitors');
    }

    /**
     * @return bool
     */
    public function uninstall()
    {
        $this->deleteParams($this->getParamList());

        return parent::uninstall();
    }
	
    /**
     *
     */
    public function hookHeader()
    {
		if ($this->context->controller instanceof ProductController) {
			$this->context->controller->addJquery();
			
			$this->context->controller->registerStylesheet(
				"anrealtimevisitorcounter",
				'modules/' . $this->name . '/views/css/front.css',
				array('server' => 'local', 'priority' => 150)
			);
			
			$this->context->controller->registerJavascript(
				"anrealtimevisitorcounter",
				'modules/' . $this->name . '/views/js/front.js',
				array('server' => 'local', 'priority' => 150)
			); 
		}
    }
	
    /**
     * @param $hookName
     * @param array $params
     * @return mixed|void
     */
    public function renderWidget($hookName, array $params)
    {
		$widget = $this->getWidgetVariables($hookName, $params);
		$this->smarty->assign('widget', $widget);
		return $this->fetch('module:an_realtimevisitorcounter/views/templates/front/widget.tpl');
    }

    /**
     * @param $hookName
     * @param array $params
     * @return array
     */
    public function getWidgetVariables($hookName, array $params)
    {
        return [
			'title_left' => Configuration::get(self::PREFIX . 'title_left', $this->context->language->id),
			'title_right' =>  Configuration::get(self::PREFIX . 'title_right', $this->context->language->id),
			'min_value' =>  Configuration::get(self::PREFIX . 'min_value'),
			'max_value' =>  Configuration::get(self::PREFIX . 'max_value'),
			'stroke_value' =>  Configuration::get(self::PREFIX . 'stroke_value'),
			'min_interval' =>  Configuration::get(self::PREFIX . 'min_interval'),
			'max_interval' =>  Configuration::get(self::PREFIX . 'max_interval'),
		];
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
            'title_left',
            'title_right',
            'min_value',
            'max_value',
            'stroke_value',
            'min_interval',
            'max_interval',
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
		if (Tools::isSubmit('submit'.$this->name)) {
			$this->postProcess();
		}
		
		$this->context->smarty->assign('theme', $this->getThemeInfo());
		
        return $this->display(__FILE__, 'views/templates/admin/suggestions.tpl') . $this->displayForm();
    }
    
    protected function postProcess()
    {
		$languages = Language::getLanguages(false);
		
		$form = $this->getConfigForm();
		
		foreach ($form['input'] as $input){
						
			if (isset($input['lang']) && $input['lang']){
				$value = [];
				foreach ($languages as $lang) {
					$value[$lang['id_lang']] = Tools::getValue($input['name'].'_' . $lang['id_lang']);
				}
				
				Configuration::updateValue($input['name'], $value);
			} else {
				Configuration::updateValue($input['name'], Tools::getValue($input['name']));
			}
		} 

		Tools::redirectAdmin($this->context->link->getAdminLink('AdminModules') . '&conf=4&configure='.$this->name);
		
        return $this->context->controller->confirmations[] = $this->l('The settings have been updated.');
    }


    public function displayForm()
    {

        $default_lang = (int)Configuration::get('PS_LANG_DEFAULT');
        $fields_form = [];

        $fields_form[0]['form'] = $this->getConfigForm();
        $helper = new HelperForm();

        $helper->module = $this;
        $helper->name_controller = $this->name;
        $helper->token = Tools::getAdminTokenLite('AdminModules');
        $helper->currentIndex = AdminController::$currentIndex.'&configure='.$this->name;

        $helper->default_form_language = $default_lang;
        $helper->allow_employee_form_lang = $default_lang;

        $helper->title = $this->displayName;
        $helper->show_toolbar = true;
        $helper->toolbar_scroll = true;
        $helper->submit_action = 'submit' . $this->name;
        $helper->toolbar_btn = array(
            'save' =>
                [
                    'desc' => $this->l('Save'),
                    'href' => AdminController::$currentIndex.'&configure='.$this->name.'&save'.$this->name.
                        '&token='.Tools::getAdminTokenLite('AdminModules'),
                ],
        );
		
		$helper->languages = $this->context->controller->getLanguages();
		$helper->id_language = $this->context->language->id;
			
		
		$languages = Language::getLanguages(false);
		foreach ($fields_form[0]['form']['input'] as $input){
			
			if (isset($input['lang']) && $input['lang']){
				foreach ($languages as $lang) {
					$helper->fields_value[$input['name']][$lang['id_lang']] = Configuration::get($input['name'], $lang['id_lang']);
				}
			} else {
				$helper->fields_value[$input['name']] = Configuration::get($input['name']);
			}
		}


        return $helper->generateForm($fields_form);
    }
	
    protected function getConfigForm()
    {
		$form = [
            'legend' => [
                'title' => $this->l('Settings'),
            ],
            'input' => [
           
				[
					'type' => 'text',
					'lang' => true,
					'required' => true,
					'label' => $this->l('Title left'),
					'name' => self::PREFIX.'title_left',
				],	
				[
					'type' => 'text',
					'lang' => true,
					'label' => $this->l('Title right'),
					'name' => self::PREFIX.'title_right',
				],	
				[
					'type' => 'number',
					'required' => true,
					'col' => 1,
					'min' => 1,
					'max' => 1000,				
					'label' => $this->l('Min Value'),
					'name' => self::PREFIX.'min_value',
				],	
				[
					'type' => 'number',
					'required' => true,
					'col' => 1,
					'min' => 1,
					'max' => 1000,			
					'label' => $this->l('Max Value'),
					'name' => self::PREFIX.'max_value',
				],
				[
					'type' => 'number',
					'required' => true,
					'col' => 1,
					'min' => 1,
					'max' => 1000,				
					'label' => $this->l('Stroke Value'),
					'name' => self::PREFIX.'stroke_value',
				],				
				[
					'type' => 'number',
					'required' => true,
					'col' => 1,
					'min' => 1,
					'max' => 1000,				
					'label' => $this->l('Min Interval'),
					'name' => self::PREFIX.'min_interval',
				],				
				[
					'type' => 'number',
					'required' => true,
					'col' => 1,
					'min' => 1,
					'max' => 1000,				
					'label' => $this->l('Max Interval'),
					'name' => self::PREFIX.'max_interval',
				],							
                
            ],
            'submit' => [
                'title' => $this->l('Save'),
            ]
        ];
		
		return $form;
		
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
