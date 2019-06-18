$('.navTrigger').click(function () {
    $(this).toggleClass('active');
    $("#mainListDiv").toggleClass("show_list");
    $("#mainListDiv").fadeIn();

});

$(function() {
    $('.footer-links-holder h3').click(function () {
        $(this).parent().toggleClass('active');
    });
});