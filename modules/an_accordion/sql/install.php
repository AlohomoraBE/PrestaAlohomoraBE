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

if (!defined('_PS_VERSION_')) {
    exit;
}

$sql = [];

$sql[] = 'CREATE TABLE IF NOT EXISTS `' . _DB_PREFIX_ . 'an_accordion` (
            `id_widget` int(10) unsigned NOT NULL AUTO_INCREMENT,
            `active` tinyint(1) unsigned NOT NULL DEFAULT 1,
            PRIMARY KEY(`id_widget`)
        ) ENGINE = ' . _MYSQL_ENGINE_ . ' DEFAULT CHARSET = utf8';

$sql[] = 'CREATE TABLE IF NOT EXISTS `' . _DB_PREFIX_ . 'an_accordion_lang` (
            `id_widget` int(10) unsigned NOT NULL,
			`accordion_title` varchar(255) NOT NULL,
            `accordion_content` text,
            `id_lang` varchar(255) NOT NULL,
            PRIMARY KEY(`id_widget`, `id_lang`)
        ) ENGINE = ' . _MYSQL_ENGINE_ . ' DEFAULT CHARSET = utf8';

$sql[] = 'CREATE TABLE IF NOT EXISTS `'._DB_PREFIX_.'an_accordion_shop` (
			`id_widget` int(10) unsigned NOT NULL,
			`id_shop` int(10) unsigned NOT NULL,
			PRIMARY KEY (`id_widget`, `id_shop`)
		) ENGINE='._MYSQL_ENGINE_.' DEFAULT CHARSET=utf8;';

return $sql;