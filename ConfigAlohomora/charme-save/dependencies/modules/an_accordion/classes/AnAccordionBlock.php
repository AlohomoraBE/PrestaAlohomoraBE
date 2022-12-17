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

class AnAccordionBlock extends ObjectModel
{
    /**
     * @var int
     */
    public $id_widget;
    /**
     * @var int
     */
    public $id;
    /**
     * @var int
     */
    public $active = 1;

    public $accordion_title;
    public $accordion_content;

    /**
     * @var array
     */
    public static $definition = array(
        'table' => 'an_accordion',
        'primary' => 'id_widget',
        'multilang' => true,
        'fields' => array(
            'active' => array('type' => self::TYPE_BOOL, 'validate' => 'isBool'),

            'accordion_title' => array('type' =>self::TYPE_STRING,'lang' => true ),
            'accordion_content' => array('type' =>self::TYPE_HTML,'lang' => true ),
        ),
    );

    /**
     * Formula constructor.
     *
     * @param null $id
     */
    
    public function __construct($id = null)
    {
        parent::__construct($id);
    }
    
    public static function getAccordion()
    {
        $sql = 'SELECT * FROM `' . _DB_PREFIX_ . 'an_accordion` aa
        LEFT JOIN `' . _DB_PREFIX_ . 'an_accordion_lang` aal
        ON (aal.`id_widget` = aa.`id_widget` 
        AND aal.`id_lang` = '.(int) Context::getContext()->language->id.' )
        WHERE  aa.`active` = 1 '; 
        
        if (Shop::isFeatureActive()) {
			$sql .= ' AND aut.`id_widget` IN (
				SELECT aas.`id_widget`
				FROM `' . _DB_PREFIX_ . 'an_accordion_shop` aas
				WHERE aas.id_shop IN (' . implode(', ', Shop::getContextListShopID()) . ')
			)';
		}

        return Db::getInstance(_PS_USE_SQL_SLAVE_)->executeS($sql);         
    }    
}
