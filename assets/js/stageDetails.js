/*// Beginning of automatic pictures call
let images="";
for(let i=1;i<4;i++){
    images+=`<img src="/build/images/img${i}.jpg" alt="mosaique">`
}
const container=document.getElementById('container-images');
container.innerHTML=images;
// End of automatic pictures call

const current = document.getElementById("current");
const imgs = document.querySelectorAll(".imgs img");
const opacity = 0.6;

imgs.forEach(img => img.addEventListener("click", imgClick));
// set first image opacity
imgs[0].style.opacity = opacity;

function imgClick(e) {
    // reste the opacity
    imgs.forEach(img => (img.style.opacity = 1 ));
    //change current image to src of clicked image//
    current.src = e.target.src
    //add fade in class
    current.classList.add("fade-in");
    // Remove fade-in class after 0.5s
    setTimeout(() => current.classList.remove("fade-in"),500);
    // change the opacity to opacity var//
    e.target.style.opacity = opacity;
}*/