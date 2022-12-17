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

class an_client_service extends Module implements WidgetInterface
{

	const PREFIX = 'an_cserv_';

    public function __construct()
    {
        $this->name = 'an_client_service';
        $this->tab = 'others';
        $this->version = '1.0.0';
        $this->author = 'Anvanto';
        $this->need_instance = 0;

        $this->bootstrap = true;
        $this->module_key = '';

        parent::__construct();

        $this->displayName = $this->l('Client Service');
        $this->description = $this->l('Client Service');

        $this->confirmUninstall = $this->l('Are you sure you want to uninstall the module?');

        $this->ps_versions_compliancy = array('min' => '1.7', 'max' => _PS_VERSION_);
        $this->front_css_path = $this->local_path.'views/css/';
    }

    /**
     * @return bool
     */
    public function install()
    {
		$defaulTitles['en'] = 'Client service';
		$defaulTitles['fr'] = 'Service client';
		$defaulTitles['es'] = 'Servicio al cliente';
		$defaulTitles['pl'] = 'Serwis Klienta';
		$defaulTitles['it'] = 'Servizio Clienti';
		$defaulTitles['nl'] = 'Klantenservice';
		$defaulTitles['de'] = 'Kundendienst';

		$modalText = $this->display($this->name, 'views/templates/front/default_content.tpl');
				
		$languages = Language::getLanguages(false);
		$valueTitle = [];
		$valueContent = [];
        foreach ($languages as $lang) {
			if (isset($defaulTitles[$lang['iso_code']])){
				$valueTitle[$lang['id_lang']] = $defaulTitles[$lang['iso_code']];
			} else {
				$valueTitle[$lang['id_lang']] = $defaulTitles['en'];
			}
			$valueContent[$lang['id_lang']] = htmlentities($modalText);
		}
		Configuration::updateValue(self::PREFIX.'title', $valueTitle);			
		Configuration::updateValue(self::PREFIX.'text_popup', $valueContent, true);

        return parent::install()
            && $this->registerHook('header')
            && $this->registerHook('displayNav2');
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
		$widget = $this->getWidgetVariables($hookName, $params);
		$this->smarty->assign('widget', $widget);
		return $this->fetch('module:an_client_service/views/templates/front/widget.tpl');
    }

    /**
     * @param $hookName
     * @param array $params
     * @return array
     */
    public function getWidgetVariables($hookName, array $params)
    {
        return [
			'title' => html_entity_decode(Configuration::get(self::PREFIX . 'title', $this->context->language->id)),
			'text_popup' =>  html_entity_decode(Configuration::get(self::PREFIX . 'text_popup', $this->context->language->id)),
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
			
			$html = false;
			if (isset($input['html']) && $input['html']){
				$html = true;
			}
			
			if (isset($input['lang']) && $input['lang']){
				$value = [];
				foreach ($languages as $lang) {
					$value[$lang['id_lang']] = Tools::getValue($input['name'].'_' . $lang['id_lang']);
					
					if ($html){
						$value[$lang['id_lang']] = htmlentities($value[$lang['id_lang']]);
					}
				}

				Configuration::updateValue($input['name'], $value, $html);
			} else {
				Configuration::updateValue($input['name'], Tools::getValue($input['name']), $html);
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
			
			$html = false;
			if (isset($input['html']) && $input['html']){
				$html = true;
			}
			
			if (isset($input['lang']) && $input['lang']){
				foreach ($languages as $lang) {
					
					$value = Configuration::get($input['name'], $lang['id_lang']);
					
					if ($html){
						$value = html_entity_decode($value);
					}
					
					$helper->fields_value[$input['name']][$lang['id_lang']] = $value;
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
					'label' => $this->l('Title'),
					'name' => self::PREFIX.'title',
				],	
				[
					'type' => 'textarea',
					'class' => 'autoload_rte',
					'html' => true,
					'lang' => true,
					'required' => true,
					'label' => $this->l('Content'),
					'name' => self::PREFIX.'text_popup',
			//		'desc' => $this->l('Use [year] to display the year'),
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
