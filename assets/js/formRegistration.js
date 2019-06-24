require('../scss/formRegistration.scss')

let button = document.getElementById('toggleForm');

button.addEventListener('click', () => {
    let form1 = document.getElementById('form1');
    if(form1.style.display === "block")
        form1.style.display = "none";
    else
        form1.style.display = "block";

    let form2 = document.getElementById('form2');
    if(form2.style.display === "none")
        form2.style.display = "block";
    else
        form2.style.display = "none";
});