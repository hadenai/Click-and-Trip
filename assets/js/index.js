// any CSS you require will output into a single css file (app.css in this case)
require('../scss/index.scss');
require('semantic-ui/dist/semantic.min.css')
require('semantic-ui/dist/semantic.min.js')
require('../scss/_footer.scss')
require('../scss/_navbar.scss')
require('./_navbar.js')

// document.getElementsByTagName('iframe').forEach(e => {
//     console.log('before load')
//     e.onload = () => {
//         console.log('hey');
//         setTimeout(function() {e.click()},4000)
//         console.log('ho');
//         setTimeout(function() {e.click()},8000)
//     }
// });

const IFRAME=document.getElementsByTagName('iframe')[0];
// IFRAME.onload(()=>{setTimeout(function() {e.click()},4000)});
setTimeout(() => {
    console.log("click");
    IFRAME.click();
    console.log("point");
    IFRAME.style.pointerEvents="none";
},3000);