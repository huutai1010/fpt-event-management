// timer
// Set the date we're counting down to
var countDownDate = new Date("Jan 5, 2024 15:37:25").getTime();

// Update the count down every 1 second
var x = setInterval(function () {

    // Get today's date and time
    var now = new Date().getTime();

    // Find the distance between now and the count down date
    var distance = countDownDate - now;

    // Time calculations for days, hours, minutes and seconds
    var days = Math.floor(distance / (1000 * 60 * 60 * 24));
    var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
    var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
    var seconds = Math.floor((distance % (1000 * 60)) / 1000);

    // Output the result in an element with id="demo"
    document.getElementById("demo").innerHTML = days + "d " + hours + "h "
            + minutes + "m " + seconds + "s ";
    // If the count down is over, write some text 
    if (distance < 0) {
        clearInterval(x);
        document.getElementById("demo").innerHTML = "EXPIRED";
    }
}, 1000);

// timer2
var countDownDate = new Date("Jan 5, 2024 15:37:25").getTime();

// Update the count down every 1 second
var x = setInterval(function () {

    // Get today's date and time
    var now = new Date().getTime();

    // Find the distance between now and the count down date
    var distance = countDownDate - now;

    // Time calculations for days, hours, minutes and seconds
    var days = Math.floor(distance / (1000 * 60 * 60 * 24));
    var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
    var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
    var seconds = Math.floor((distance % (1000 * 60)) / 1000);

    // Output the result in an element with id="demo"
    document.getElementById("demo2").innerHTML = days + "d " + hours + "h "
            + minutes + "m " + seconds + "s ";
    // If the count down is over, write some text 
    if (distance < 0) {
        clearInterval(x);
        document.getElementById("demo2").innerHTML = "EXPIRED";
    }
}, 1000);

// timer3
var countDownDate = new Date("Jan 5, 2024 15:37:25").getTime();

// Update the count down every 1 second
var x = setInterval(function () {

    // Get today's date and time
    var now = new Date().getTime();

    // Find the distance between now and the count down date
    var distance = countDownDate - now;

    // Time calculations for days, hours, minutes and seconds
    var days = Math.floor(distance / (1000 * 60 * 60 * 24));
    var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
    var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
    var seconds = Math.floor((distance % (1000 * 60)) / 1000);

    // Output the result in an element with id="demo"
    document.getElementById("demo3").innerHTML = days + "d " + hours + "h "
            + minutes + "m " + seconds + "s ";
    // If the count down is over, write some text 
    if (distance < 0) {
        clearInterval(x);
        document.getElementById("demo3").innerHTML = "EXPIRED";
    }
}, 1000);

document.getElementById('btn_nav').onclick = function () {
    let menu = document.getElementById('menu');
    let blur = document.getElementById('blur');
    menu.style.visibility = 'visible';
    blur.style.display = 'block';
    menu.style.opacity = '1';

    blur.onclick = function () {
        menu.style.visibility = 'hidden';
        menu.style.opacity = '0';
        blur.style.display = 'none';

    }
}   

let fileInput = document.getElementById("images");
let previewImgContainer = document.getElementById("preview-img");
function previewImg() {

    if(fileInput.files.length>2){
        alert('You are only allowed to upload a maximum of 2 images!');
        return false;
    }

    previewImgContainer.innerHTML = "";

    for (i of fileInput.files) {
        let reader = new FileReader();
        let figure = document.createElement("div");
        let figCap = document.createElement("figcaption");
        figCap.innerText = "";
        figure.appendChild(figCap);
        reader.onload = () => {     
            let img = document.createElement("img");
            img.setAttribute("src", reader.result);
            figure.insertBefore(img, figCap);
        }
        previewImgContainer.appendChild(figure);
        reader.readAsDataURL(i);
    }
}

/*let fileinput = document.getElementById("file-input");
let imageContainer = document.getElementById("images");
let numOfFiles = document.getElementById("num-of-files");
let removeFiles = document.getElementById("removeFiles");

function preview() {
    imageContainer.innerHTML = "";
    numOfFiles.textContent = `${fileInput.files.length}
    Files Selected`;
    
    for(i of fileInput.files){
        let reader = new FileReader();
        let figure = document.createElement("figure");
        let figCap = document.createElement("figcaption");
        
        figCap.innerHTML = i.name;
        figure.appendChild(figCap);
        reader.onload=()=> {
            let img = document.createElement("img");
            img.setAttribute("src", reader.result);
            figure.insertBefore(img,figCap);
        }
        imageContainer.appendChild(figure);
        reader.readAsDataURL(i);
    }
}*/

const showContainers = document.querySelectorAll('.show-replies');
showContainers.forEach(btn => btn.addEventListener('click', (e) => {
    let parentContainer = e.target.closest('.comment_container');
    let _id = parentContainer.id;
    if(_id){
        let childrenContainer = parentContainer.querySelectorAll(`[dataset=${_id}]`);
        childrenContainer.forEach(child => child.classList.toggle('opened'));
    }
}))


