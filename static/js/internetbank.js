!(function (configurationFile, e) {
    "use strict";
    configurationFile = configurationFile || "/settings.json";
    var t = window,
        a = document;
    (t.ThreadsWidget = { isDummy: !0 }),
        ["hideInvite", "version", "commitHash", "showChat", "hideChat", "onHideChat", "onScenarios", "onLoad"].forEach(function (e) {
            t.ThreadsWidget[e] = function (a) {
                var n, i, o;
                (n = e),
                    (i = a),
                    (o = setInterval(function () {
                        t.ThreadsWidget && !t.ThreadsWidget.isDummy && (clearInterval(o), t.ThreadsWidget[n] && t.ThreadsWidget[n](i));
                    }, 100));
            };
        });
    var n,
        i =
            ((n = new XMLHttpRequest()),
                function (e, t, a, i) {
                    (n.onreadystatechange = function () {
                        if (4 === n.readyState)
                            if (200 === this.status) a(n.response);
                            else {
                                if ("function" != typeof i) throw new Error(n.response);
                                i(n);
                            }
                    }),
                        n.open(e, t),
                        n.send();
                });
    function o(t) {
        t.webchat && (t.webchat.filename = t.filename),
        t.style && (t.webchat.style = t.style),
        e && "string" == typeof e && (t.webchat.currentLocale = e),
        e && "object" == typeof e && (e.locale && "string" == typeof e.locale && (t.webchat.currentLocale = e.locale), e.unavailable && "boolean" == typeof e.unavailable && (t.webchat.isUnavailableOnStart = e.unavailable));
        try {
            sessionStorage.setItem("__threadsWidget", JSON.stringify(t.webchat));
        } catch (e) {
            window.__threadsWidget = JSON.stringify(t.webchat);
        }
        if (t.filename) {
            var n = a.createElement("script");
            (n.type = "text/javascript"), (n.async = !0), (n.src = t.filename);
            var i = a.getElementsByTagName("script")[0];
            i ? i.parentNode.insertBefore(n, i) : a.body.appendChild(n);
        } else console && console.error("Invalid bundle");
    }
    function s() {
        i("GET", configurationFile + "?rnd=" + Math.random(), function (e) {
            var t = JSON.parse(e);
            o(t);
        });
    }
    "complete" === a.readyState ? s() : t.attachEvent ? t.attachEvent("onload", s) : t.addEventListener("load", s, !1);
})("vue/src/assets/plugins/threadswidget/settings.json", {});

var slideIndex = 1;
showSlide(slideIndex);

function currentSlide(n) {
  showSlide(slideIndex = n);
}

function showSlide(n) {
  var i;
  var slides = document.getElementsByClassName("slide");
  var dots = document.getElementsByClassName("dot");

  if (n > slides.length) {
    slideIndex = 1;
  }

  if (n < 1) {
    slideIndex = slides.length;
  }

  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";
  }

  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" aktiv", "");
  }

  slides[slideIndex - 1].style.display = "block";
  dots[slideIndex - 1].className += " aktiv";
}


    function changeTab(event, tabId) {
        const tabLinks = document.querySelectorAll('.salam_22 li');
        const tabContents = document.querySelectorAll('.salam_33');
    
        tabLinks.forEach(link => link.classList.remove('active'));
        tabContents.forEach(content => content.style.display = 'none');
    
        event.currentTarget.classList.add('active');
        document.getElementById(tabId).style.display = 'block';
    }
    
    document.querySelector('.salam_22 li').click();
