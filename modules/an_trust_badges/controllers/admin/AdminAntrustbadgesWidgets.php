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
 
require_once _PS_MODULE_DIR_ . 'an_trust_badges/classes/AnTrustBadgesWidgets.php';

class AdminAntrustbadgesWidgetsController extends ModuleAdminController
{
    protected $_module = null;
	
	protected $position_identifier = 'id_widget';

    public function __construct()
    {
        $this->bootstrap = true;
        $this->context = Context::getContext();
        $this->table = 'an_trust_badges_widgets';
        $this->identifier = 'id_widget';
        $this->className = 'AnTrustBadgesWidgets';
		$this->lang = true;

		
        $this->addRowAction('edit');
        $this->addRowAction('delete');
 
		$this->name = 'AdminAntrustbadgesWidgetsController';
		
        parent::__construct();
		
        $this->fields_list = array(
            'id_widget' => array(
				'title' => $this->module->l('ID'), 
				'width' => 25,
				'search'  => false,
			),

            'widget_title' => array(
				'title' => $this->module->l('Title'), 
				'search'  => false,
			),		

            'hook' => array(
				'title' => $this->module->l('Hook'), 
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
		return $this->module->topPromo() .  parent::renderList();
	} 
	
    public function getList($id_lang, $order_by = null, $order_way = null, $start = 0, $limit = null, $id_lang_shop = false)
    {
        parent::getList($id_lang, $order_by, $order_way, $start, $limit, $id_lang_shop);
		
/* 		foreach ($this->_list as &$list) {
			switch ($list['relation']){
				case 1:
					$list['relation'] = $this->module->l('Categories');
					break;		

				case 2:
					$list['relation'] = $this->module->l('Products');
					break;	
					
				default:
					$list['relation'] = $this->module->l('all');
			}
		} */
    }		

	public function renderForm()
	{
		$this->initToolbar();
 		if (!$this->loadObject(true)) {
			return;
		} 
		
        $this->fields_form = array(
            'tinymce' => false,
            'legend' => ['title' => $this->module->l('Trust Badges: Widgets')],
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
			'type' => 'select',
			'name' => 'hook',
			'label' => $this->module->l('Select hook'),
			'options' => array(
				'query' => $this->module->getHooksQuery(),
				'id' => 'name',
				'name' => 'name'
			),	
		);		
		

		$this->fields_form['input'][] = array(
			'col' => 6,
			'type' => 'text',
			'name' => 'widget_title',
			'label' => $this->module->l('Title'),	
			'lang' => true,
		);	

		$this->fields_form['input'][] = array(
			'col' => 6,
			'type' => 'text',
			'name' => 'class',
			'label' => $this->module->l('CSS class'),	
		);

		if (Shop::isFeatureActive()) {
			$this->fields_form['input'][] = [
				'required' => true,
				'type' => 'shop',
				'label' => $this->l('Shop association'),
				'name' => 'checkBoxShopAsso',
			];
		}
		
		return $this->module->topPromo() . parent::renderForm();
	}
  
	
    public function processSave()
    {
        
		if (!empty($this->errors)) {
			// if we have errors, we stay on the form instead of going back to the list
			$this->display = 'edit';
			return false;
		}

		$object = parent::processSave();
		
        if (isset($object->id) && $object->id) {
			
			$this->module->registerHook($object->hook);
		}		
		
		// Export json
		$this->saveJsonIcons();		
		
		if (Tools::getIsset('submit'.$this->table.'AndStay')) {
			$this->redirect_after = $this->context->link->getAdminLink($this->controller_name).'&conf=4&updatean_trust_badges_widgets&token='.$this->token.'&id_widget='.$object->id;
		}
		
		return $object;
    }
	
	public function saveJsonIcons()
	{
		$widgets = AnTrustBadgesWidgets::getWidgets('all');	
		@file_put_contents($this->module->iconsWidgets, Tools::jsonEncode($widgets));
	}	
	
	public function getProducsByIdWidget($widget = 0)
	{
		if (!$widget){
			return [];
		}
		
		$sql = '
		SELECT  *, p.*
		FROM `' . _DB_PREFIX_ . 'an_size_guide_widgets_relations` awl
		
        LEFT JOIN `' . _DB_PREFIX_ . 'product` p
            ON (p.`id_product` = awl.`id_type`)
		
		LEFT JOIN `' . _DB_PREFIX_ . 'product_lang` pl
            ON (p.`id_product` = pl.`id_product`
            AND pl.`id_lang` = ' . (int) Context::getContext()->language->id . Shop::addSqlRestrictionOnLang('pl') . ')		
		
		WHERE awl.`widget` = ' . (int) $widget . '  AND awl.`type`="2" ';
		
		
		$result = Db::getInstance(_PS_USE_SQL_SLAVE_)->executeS($sql, true, false);

		return Product::getProductsProperties(Context::getContext()->language->id, $result);
	}

	public function processDelete() {
		
		$object = parent::processDelete();
		
		if (isset($object->id) && $object->id) {

			// при удалении открепление от хуков нужно
		}
		
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
