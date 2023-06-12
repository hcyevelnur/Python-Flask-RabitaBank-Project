var kreditmeblegi1 = document.getElementById("kreditmeblegi");
var kreditmeblegislider1 = document.getElementById("kreditmeblegislider");
var kreditmuddeti1 = document.getElementById("kreditmuddeti");
var kreditmuddetislider1 = document.getElementById("kreditmuddetislider");
var faizderecesi1 = document.getElementById("faizderecesi");
var faizderecesislider1 = document.getElementById("faizderecesislider");
var ayliqodeniss = document.getElementById("ayliqodeniss");

kreditmeblegislider1.addEventListener("input", kreditmeblegislider2);
kreditmuddetislider1.addEventListener("input", kreditmuddetislider2);
faizderecesislider1.addEventListener("input", faizderecesislider2);

function kreditmeblegislider2() {
  kreditmeblegi1.value = kreditmeblegislider1.value;
  cavablar2();
}

function kreditmuddetislider2() {
  kreditmuddeti1.value = kreditmuddetislider1.value;
  cavablar2();
}

function faizderecesislider2() {
  faizderecesi1.value = faizderecesislider1.value;
  cavablar2();
}

function cavablar2() {
  var kreditmeblegi22 = parseFloat(kreditmeblegi1.value);
  var kreditmuddeti22 = parseFloat(kreditmuddeti1.value);
  var faizderecesi22 = parseFloat(faizderecesi1.value);

  var ayliqodeniscavabi = faizderecesi22 / 100 / 12;
  var cavab = kreditmuddeti22;
  var ayliqodeniss1 = (kreditmeblegi22 * ayliqodeniscavabi) / (1 - Math.pow(1 + ayliqodeniscavabi, -cavab));
  var ayliqodeniss2 = ayliqodeniss1.toFixed(2) + " ₼";

  ayliqodeniss.textContent = "" + ayliqodeniss2;
}