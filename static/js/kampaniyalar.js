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


