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
 
require_once _PS_MODULE_DIR_ . 'an_trust_badges/classes/AnTrustBadgesIcons.php';

class AdminAntrustbadgesIconsController extends ModuleAdminController
{
    protected $_module = null;
	
	protected $position_identifier = 'icon_id';

    public function __construct()
    {
        $this->bootstrap = true;
        $this->context = Context::getContext();
        $this->table = 'an_trust_badges_icons';
        $this->identifier = 'icon_id';
        $this->className = 'AnTrustBadgesIcons';

        $this->addRowAction('edit');
        $this->addRowAction('delete');
 
		$this->name = 'AdminAntrustbadgesIconsController';
		
        parent::__construct();
		
        $this->fields_list = array(
            'icon_id' => array(
				'title' => $this->module->l('ID'), 
				'width' => 25,
				'search'  => false,
			),

            'icon_title' => array(
				'title' => $this->module->l('Title'), 
				'search'  => false,
			),		

            'file_name' => array(
				'title' => $this->module->l('Image'), 
				'search'  => false,
				'type' => 'image',
			),
			
            'type_icon' => array(
				'title' => $this->module->l('Type'), 
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
		
 		foreach ($this->_list as &$list) {

            if ($list['file_name'] !='' && Tools::file_exists_no_cache($this->module->iconsPath.$list['file_name'])) {				
				$list['file_name'] = $this->module->iconsUrl.$list['file_name'];
            }
			
			$this->context->smarty->assign([
				'file_name' => $list['file_name'],
				'type_icon' => $list['type_icon'],
				'code' => $list['code'],
			]);
			
			$list['file_name'] = $this->module->display(_PS_MODULE_DIR_.'an_trust_badges', 'views/templates/admin/list-img.tpl');
			
			if ($list['type_icon'] == '0'){
				$list['type_icon'] = $this->l('File');
			} else {
				$list['type_icon'] = $this->l('Code');
			}
			
			$list['disabled_actions'] = [];
		} 
    }		

	public function renderForm()
	{
		$this->initToolbar();
 		if (!$this->loadObject(true)) {
			return;
		} 

        if ($this->object->file_name) {
            $thumb = $this->module->iconsUrl . $this->object->file_name;
        } else {
            $thumb = '';
        }

        $this->fields_form = array(
            'tinymce' => false,
            'legend' => ['title' => $this->module->l('Trust Badges: Icons')],
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
			'name' => 'icon_title',
			'label' => $this->module->l('Title'),	
		);	
		
		$this->fields_form['input'][] = [
			'type' => 'radio',
			'label' => $this->l('Image type'),
			'name' => 'type_icon',
			'default_value' => 0,
			'values' => [
				[
					'id' => 'file',
					'value' => '0',
					'label' => $this->l('File (jpg, png, svg)')
				],
				[
					'id' => 'svg_code',
					'value' => '1',
					'label' => $this->l('Code svg'),
				],
			],
		];		
		
        $this->fields_form['input'][] = [
			'type' => 'codecssjs',
			'label' => $this->l('Code svg'),
			'name' => 'code',
			'required' => false,
			'height' => '150px',
			'classCol' => 'col-lg-12',
         ];
		

        $this->fields_form['input'][] = [
			'type' => 'file',
			'label' => $this->module->l('Image'),
			'required' => false,
			'name' => 'file_icon',
			'thumb' => $thumb,
       ];	

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
				
			if (isset($_FILES['file_icon']) && !empty($_FILES['file_icon']['tmp_name'])) {

				$ext = substr($_FILES['file_icon']['name'], strrpos($_FILES['file_icon']['name'], '.') + 1);

				$file_name = md5(uniqid()) . '.'.$ext;

				if (!move_uploaded_file($_FILES['file_icon']['tmp_name'], $this->module->iconsPath .$file_name)) {
					return $this->displayError(
						$this->trans('An error occurred while attempting to upload the file.', [], 'Admin.Notifications.Error')
						);
				} else {
					@unlink($this->module->iconsPath . $object->file_name);
					$object->file_name = $file_name;
				}

				$object->save();
			}

			// Export json
			$this->saveJsonIcons();

		}		
		
		if (Tools::getIsset('submit'.$this->table.'AndStay')) {
			$this->redirect_after = $this->context->link->getAdminLink($this->controller_name).'&conf=4&updatean_trust_badges_icons&token='.$this->token.'&icon_id='.$object->id;
		}
		
		return $object;
    }
	
	
	public function saveJsonIcons()
	{
		$icons = AnTrustBadgesIcons::getIcons();		
		@file_put_contents($this->module->iconsJson, Tools::jsonEncode($icons));
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
