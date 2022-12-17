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
$(document).ready(function(){
	// open modal
    

    $(document).on('click', '.usertestimonials-del-img-bt', function(event) {

        $('.usertestimonials-input-del').val(1);
        console.log(document.querySelector("#file_icon-images-thumbnails > div > img").getAttribute('src'));
        
        $(document.querySelector("#file_icon-images-thumbnails").remove());
            
        $('.usertestimonials-input-del').val(1);

        alert('Delete image?');
        console.log($( '.usertestimonials-input-del' ).val());
 

    });

    
    
});