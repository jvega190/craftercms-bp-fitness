'use strict';

(function ($) {

  const isAuthoring = $('html').attr('data-craftercms-preview') === 'true';
  let $carousel;
  let owlSelector = '#owl-testimonial';
  let isEditMode;

  /* Hide pre-loader */
  $(window).on('load', function () {
    $('.preloader').fadeOut(1000);
  });

  /* HTML document is loaded. DOM is ready.
  -------------------------------------------*/
  $(document).ready(function () {

    /* template navigation
    -----------------------------------------------*/
    $('.main-navigation').onePageNav({
      scrollThreshold: 0.2, // Adjust if Navigation highlights too early or too late
      scrollOffset: 75, //Height of Navigation Bar
      filter: ':not(.external)', changeHash: true
    });

    /* Navigation visible on Scroll */
    mainNav();

    $(window).scroll(mainNav);

    /* Hide mobile menu after clicking on a link */
    $('.navbar-collapse a').click(function () {
      $('.navbar-collapse').collapse('hide');
    });

    /*  smoothscroll */
    $('.navbar-default a, #home a, #overview a').bind('click', function (event) {
      const isIceOn = Boolean(document.querySelector('.craftercms-ice-on'));
      const isIceBypass = Boolean(document.querySelector('.craftercms-ice-bypass'));

      if (!isIceOn || isIceBypass) {
        var $anchor = $(this);
        $('html, body').stop().animate({
          scrollTop: $($anchor.attr('href')).offset().top - 49
        }, 1000);
      }
      event.preventDefault();
    });

    initParallax();

    /* home slider section */
    const mediaBannerImagesDOM = $('#mediaBannerImages');
    let mediaBannerImageArray;
    const mediaBannerImagesValue = mediaBannerImagesDOM.attr('data-media-banner-images');
    if (mediaBannerImagesValue) {
      mediaBannerImageArray = mediaBannerImagesValue.split(',');
      $('#home').backstretch(mediaBannerImageArray, { duration: 2000, fade: 750 });
    }

    if (isAuthoring) {
      document.addEventListener('craftercms.editMode', (e) => {
        isEditMode = e.detail;
        if (isEditMode) {
          // Destroy carousel
          destroyOwl();
        } else {
          // Create carousel
          const $tmpl = $('#owlTestimonialsTemplate');
          $carousel = $(owlSelector);
          $carousel.html($tmpl.html());
          initOwl();
        }
      });
    } else {
      initOwl();
    }

    new WOW({ mobile: false }).init();

  });

  $('form').submit(function (event) {
    event.preventDefault();
    if (!this.checkValidity()) {
      // If the form is invalid, submit it. The form won't actually submit;
      // this will just cause the browser to display the native HTML5 error messages.
      this.find('input[type=submit]').click();
    } else {
      const values = $(this).serialize();
      $.ajax({
        type: this.method,
        url: this.action,
        data: values,
        success(data) {
          if (data.success) {
            new bootstrap.Modal('#modal-transparent').show();
            $('#form-submit')[0].reset();
          } else {
            // Todo: Add error handling...
            alert('Error subscribing to newsletter.');
          }
        },
        error(response) {
          // Todo: Add error handling...
          alert('Error subscribing to newsletter.');
        }
      });
    }
  });

  function mainNav() {
    const top = (document.documentElement && document.documentElement.scrollTop) || document.body.scrollTop;
    if (top > 40) {
      $('.sticky-navigation').stop().animate({
        'opacity': '1', 'top': '0'
      });
    } else {
      $('.sticky-navigation').stop().animate({
        'opacity': '0', 'top': '-75'
      });
    }
  }

  function initParallax() {
    $('#home').parallax('100%', 0.1);
    $('#overview').parallax('100%', 0.3);
    $('#trainer').parallax('100%', 0.2);
    $('#newsletter').parallax('100%', 0.3);
    $('.catalog-section').parallax('100%', 0.1);
    $('.quotes-section').parallax('100%', 0.2);
  }

  function initOwl() {
    $carousel = $(owlSelector).owlCarousel({
      autoplay: true,
      autoplayTimeout: 5000,
      autoplayHoverPause: true,
      items: 1,
      loop: true,
      nav: true
    });
  }

  function destroyOwl() {
    const hasOwl = $(owlSelector).data('owl.carousel');
    if (hasOwl) {
      $carousel.owlCarousel('destroy');
    }
    return Boolean(hasOwl);
  }

})(window.jQuery);
