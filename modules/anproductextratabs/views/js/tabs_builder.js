(function ($) {
    $(document).ready(function () {
        if (tab_type) {
            switch (tab_type) {
                case 'tabs':
                    console.log('tabs');
                    $('.tabs .nav-link').click(function () {
                        $('.tabs .nav-link').css('background-color', CONFIG_BACK_COLOR + '!important');
                        $('.tabs .nav-link').css('color', CONFIG_FONT_COLOR + '!important');
                        $(this).css('background-color', CONFIG_SELECTED_BACK_COLOR + '!important');
                        $(this).css('color', CONFIG_SELECTED_FONT_COLOR + '!important');
                    });
                    $('.tabs .nav-link').eq(0).click();
                    break;

                case 'blocks':
                    console.log('blocks');
                    $('.tabs').hide();
                    var length = $('.tabs .nav-tabs .nav-item').length;
                    var tabsdiv = $('ul.nav-tabs').parent();
                    var html = '';
                    for (var i = 0; i < length; i++) {
                        html +=
                            '<div class="card">\n' +
                            '  <div class="card-header">\n' +
                            $('.tabs .nav-tabs .nav-item').eq(i).find('.nav-link').text() + '\n' +
                            '  </div>\n' +
                            '  <div class="card-body">\n' +
                            $('.tabs .tab-pane').eq(i).html() +
                            '  </div>\n' +
                            '</div>';
                    }

                    tabsdiv.replaceWith(html);
                    $('.card-header').css('background-color', CONFIG_BACK_COLOR + '!important');
                    $('.card-header').css('color', CONFIG_FONT_COLOR + '!important');
                    //$('.tabs').remove();
                    break;

                case 'accordion':
                    console.log('accordion');
                    //$('.tabs').hide();
                    var length = $('.tabs .nav-tabs .nav-item').length;
                    var html  = '<div id="accordion">';
                    var collapsed = 'in';
                    var col = 'collapsed';
                    var expanded  = 'true';
                    var tabsdiv = $('ul.nav-tabs').parent();
                    for (var i = 0; i < length; i++) {
                        if (i != 0 ) {
                            collapsed = '';
                            col = '';
                            expanded = 'false';
                        }
                        html += '<div class="card">\n' +
                            '  <div class="card-header">\n' +
                            '  <button class="btn btn-link accordion-toggle ' + col + '" data-toggle="collapse" data-target="#collapse' + i + '" aria-expanded="' + expanded + '" aria-controls="collapse' + i + '">\n' +
                            '<i class="material-icons expand_more">expand_more</i>' +
                            $('.tabs .nav-tabs .nav-item').eq(i).find('.nav-link').text() + '\n' +
                            '  </button>\n' +
                            '  </div>\n' +
                            '   <div id="collapse' + i + '" class="collapse show ' + collapsed + '" aria-expanded="' + expanded + '" aria-labelledby="heading' + i + '" data-parent="#accordion">\n' +
                            '  <div class="card-body">\n'
                            + $('.tabs .tab-pane').eq(i).html() +
                            '  </div>\n' +
                            '  </div>\n' +
                            '</div>';
                    }
                    html += '</div>';
                    tabsdiv.replaceWith(html);
                    //$('.tabs').after(html);
                    $('#accordion').collapse('show');
                    $('.card-header').css('background-color', CONFIG_BACK_COLOR + '!important');
                    $('.card-header button').css('color', CONFIG_FONT_COLOR + '!important');
                    $('#accordion .card-header').eq(0).find('.btn').addClass('active');
                    $('#accordion .card-header').eq(0).find('.expand_more').text('expand_less');
                    $('#accordion .card-header').eq(0).css('background-color', CONFIG_SELECTED_BACK_COLOR + '!important');
                    $('#accordion .card-header button').eq(0).css('color', CONFIG_SELECTED_FONT_COLOR + '!important');
                    //$('.tabs').remove();
                    $('#accordion .card-header .btn').click(function(){
                        if($(this).hasClass('active')) {
                            $(this).removeClass('active');
                            $('.expand_more',this).text('expand_more');
                            $('.card-header').css('background-color', CONFIG_BACK_COLOR + '!important');
                            $('.card-header button').css('color', CONFIG_FONT_COLOR + '!important');
                        } else {
                            $('#accordion .card-header .btn').removeClass('active');
                            $('#accordion .card-header .btn .expand_more').text('expand_more');
                            $('.expand_more',this).text('expand_less');
                            $(this).addClass('active');
                            $('.card-header').css('background-color', CONFIG_BACK_COLOR + '!important');
                            $('.card-header button').css('color', CONFIG_FONT_COLOR + '!important');
                            $(this).parent().css('background-color', CONFIG_SELECTED_BACK_COLOR + '!important');
                            $(this).css('color', CONFIG_SELECTED_FONT_COLOR + '!important');
                        }
                    });

                    break;
            }
        }

    });
})(jQuery);
