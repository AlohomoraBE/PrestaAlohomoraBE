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

$sql = [];

$sql[] = 'CREATE TABLE IF NOT EXISTS `' . _DB_PREFIX_ . 'an_trust_badges_icons` (
            `icon_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
            `active` tinyint(1) unsigned NOT NULL DEFAULT 1,
			`position` int(10) NOT NULL,
			
			`icon_title` varchar(255) NOT NULL,
			`file_name` varchar(150) NOT NULL,
			`code` text NOT NULL,

			
			`type_icon` int(10) NOT NULL,

            PRIMARY KEY(`icon_id`)
        ) ENGINE = ' . _MYSQL_ENGINE_ . ' DEFAULT CHARSET = utf8';

        $sql[] = 'CREATE TABLE IF NOT EXISTS `'._DB_PREFIX_.'an_trust_badges_icons_shop` (
			`icon_id` int(10) unsigned NOT NULL,
			`id_shop` int(10) unsigned NOT NULL,
			PRIMARY KEY (`icon_id`, `id_shop`)
		) ENGINE='._MYSQL_ENGINE_.' DEFAULT CHARSET=utf8;';

$sql[] = 'CREATE TABLE IF NOT EXISTS `' . _DB_PREFIX_ . 'an_trust_badges_widgets` (
            `id_widget` int(10) unsigned NOT NULL AUTO_INCREMENT,
            `active` tinyint(1) unsigned NOT NULL DEFAULT 1,
			`position` int(10) NOT NULL,
			`hook` varchar(255) NOT NULL,
			`class` varchar(255) NOT NULL,
            PRIMARY KEY(`id_widget`)
        ) ENGINE = ' . _MYSQL_ENGINE_ . ' DEFAULT CHARSET = utf8';
		
$sql[] = 'CREATE TABLE IF NOT EXISTS `' . _DB_PREFIX_ . 'an_trust_badges_widgets_lang` (
            `id_widget` int(10) unsigned NOT NULL,
			`widget_title` varchar(255) NOT NULL,
            `id_lang` varchar(255) NOT NULL,
            PRIMARY KEY(`id_widget`, `id_lang`)
        ) ENGINE = ' . _MYSQL_ENGINE_ . ' DEFAULT CHARSET = utf8';
		
$sql[] = 'CREATE TABLE IF NOT EXISTS `'._DB_PREFIX_.'an_trust_badges_widgets_shop` (
			`id_widget` int(10) unsigned NOT NULL,
			`id_shop` int(10) unsigned NOT NULL,
			PRIMARY KEY (`id_widget`, `id_shop`)
		) ENGINE='._MYSQL_ENGINE_.' DEFAULT CHARSET=utf8;';

return $sql;