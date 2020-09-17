document.getElementById("menu-button").addEventListener("click", function () {
    if (document.querySelector("nav").style.display == "block") {
        document.querySelector("nav").style.display = "none";
        this.innerHTML = '<ion-icon name="menu-outline"></ion-icon>'
    } else {
        document.querySelector("nav").style.display = "block";
        this.innerHTML = '<ion-icon name="close-outline"></ion-icon>'
    };
});
document.querySelector(".find_posts_area input").addEventListener("focus", function () {
    if (window.innerWidth <= 1060) {
        document.querySelector(".find_posts_area").setAttribute("class", "find_posts_area find_posts_area_focus"); document.getElementById("menu-button")
        document.getElementById("menu-button").style.display = "none";
    };
});
document.querySelector(".find_posts_area input").addEventListener("blur", function () {
    if (window.innerWidth <= 1060) {
        document.querySelector(".find_posts_area").setAttribute("class", "find_posts_area"); document.getElementById("menu-button")
        document.getElementById("menu-button").style.display = "block";
    };
});
window.onresize = function () {
    if (document.hasFocus() == false) {
        if (window.innerWidth >= 1060) {
            document.querySelector("nav").style.display = "block";
        } else {
            document.querySelector("nav").style.display = "none";
            document.getElementById("menu-button").innerHTML = '<ion-icon name="menu-outline"></ion-icon>'
        };
    };
};