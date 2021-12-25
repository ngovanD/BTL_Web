const buybtn = document.querySelector('.bag')
const modal = document.querySelector('.modal')
const modalClose = document.querySelector('.ti-close')
const modalSub = document.querySelector('.sub-modal')
function showBuy() {
    modal.classList.add('open')
}
function hideBuy() {
    modal.classList.remove('open')
}
buybtn.addEventListener('click', showBuy)
modalClose.addEventListener('click', hideBuy)
modal.addEventListener('click', hideBuy)
modalSub.addEventListener('click', function (event) {
    event.stopPropagation()
})

window.onscroll = function () { myFunction() };
var navH = document.getElementById("nav-bar");
var fixed = navH.offsetTop;
function myFunction() {
    if (window.pageYOffset > fixed) {
        navH.classList.add("fixed");
    } else {
        navH.classList.remove("fixed");
    }
}