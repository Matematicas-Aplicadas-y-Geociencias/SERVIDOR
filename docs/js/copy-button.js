// --- Tu código existente del botón de copiar ---
document.addEventListener("DOMContentLoaded", function () {
    // Icono clásico de copiar (dos páginas superpuestas)
    var copyIcon = '<svg xmlns="http://w3.org" viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect x="9" y="9" width="13" height="13" rx="2" ry="2"></rect><path d="M5 15H4a2 2 0 0 1-2-2V4a2 2 0 0 1 2-2h9a2 2 0 0 1 2 2v1"></path></svg>';
    
    // Icono de check/éxito verde
    var checkIcon = '<svg xmlns="http://w3.org" viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="#28a745" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"><polyline points="20 6 9 17 4 12"></polyline></svg>';

    document.querySelectorAll("pre code").forEach(function (codeBlock) {
        var pre = codeBlock.parentNode;
        pre.style.position = "relative";

	codeBlock.style.paddingRight = "34px"; // Deja un espacio seguro a la derecha para el icono


        var button = document.createElement("button");
        button.className = "copy-code-button";
        button.type = "button";
        button.innerHTML = copyIcon; // Insertamos el SVG de copiar
        button.setAttribute("aria-label", "Copiar código");

        button.addEventListener("click", function () {
            navigator.clipboard.writeText(codeBlock.innerText).then(function () {
                button.innerHTML = checkIcon; // Cambia al icono de check verde
                button.classList.add("copied");
                
                setTimeout(function () {
                    button.innerHTML = copyIcon; // Regresa al icono clásico
                    button.classList.remove("copied");
                }, 2000);
            }, function (err) {
                console.error("Error al copiar: ", err);
            });
        });

        pre.appendChild(button);
    });
});

// --- Nuevo código del carrusel automático ---
document.addEventListener("DOMContentLoaded", function () {
  var contenedores = document.querySelectorAll(".auto-carousel");

  contenedores.forEach(function (contenedor, index) {
    var imagenes;
    try {
      imagenes = JSON.parse(contenedor.getAttribute("data-images"));
    } catch (e) {
      console.error("Error al leer data-images del carrusel:", e);
      return;
    }

    var carouselId = "autoCarousel" + index;

    // --- Indicadores ---
    var indicadoresHTML = "";
    imagenes.forEach(function (img, i) {
      indicadoresHTML +=
        '<li data-target="#' + carouselId + '" data-slide-to="' + i + '"' +
        (i === 0 ? ' class="active"' : '') + '></li>';
    });

    // --- Slides ---
    var slidesHTML = "";
    imagenes.forEach(function (img, i) {
      var titulo = img.title ? '<h5>' + img.title + '</h5>' : '';
      var descripcion = img.desc ? '<p>' + img.desc + '</p>' : '';
      var caption = (titulo || descripcion)
        ? '<div class="carousel-caption">' + titulo + descripcion + '</div>'
        : '';

      slidesHTML +=
        '<div class="item' + (i === 0 ? ' active' : '') + '">' +
          '<img src="' + img.src + '" class="d-block w-100" alt="' + (img.alt || img.title || '') + '">' +
          caption +
        '</div>';
    });

    // --- HTML final del carrusel ---
    var carouselHTML =
      '<div id="' + carouselId + '" class="carousel slide" data-interval="false">' +
        '<ol class="carousel-indicators">' + indicadoresHTML + '</ol>' +
        '<div class="carousel-inner" role="listbox">' + slidesHTML + '</div>' +
        '<a class="left carousel-control" href="#' + carouselId + '" role="button" data-slide="prev">' +
          '<span aria-hidden="true" style="font-size:24px;">&#10094;</span>' +
          '<span class="sr-only">Anterior</span>' +
        '</a>' +
        '<a class="right carousel-control" href="#' + carouselId + '" role="button" data-slide="next">' +
          '<span aria-hidden="true" style="font-size:24px;">&#10095;</span>' +
          '<span class="sr-only">Siguiente</span>' +
        '</a>' +
      '</div>';

    contenedor.innerHTML = carouselHTML;
  });
});
