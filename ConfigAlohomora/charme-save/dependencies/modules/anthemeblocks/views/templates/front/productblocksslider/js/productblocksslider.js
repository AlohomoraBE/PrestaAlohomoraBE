$(document).ready(function(){
  $('.js-anthemeblocks-product-block-slider').each(function(i, val) {
    var anhproductSlider_id = '#' + $(this).attr('id');
    let responsive_items;
    if ($(anhproductSlider_id).data('items') == 1) {
      responsive_items = {
        0: {
          items: 2,
          margin: 10
        },
        480: {
          items: 2,
          margin: 10
        },
        600: {
          items: 2,
          margin: 10
        },
        850: {
          items: 3
        },
        1200: {
          items: 4
        }
      }
    } else {
      responsive_items = {
        0: {
          items: 1
        },
        480: {
          items: 1
        },
        600: {
          items: 2
        },
        850: {
          items: 3
        },
        1200: {
          items: 4
        }
      }
    }
    $(anhproductSlider_id).owlCarouselAnTB({
      loop: $(anhproductSlider_id).data('loop'),
      nav: $(anhproductSlider_id).data('nav'),
      dots: $(anhproductSlider_id).data('dots'),
      autoplay: $(anhproductSlider_id).data('autoplay'),
      navText: ['<i class="material-icons">&#xE314;</i>','<i class="material-icons">&#xE315;</i>'],
      autoplayTimeout: $(anhproductSlider_id).data('autoplaytimeout'),
      margin: 30,
      mouseDrag: false,
      responsive: responsive_items,
    });
  });
});