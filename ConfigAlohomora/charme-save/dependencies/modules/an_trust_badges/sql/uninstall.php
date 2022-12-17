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

$sql[] = 'DROP TABLE IF EXISTS `' . _DB_PREFIX_ . 'an_trust_badges_widgets`';
$sql[] = 'DROP TABLE IF EXISTS `' . _DB_PREFIX_ . 'an_trust_badges_widgets_lang`';
$sql[] = 'DROP TABLE IF EXISTS `' . _DB_PREFIX_ . 'an_trust_badges_widgets_shop`';
$sql[] = 'DROP TABLE IF EXISTS `' . _DB_PREFIX_ . 'an_trust_badges_icons`';
$sql[] = 'DROP TABLE IF EXISTS `' . _DB_PREFIX_ . 'an_trust_badges_icons_shop`';

return $sql;