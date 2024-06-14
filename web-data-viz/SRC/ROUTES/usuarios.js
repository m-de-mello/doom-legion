var express = require("express");
var router = express.Router();

var usuarioController = require("../CONTROLLERS/usuarioController");

//Recebendo os dados do html e direcionando para a função cadastrar de usuarioController.js
router.post("/Cadastrar", function (req, res) {
    usuarioController.Cadastrar(req, res);
})

router.post("/Autenticar", function (req, res) {
    usuarioController.Autenticar(req, res);
});

router.post("/Alterar", function (req, res) {
    usuarioController.Alterar(req, res);
});

module.exports = router;