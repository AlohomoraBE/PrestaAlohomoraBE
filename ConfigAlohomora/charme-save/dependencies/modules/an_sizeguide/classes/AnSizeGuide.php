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

class AnSizeGuideWidgets extends ObjectModel
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
	public $relation = 0;
    public $sizeguide_title;
    public $sizeguide_content;

    /**
     * @var array
     */
    public static $definition = array(
        'table' => 'an_size_guide_widgets',
        'primary' => 'id_widget',
        'multilang' => true,
        'fields' => array(
            'active' => array('type' => self::TYPE_BOOL, 'validate' => 'isBool'),
	
            'position' => array('type' =>self::TYPE_INT ),
            'relation' => array('type' =>self::TYPE_INT ),

            'sizeguide_title' => array('type' =>self::TYPE_STRING,'lang' => true ),
            'sizeguide_content' => array('type' =>self::TYPE_HTML,'lang' => true ),
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
	
	public static function getSizeGuide($id_product = 0, $cats = [])
	{
		$sql = '
		SELECT * FROM `' . _DB_PREFIX_ . 'an_size_guide_widgets_relations` szwr, `' . _DB_PREFIX_ . 'an_size_guide_widgets` sw
		LEFT JOIN `' . _DB_PREFIX_ . 'an_size_guide_widgets_lang` sl 
			ON (sw.`id_widget` = sl.`id_widget`
            AND sl.`id_lang` = ' . (int) Context::getContext()->language->id . ')
		WHERE sw.`active`=1
			AND sw.`id_widget` = szwr.`widget` AND sw.`relation` = szwr.`type`
			AND ((szwr.`type` = 1 AND szwr.`id_type` IN (' . implode(', ', $cats) . ')   )
				OR (szwr.`type` = 2 AND szwr.`id_type` = '.(int) $id_product.')
				OR (szwr.`type` = 0 AND szwr.`id_type` = 0)
				)
				
		';	
	
		if (Shop::isFeatureActive()) {
			$sql .= ' AND sw.`id_widget` IN (
				SELECT sa.`id_widget`
				FROM `' . _DB_PREFIX_ . 'an_size_guide_widgets_shop` sa
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
		
	
}
