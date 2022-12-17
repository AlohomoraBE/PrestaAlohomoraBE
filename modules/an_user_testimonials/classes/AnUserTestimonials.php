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

class AnUserTestimonials extends ObjectModel
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

    public $file_name;
    public $testimonial_title;
    public $testimonial_content;

    /**
     * @var array
     */
    public static $definition = array(
        'table' => 'an_user_testimonials',
        'primary' => 'id_widget',
        'multilang' => true,
        'fields' => array(
            'active' => array('type' => self::TYPE_BOOL, 'validate' => 'isBool'),

            'file_name' => array('type' =>self::TYPE_STRING ),
            'testimonial_title' => array('type' =>self::TYPE_STRING,'lang' => true ),
            'testimonial_content' => array('type' =>self::TYPE_HTML,'lang' => true ),
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
    
    public static function getUserTestimonials()
    {
        $sql = 'SELECT * FROM `' . _DB_PREFIX_ . 'an_user_testimonials` aut
        LEFT JOIN `' . _DB_PREFIX_ . 'an_user_testimonials_lang` autl
        ON (autl.`id_widget` = aut.`id_widget` 
        AND autl.`id_lang` = '.(int) Context::getContext()->language->id.' )
        WHERE  aut.`active` = 1 '; 
        
        if (Shop::isFeatureActive()) {
			$sql .= ' AND aut.`id_widget` IN (
				SELECT uts.`id_widget`
				FROM `' . _DB_PREFIX_ . 'an_user_testimonials_shop` uts
				WHERE uts.id_shop IN (' . implode(', ', Shop::getContextListShopID()) . ')
			)';
		}

        return Db::getInstance(_PS_USE_SQL_SLAVE_)->executeS($sql);         
    }    
}
