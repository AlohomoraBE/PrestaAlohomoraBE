<?php
/**
 * 2022 Anvanto
 *
 * NOTICE OF LICENSE
 *
 * This file is not open source! Each license that you purchased is only available for 1 wesite only.
 * If you want to use this file on more websites (or projects), you need to purchase additional licenses. 
 * You are not allowed to redistribute, resell, lease, license, sub-license or offer our resources to any third party.
 *
 *  @author Anvanto <anvantoco@gmail.com>
 *  @copyright  2022 Anvanto
 *  @license    Valid for 1 website (or project) for each purchase of license
 *  International Registered Trademark & Property of Anvanto
 */
 
require_once _PS_MODULE_DIR_ . 'an_accordion/classes/AnAccordionBlock.php';

class AdminAccordionBlockController extends ModuleAdminController
{
    protected $_module = null;
	
	protected $position_identifier = 'id_widget';

    public function __construct()
    {
        $this->bootstrap = true;
        $this->context = Context::getContext();
        $this->table = 'an_accordion';
        $this->identifier = 'id_widget';
        $this->className = 'AnAccordionBlock';
		$this->lang = true;
	
        $this->addRowAction('edit');
        $this->addRowAction('delete');
 
		$this->name = 'AdminAccordionBlockController';
		
        parent::__construct();
		
        $this->fields_list = array(
            'id_widget' => array(
				'title' => $this->module->l('ID'), 
				'width' => 25,
				'search'  => false,
			),
            
            'accordion_title' => array(
				'title' => $this->module->l('Title'), 
				'search'  => false,
			),	
            
            'accordion_content' => array(
				'title' => $this->module->l('Content'), 
				'search'  => false,
			),
	
            'active' => array(
                'title' => $this->module->l('Status'),
                'width' => 40,
                'active' => 'update',
                'align' => 'center',
                'type' => 'bool',
				'search'  => false,
                'orderby' => false
            )
			
        );

        if (Shop::isFeatureActive() && Shop::getContext() != Shop::CONTEXT_ALL) {
            $this->_where .= ' AND a.' . $this->identifier . ' IN (
                SELECT sa.' . $this->identifier . '
                FROM `' . _DB_PREFIX_ . $this->table . '_shop` sa
                WHERE sa.id_shop IN (' . implode(', ', Shop::getContextListShopID()) . ')
            )';
        }
	}  
    
    public function renderList()
	{
		return $this->module->topPromo() .  parent::renderList() . $this->renderFormTitle();
	} 

    public function getList($id_lang, $order_by = null, $order_way = null, $start = 0, $limit = null, $id_lang_shop = false)
    {
        parent::getList($id_lang, $order_by, $order_way, $start, $limit, $id_lang_shop);
        foreach ($this->_list as &$list) {
            $list['accordion_content'] = strip_tags($list['accordion_content']);
        } 
    }
    
	public function renderForm()
	{
		$this->initToolbar();
 		if (!$this->loadObject(true)) {
			return;
		}
		
        $this->fields_form = array(
            'tinymce' => false,
            'legend' => ['title' => $this->module->l('Accordion block')],
            'input' => [],
            'buttons' => [
                [
                    'type' => 'submit',
                    'title' => $this->l('Save'),
                    'icon' => 'process-icon-save',
                    'class' => 'pull-right',
                    'name' => 'submit'.$this->table
                ],
                [
                    'type' => 'submit',
                    'title' => $this->l('Save and stay'),
                    'icon' => 'process-icon-save',
                    'class' => 'pull-right',
                    'name' => 'submit'.$this->table.'AndStay'
                ],
            ],
        );

		$this->fields_form['input'][] = array(
			'type' => 'switch',
			'name' => 'active',
			'label' => $this->module->l('Active'),
			'values' => array(
				array(
					'id' => 'active_on',
					'value' => 1,
					'label' => $this->module->l('Enabled')
				),
				array(
					'id' => 'active_off',
					'value' => 0,
					'label' => $this->module->l('Disabled')
				)
			),
			
		);

		$this->fields_form['input'][] = array(
			'col' => 6,
			'type' => 'text',
			'name' => 'accordion_title',
			'label' => $this->module->l('Title'),	
			'lang' => true,
		);	

		$this->fields_form['input'][] = array(
			'type' => 'textarea',
			'class' => 'autoload_rte',
			'name' => 'accordion_content',
			'label' => $this->module->l('Content'),
			'lang' => true		
		);			

		return $this->module->topPromo() . parent::renderForm();
	}
  
    protected function getConfigFormCarrier()
    {
        $form = array(
            'form' => array(
                'legend' => array(
                    'title' => $this->l('Title'),
                    'icon' => 'icon-cogs',
                ),
                'input' => array(
                    array(
                        'type' => 'text',
                        'label' => $this->l('Title'),
                        'name' => 'anab_title',
                        'lang' => true,

                    ),
                ),
                'submit' => array(
                    'title' => $this->l('Save'),
                    'name' => 'anab_save_title',
                ),
            ),
        );

        return $form;
    }

    public function renderFormTitle()
    {
        $default_lang = (int)Configuration::get('PS_LANG_DEFAULT');
        
        $helper = new HelperForm();
        $helper->show_toolbar = false;
        $helper->name_controller = $this->name;
        $helper->submit_action = $this->name;
        $helper->currentIndex = $this->context->link->getAdminLink('AdminAccordionBlock', false);
        $helper->token = Tools::getAdminTokenLite('AdminAccordionBlock');

        $languages = Language::getLanguages(false);
			
			
		foreach ($languages as $lang) {
			$helper->tpl_vars['fields_value']['anab_title'][$lang['id_lang']] = Configuration::get('anab_title', $lang['id_lang']);
		}

        $helper->default_form_language = $default_lang;
        $helper->allow_employee_form_lang = $default_lang;
       
        $helper->languages = $this->context->controller->getLanguages();
		$helper->id_language = $this->context->language->id;

        if (Tools::isSubmit('anab_save_title')) {
		    $this->postProcessTitle();			
		}
		
        return $helper->generateForm(array($this->getConfigFormCarrier()));		
	}

    public function postProcessTitle()
    {
        $languages = Language::getLanguages(false);	
		$value = [];

		foreach ($languages as $lang) {
            $value[$lang['id_lang']] = Tools::getValue('anab_title'.'_' . $lang['id_lang']);
        }

        Configuration::updateValue('anab_title', $value );
        $currentIndex = $this->context->link->getAdminLink('AdminAccordionBlock', false);
        $token = Tools::getAdminTokenLite('AdminAccordionBlock');		
                
        Tools::redirectAdmin($currentIndex.'&token='.$token.'&conf=4');

		return  true;
    }

	public function processSave()
    {
        if (_PS_MODE_DEMO_) {
            $this->errors[] = $this->module->textDemoMode;
            return false;
        }
  
        $object = parent::processSave();
        
        if (isset($object->id) && $object->id) {
            if (Tools::getIsset('submit'.$this->table.'AndStay')) {
                $this->redirect_after = $this->context->link->getAdminLink($this->controller_name).'&conf=4&updatean_accordion&token='.$this->token.'&id_widget='.$object->id;
            }
        }    
    }

	public function processDelete() {
		
		$object = parent::processDelete();	
		return $object;
	}	
		
    protected function updateAssoShop($id_object)
    {
        if (!Shop::isFeatureActive()) {
            return;
        }

        $assos_data = $this->getSelectedAssoShop($this->table, $id_object);

        $exclude_ids = $assos_data;

        foreach (Db::getInstance()->executeS('SELECT id_shop FROM ' . _DB_PREFIX_ . 'shop') as $row) {
            if (!$this->context->employee->hasAuthOnShop($row['id_shop'])) {
                $exclude_ids[] = $row['id_shop'];
            }
        }

        Db::getInstance()->delete($this->table . '_shop', '`' . $this->identifier . '` = ' . (int) $id_object . ($exclude_ids ? ' AND id_shop NOT IN (' . implode(', ', $exclude_ids) . ')' : ''));

        $insert = array();

        foreach ($assos_data as $id_shop) {
            $insert[] = array(
                $this->identifier => $id_object,
                'id_shop' => (int) $id_shop,
            );
        }

        return Db::getInstance()->insert($this->table . '_shop', $insert, false, true, Db::INSERT_IGNORE);
    }

    protected function getSelectedAssoShop($table)
    {
        if (!Shop::isFeatureActive()) {
            return array();
        }

        $shops = Shop::getShops(true, null, true);

        if (count($shops) == 1 && isset($shops[0])) {
            return array($shops[0], 'shop');
        }

        $assos = array();

        if (Tools::isSubmit('checkBoxShopAsso_' . $table)) {
            foreach (Tools::getValue('checkBoxShopAsso_' . $table) as $id_shop => $value) {
                $assos[] = (int) $id_shop;
            }
        } else if (Shop::getTotalShops(false) == 1) {
            // if we do not have the checkBox multishop, we can have an admin with only one shop and being in multishop
            $assos[] = (int) Shop::getContextShopID();
        }

        return $assos;
    }	
}
