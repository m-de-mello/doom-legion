// sessão
function validarSessao() {
    var email = sessionStorage.EMAIL_USUARIO;
    var nome = sessionStorage.NOME_USUARIO;
    var username = sessionStorage.USERNAME_USUARIO;

    var b_usuario = document.getElementById("b_usuario");
    var b_username = document.getElementById("b_username");

    if (email != null && nome != null && username != null) {
        b_usuario.innerHTML = nome;
        b_username.innerHTML = username;
    } else {
        window.location = "../login.html";
    }
}

function limparSessao() {
    sessionStorage.clear();
    window.location = "../login.html";
}

// carregamento (loading)
function Aguardar() {
    // var divAguardar = document.getElementById("div_aguardar");
    // divAguardar.style.display = "flex";
}

function finalizarAguardar(texto) {
    // var divAguardar = document.getElementById("div_aguardar");
    // divAguardar.style.display = "none";

    var divErrosLogin = document.getElementById("div_erros_login");
    if (texto) {
        divErrosLogin.style.display = "flex";
        divErrosLogin.innerHTML = texto;
    }
}

