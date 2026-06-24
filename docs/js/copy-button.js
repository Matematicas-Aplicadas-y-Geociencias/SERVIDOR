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

