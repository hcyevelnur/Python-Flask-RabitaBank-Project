function filtrele(kategori) {
    var kartlar = document.getElementsByClassName("salam_2");
    var silinmiskategori = kategori.toLowerCase();
    
    for (var i = 0; i < kartlar.length; i++) {
      var kart = kartlar[i];
      var kartKategori = kart.classList[1];
      
      if (silinmiskategori === "hamisi" || kartKategori === silinmiskategori) {
        kart.style.display = "block";
      } else {
        kart.style.display = "none";
      }
    }
    var salam1 = document.querySelector(".xeberler_1 .active");
    salam1.classList.remove("active");
    
    var secilenButon = document.querySelector(".xeberler_1 [data-kategori='" + kategori + "']");
    secilenButon.classList.add("active");
  }


var ilksehife = 1;
var sonuncusehife = 6;
function sayfala(sayfa) {
ilksehife = sayfa;
kartlariGuncelle();
}
function kartlariGuncelle() {
var kartlar = document.getElementsByClassName("salam_2");

for (var i = 0; i < kartlar.length; i++) {
  if (i >= (ilksehife - 1) * sonuncusehife && i < ilksehife * sonuncusehife) {
    kartlar[i].style.display = "block";
  } else {
    kartlar[i].style.display = "none";
  }
}
  var sayfalamaDugmeleri = document.getElementsByClassName("xeberlerfooter_1");
var geriButton = document.getElementsByClassName("xeberlerfooter_2")[0];

for (var j = 1; j <= Math.ceil(kartlar.length / sonuncusehife); j++) {
  if (j === ilksehife) {
    sayfalamaDugmeleri[j].classList.add("active");
  } else {
    sayfalamaDugmeleri[j].classList.remove("active");
  }
}
  if (ilksehife === 1) {
  geriButton.classList.add("disabled");
} else {
  geriButton.classList.remove("disabled");
}
}
window.onload = function() {
kartlariGuncelle();
};