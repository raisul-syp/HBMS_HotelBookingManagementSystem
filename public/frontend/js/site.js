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
        animateOut: 'fadeOut',
        animateIn: 'flipInX',
        autoplay: false,
        autoplayTimeout: 4000,
    })


    // Testimonials Slider
    $('.testimonials-slider').owlCarousel({
        loop: true,
        margin: 50,
        nav: true,
        dots: false,
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



    $('.page-details-carousel').owlCarousel({
        loop: true,
        margin: 10,
        nav: true,
        dots: true,
        items: 1,
        autoplay: true,
        autoplayTimeout: 3000,
        autoplayHoverPause: true,
    })
});


