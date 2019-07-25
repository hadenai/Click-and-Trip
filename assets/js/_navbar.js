if(document.getElementById("padding-for-navbar")){
    document.getElementsByTagName("nav")[0].className = "nav container affix";
    document.getElementById("padding-for-navbar").style.paddingTop="65px";
} else {
    window.onscroll = () => {
        if (document.body.scrollTop > 50 || document.documentElement.scrollTop > 50) {
            document.getElementsByTagName("nav")[0].className = "nav container affix";
        } else {
            document.getElementsByTagName("nav")[0].className = "nav container";
        }
    };
}
const hostvideo = document.getElementById('host-video');

// Not all browsers return promise from .play().
const playPromise = hostvideo.play() || Promise.reject('');
playPromise.then(() => {
    // Video could be autoplayed, do nothing.
}).catch(err => {
    // Video couldn't be autoplayed because of autoplay policy. Mute it and play.
    hostvideo.muted = true;
    hostvideo.play();
});

$('.navTrigger').click(function () {
    $(this).toggleClass('active');
    $("#mainListDiv").toggleClass("show_list");
    $("#mainListDiv").fadeIn();
});

$(function () {
    $('.footer-links-holder h3').click(function () {
        $(this).parent().toggleClass('active');
    });
});

document.getElementById('dropdown').addEventListener('click', (event) => {

    document.getElementById("myDropdown").classList.toggle("show");
});

document.getElementById('dropdown2').addEventListener('click', (event) => {

    document.getElementById("myDropdown2").classList.toggle("show");
});


function getCountries() {
    fetch(Routing.generate('api_stages'))
        .then(results => results.json())
        .then(data => {
            let dest = data.map(stage => stage.destination);
            let unique = [...new Set(dest)];
            const dropdown = document.getElementById('myDropdown2');
            let html = '';
            unique.forEach(country =>
                html += `<a href='/mon-voyage/${country}'> ${country} </a>`);
            dropdown.innerHTML = html;

        })
}
