document.getElementById("menu-button").addEventListener("click", function () {
    if (document.querySelector("nav").style.display == "block") {
        document.querySelector("nav").style.display = "none";
        this.innerHTML = '<ion-icon name="menu-outline"></ion-icon>'
    } else {
        document.querySelector("nav").style.display = "block";
        this.innerHTML = '<ion-icon name="close-outline"></ion-icon>'
    };

});
window.onresize = function () {
    if (window.innerWidth >= 1060) {
        document.querySelector("nav").style.display = "block";
    } else {
        document.querySelector("nav").style.display = "none";
        document.getElementById("menu-button").innerHTML = '<ion-icon name="menu-outline"></ion-icon>'
    }
}