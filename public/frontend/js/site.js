$(document).ready(function () {
    // Tooltip
    $('[data-bs-toggle="tooltip"]').tooltip();


    // Feather Icons
    feather.replace();

    // Select 2
    $('.js-basic-single').select2();


    // Fixed Navbar On Scroll
    $(document).ready(function () {
        if ($(window).width() < 1920) {
            var navbar_height = $('.navbar').outerHeight();
            $(window).scroll(function () {
                if ($(this).scrollTop() > 300) {
                    $('.navbar-wrap').css('height', navbar_height + 'px');
                    $('#navbar_top').addClass("fixed-top");
                }
                else {
                    $('#navbar_top').removeClass("fixed-top");
                    $('.navbar-wrap').css('height', 'auto');
                }
            });
        }
    });


    // Home Slider
    $('.home-slider').owlCarousel({
        loop: true,
        margin: 0,
        nav: false,
        dots: false,
        navText: ["<iconify-icon icon='bytesize:chevron-left' style='color:white;font-size:40px;'></iconify-icon>", "<iconify-icon icon='bytesize:chevron-right' style='color:white;font-size:40px;'></iconify-icon>"],
        items: 1,
        mouseDrag: true,
        // animateOut: 'fadeOut',
        // animateIn: 'flipInX',
        autoplay: true,
        autoplayTimeout: 5000,
        autoplayHoverPause: true,
    })


    // Testimonials Slider
    $('.testimonials-slider').owlCarousel({
        loop: true,
        margin: 50,
        nav: false,
        dots: false,
        autoplay: true,
        autoplayTimeout: 5000,
        autoplayHoverPause: true,
        responsive:{
            0:{
                items:1
            },
            600:{
                items:1
            },
            1000:{
                items:3
            }
        }
    })

    // Back to top
    var btn = $('.back-to-top');
    $(window).scroll(function () {
        if ($(window).scrollTop() > 300) {
            btn.addClass('show');
        } else {
            btn.removeClass('show');
        }
    });
    btn.on('click', function (e) {
        e.preventDefault();
        $('html, body').animate({ scrollTop: 0 }, '300');
    });



    $("#checkin_date").datepicker({
        dateFormat: 'yy-mm-dd',
        minDate: new Date(),
        maxDate: 30,
    });

    $("#checkout_date").datepicker({
        dateFormat: 'yy-mm-dd',
        minDate: new Date(),
        maxDate: 30,
    });

    $("#date_of_birth").datepicker({
        dateFormat: 'yy-mm-dd',
    });



    $('.page-details-carousel').owlCarousel({
        loop: true,
        margin: 10,
        nav: true,
        dots: true,
        items: 1,
        autoplay: true,
        autoplayTimeout: 3000,
        autoplayHoverPause: true,
    });



    $(function () {
        thisyear = new Date().getFullYear();
        $('.copyright-year').text(thisyear);
    });



    $('#play-video').on('click', function(e){
        e.preventDefault();
        $('#video-overlay').addClass('open');
        // $("#video-overlay").append('<iframe width="750" height="400" src="https://www.youtube.com/embed/iVonflANsqs" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>');
        $("#video-overlay").append('<video width="750" height="400" controls><source src="frontend/video/the_zabeer_dhaka_promo.mp4" type="video/mp4"></video>');
      });
      
      $('.video-overlay, .video-overlay-close').on('click', function(e){
        e.preventDefault();
        close_video();
      });
      
      $(document).keyup(function(e){
        if(e.keyCode === 27) { close_video(); }
      });
      
      function close_video() {
        $('.video-overlay.open').removeClass('open').find('iframe').remove();
    };
});


