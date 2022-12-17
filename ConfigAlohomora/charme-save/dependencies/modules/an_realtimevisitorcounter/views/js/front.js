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
$(document).ready(function () {
    const visitorsBlock = $('.an_realtimevisitorcounter-block');
    const visitorsCountBlock = visitorsBlock.find('.an_realtimevisitorcounter-counter');
    const minValueVisitors = parseInt(visitorsBlock.data('min-value'));
    const maxValueVisitors = parseInt(visitorsBlock.data('max-value'));
    const strokeValueVisitors = parseInt(visitorsBlock.data('stroke-value'));
    const minIntervalUpdate = parseInt(visitorsBlock.data('min-interval'));
    const maxIntervalUpdate = parseInt(visitorsBlock.data('max-interval'));
    const currentValue = +visitorsCountBlock.text();
    let refreshIntervalId;
    clearInterval(refreshIntervalId);

    refreshIntervalId = setInterval(function(){
        let visitorsCount = getRandomInt(minValueVisitors, maxValueVisitors);
        if (Math.abs(currentValue - visitorsCount) > strokeValueVisitors) {
            visitorsCount = visitorsCount > currentValue ? currentValue + strokeValueVisitors : currentValue - strokeValueVisitors;
            visitorsCount = getRandomInt(currentValue, visitorsCount);

        }
        visitorsCountBlock.text(visitorsCount);
    }, getRandomInt(minIntervalUpdate, maxIntervalUpdate) * 1000);

    function getRandomInt(min, max) {
        return Math.floor(Math.random() * (max - min)) + min;
    }
});
