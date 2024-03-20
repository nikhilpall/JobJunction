

$(document).ready(function () {

    var nav = $(".nav");

    var sticky = nav.offset().top;

    $(window).scroll(function () {
        var scrollTop = $(window).scrollTop();
        if (scrollTop > sticky) {
            nav.addClass("sticky");
        } else {
            nav.removeClass("sticky");
        }
    });
});

