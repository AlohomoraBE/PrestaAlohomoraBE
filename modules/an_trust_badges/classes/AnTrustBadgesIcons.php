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

class AnTrustBadgesIcons extends ObjectModel
{
    /**
     * @var int
     */
    public $icon_id;
    /**
     * @var int
     */
    public $id;
    /**
     * @var int
     */
    public $active = 1;
    public $position;
	
    public $icon_title;
    public $file_name;
    public $code;
    public $type_icon = 0;


    /**
     * @var array
     */
    public static $definition = array(
        'table' => 'an_trust_badges_icons',
        'primary' => 'icon_id',
        'multilang' => false,
        'fields' => array(
            'active' => array('type' => self::TYPE_BOOL, 'validate' => 'isBool'),
            'position' => array('type' =>self::TYPE_INT ),
			'icon_title' => array('type' =>self::TYPE_STRING ),
			'file_name' => array('type' =>self::TYPE_STRING ),
			'code' => array('type' =>self::TYPE_HTML ),
            'type_icon' => array('type' =>self::TYPE_INT ),
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
	
	public static function getIcons()
	{
		$sql = '
		SELECT * FROM `' . _DB_PREFIX_ . 'an_trust_badges_icons` sw
		WHERE sw.`active`=1
		';	
	
		if (Shop::isFeatureActive()) {
			$sql .= ' AND sw.`icon_id` IN (
				SELECT sa.`icon_id`
				FROM `' . _DB_PREFIX_ . 'an_trust_badges_icons_shop` sa
				WHERE sa.id_shop IN (' . implode(', ', Shop::getContextListShopID()) . ')
			)';
		}	
		
		$result = Db::getInstance(_PS_USE_SQL_SLAVE_)->executeS($sql);

        if ($result) {
			return $result;
		}	
		
		return [];
	}
	
	public static function getAllIcons()
	{
        $sql = 'SELECT * FROM `' . _DB_PREFIX_ . 'an_trust_badges_icons` sw';	

		$result = Db::getInstance(_PS_USE_SQL_SLAVE_)->executeS($sql);

        if ($result) {
			return $result;
		}	
		
		return [];
	}	
	
}
