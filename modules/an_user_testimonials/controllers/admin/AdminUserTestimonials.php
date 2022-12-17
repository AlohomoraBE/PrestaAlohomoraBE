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
 
require_once _PS_MODULE_DIR_ . 'an_user_testimonials/classes/AnUserTestimonials.php';

class AdminUserTestimonialsController extends ModuleAdminController
{
    protected $_module = null;
	
	protected $position_identifier = 'id_widget';

    public function __construct()
    {
        $this->bootstrap = true;
        $this->context = Context::getContext();
        $this->table = 'an_user_testimonials';
        $this->identifier = 'id_widget';
        $this->className = 'AnUserTestimonials';
		$this->lang = true;
	
        $this->addRowAction('edit');
        $this->addRowAction('delete');
 
		$this->name = 'AdminUserTestimonialsController';
		
        parent::__construct();
		
        $this->fields_list = array(
            'id_widget' => array(
				'title' => $this->module->l('ID'), 
				'width' => 25,
				'search'  => false,
			),

            'file_name' => array(
                'title' => $this->module->l('Image'), 
                'search'  => false,
                'type' => 'image',
            ),
            
            'testimonial_title' => array(
				'title' => $this->module->l('Name'), 
				'search'  => false,
			),	
            
            'testimonial_content' => array(
				'title' => $this->module->l('Title'), 
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
    	
    public function setMedia( $isNewTheme = false ) {
        parent::setMedia();

        $this->addJquery();

        $this->js_files[] = $this->module->modulePath . 'views/js/back.js';
        $this->css_files[$this->module->modulePath . 'views/css/back.css'] = 'all';    
    }

 	public function renderList()
	{
		return $this->module->topPromo() .  parent::renderList();
	} 
    
    public function getList($id_lang, $order_by = null, $order_way = null, $start = 0, $limit = null, $id_lang_shop = false)
    {
        parent::getList($id_lang, $order_by, $order_way, $start, $limit, $id_lang_shop);

        foreach ($this->_list as &$list) {
            $list['testimonial_content'] = strip_tags($list['testimonial_content']);

            if ($list['file_name'] !='' && Tools::file_exists_no_cache($this->module->iconsPath.$list['file_name'])) {              
                $list['file_name'] = $this->module->iconsUrl.$list['file_name'];
            }
            
            $this->context->smarty->assign([
                'file_name' => $list['file_name'],
            ]);

            $list['file_name'] = $this->module->display(_PS_MODULE_DIR_.'an_user_testimonials', 'views/templates/admin/list-img.tpl'); 
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
            'legend' => ['title' => $this->module->l('User testimonials')],
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
            'type' => 'file',
            'label' => $this->module->l('Image'),
            'required' => false,
            'name' => 'file_icon',
            'thumb' => $thumb,
        ); 

		$this->fields_form['input'][] = array(
			'col' => 6,
			'type' => 'text',
			'name' => 'testimonial_title',
			'label' => $this->module->l('Title'),	
			'lang' => true,
		);	

		$this->fields_form['input'][] = array(
			'type' => 'textarea',
			'class' => 'autoload_rte',
			'name' => 'testimonial_content',
			'label' => $this->module->l('Content'),
			'lang' => true		
		);			

		return $this->module->topPromo() . parent::renderForm();
	}
  
	public function processSave()
    {
        if (_PS_MODE_DEMO_) {
            $this->errors[] = $this->module->textDemoMode;
            return false;
        }
          
        $object = parent::processSave();
        
        if (isset($object->id) && $object->id) {
                
            if(tools::getValue('image') == 1){ 
                
                @unlink($this->module->iconsPath. $object->file_name);
                $object->file_name = '';
                $object->save();
            } 

            if (isset($_FILES['file_icon']) && !empty($_FILES['file_icon']['tmp_name'])) {

                $ext = substr($_FILES['file_icon']['name'], strrpos($_FILES['file_icon']['name'], '.') + 1);
                $file_name = md5(uniqid()) . '.'.$ext;
                 
                if (!move_uploaded_file($_FILES['file_icon']['tmp_name'],  $this->module->iconsPath.$file_name)) {
                    return $this->displayError(
                                $this->trans('An error occurred while attempting to upload the file.', [], 'Admin.Notifications.Error')
                                );
                } else {
                    @unlink($this->module->iconsPath . $object->file_name);
                    $object->file_name = $file_name;                
                }
                    
                $object->save();
            }

            if (Tools::getIsset('submit'.$this->table.'AndStay')) {
                $this->redirect_after = $this->context->link->getAdminLink($this->controller_name).'&conf=4&updatean_user_testimonials&token='.$this->token.'&id_widget='.$object->id;
            }
        }    
    }


	public function processDelete() {
		
		$object = parent::processDelete();
		
		if (isset($object->id) && $object->id) {
            unlink($this->module->iconsPath. $object->file_name);	
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
