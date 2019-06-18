window.onscroll = () => {
    if (document.body.scrollTop > 50 || document.documentElement.scrollTop > 50) {
      document.getElementsByTagName("nav")[0].className = "nav container affix";
    } else {
      document.getElementsByTagName("nav")[0].className = "nav container";
    }
};

// document.getElementsByClassName('navTrigger')[0].addEventLsitener('click', function () {
    // this.classList.toggle('active');
    // document.getElementById("mainListDiv").classList.toggle("show_list");
    // fadein(document.getElementById("mainListDiv"),"block");  
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