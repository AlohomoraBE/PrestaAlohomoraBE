$(document).ready(function() {
    var elementHeight, containerHeight, scrollHeightStart, scrollHeightEnd, fixedmenuSize;
    $(window).on('load', function() {
        containerHeight = $('.sticky-product-row').height();
        elementHeight = $('.sticky-product').height();
        scrollHeightStart = $('.sticky-product').offset().top - 10;
        scrollHeightEnd = scrollHeightStart + containerHeight - elementHeight;
    });
    $(window).on('load resize scroll', function() {
        fixedmenuSize = $('.fixed-menu').height();
        if ($(window).width() >= 768 && $(window).scrollTop() > scrollHeightStart - fixedmenuSize && $(window).scrollTop() < scrollHeightEnd - fixedmenuSize) {
            $('.sticky-product').removeClass('sticky-product-bottom');
            $('.sticky-product').addClass('sticky-product-fixed');
            $('.sticky-product').css('top', 10 + fixedmenuSize + 'px');
        } else if ($(window).width() >= 768 && $(window).scrollTop() > scrollHeightStart - fixedmenuSize && $(window).scrollTop() >= scrollHeightEnd - fixedmenuSize) {
            $('.sticky-product').removeClass('sticky-product-fixed');
            $('.sticky-product').addClass('sticky-product-bottom');
            $('.sticky-product').css('top', 0);
        } else {
            $('.sticky-product').removeClass('sticky-product-bottom').removeClass('sticky-product-fixed');
            $('.sticky-product').css('top', 0);
        }
    });
});
