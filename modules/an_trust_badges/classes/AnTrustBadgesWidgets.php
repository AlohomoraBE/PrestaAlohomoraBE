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

class AnTrustBadgesWidgets extends ObjectModel
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
    public $position;
    public $hook;
    public $class;
    public $widget_title;


    /**
     * @var array
     */
    public static $definition = array(
        'table' => 'an_trust_badges_widgets',
        'primary' => 'id_widget',
        'multilang' => true,
        'fields' => array(
            'active' => array('type' => self::TYPE_BOOL, 'validate' => 'isBool'),
            'position' => array('type' =>self::TYPE_INT ),
			'hook' => array('type' =>self::TYPE_STRING ),
            'class' => array('type' =>self::TYPE_STRING ),
            'widget_title' => array('type' =>self::TYPE_STRING,'lang' => true ),
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

	public static function getWidgets($hookName = '')
	{
		$sql = '
		SELECT * FROM `' . _DB_PREFIX_ . 'an_trust_badges_widgets` sw
		LEFT JOIN `' . _DB_PREFIX_ . 'an_trust_badges_widgets_lang` sl 
			ON (sw.`id_widget` = sl.`id_widget`
            AND sl.`id_lang` = ' . (int) Context::getContext()->language->id . ')
		WHERE sw.`active`=1 
		';	

		if ($hookName != 'all'){
			$sql .= ' AND sw.`hook`="'.pSQL($hookName).'"';
		}


		if (Shop::isFeatureActive()) {
			$sql .= ' AND sw.`id_widget` IN (
				SELECT sa.`id_widget`
				FROM `' . _DB_PREFIX_ . 'an_trust_badges_widgets_shop` sa
				WHERE sa.id_shop IN (' . implode(', ', Shop::getContextListShopID()) . ')
			)';
		}	
		
		$result = Db::getInstance(_PS_USE_SQL_SLAVE_)->executeS($sql);

        if (!$result) {
            return [];
        } else {
			return $result;
		}		
	}

    public static function getAllWidgets($hookName = 'all')
	{
		$sql = '
		SELECT * FROM `' . _DB_PREFIX_ . 'an_trust_badges_widgets` sw
		LEFT JOIN `' . _DB_PREFIX_ . 'an_trust_badges_widgets_lang` sl 
			ON (sw.`id_widget` = sl.`id_widget`
            AND sl.`id_lang` = ' . (int) Context::getContext()->language->id . ')
		WHERE sw.`active`=1 
		';	

		if ($hookName != 'all'){
			$sql .= ' AND sw.`hook`="'.pSQL($hookName).'"';
		}

		$result = Db::getInstance(_PS_USE_SQL_SLAVE_)->executeS($sql);

        if (!$result) {
            return [];
        } else {
			return $result;
		}		
	}
}
