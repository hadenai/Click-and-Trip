console.log('hey + ')
console.log(document.getElementsByTagName("nav")[0].style)
// // try to evaluate .nav 'top' to determine whether use scrolling effect but problem with the previous line...
// if (document.getElementsByTagName("nav")[0].style.top=='0.1px'){
//     document.getElementsByTagName("nav")[0].className = "nav container affix";
// } else {
//     window.onscroll = () => {
//         if (document.body.scrollTop > 50 || document.documentElement.scrollTop > 50) {
//         document.getElementsByTagName("nav")[0].className = "nav container affix";
//         } else {
//         document.getElementsByTagName("nav")[0].className = "nav container";
//         }
//     };
// }
window.onscroll = () => {
    if (document.body.scrollTop > 50 || document.documentElement.scrollTop > 50) {
    document.getElementsByTagName("nav")[0].className = "nav container affix";
    } else {
    document.getElementsByTagName("nav")[0].className = "nav container";
    }
};
<<<<<<< HEAD

// try to replace all jQuery stuff w/ js vanilla : 
// document.getElementsByClassName('navTrigger')[0].addEventLsitener('click', function () {
    // this.classList.toggle('active');
    // document.getElementById("mainListDiv").classList.toggle("show_list");
    // fadein(document.getElementById("mainListDiv"),"block");  
=======
>>>>>>> dev
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