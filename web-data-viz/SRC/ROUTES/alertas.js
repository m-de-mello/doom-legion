var express = require("express");
var router = express.Router();

var alertasController = require("../CONTROLLERS/alertasController");

router.get("/obterQtdCadastros", function (req, res) {
    alertasController.obterQtdCadastros(req, res);
})

router.get("/obterQtdTentativas", function (req, res) {
    alertasController.obterQtdTentativas(req, res);
})

router.get("/obterMediaAcertos", function (req, res) {
    alertasController.obterMediaAcertos(req, res);
})

module.exports = router;