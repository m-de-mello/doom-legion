var express = require("express");
var router = express.Router();

var alertasController = require("../CONTROLLERS/alertasController");

router.post("/obterQtdCadastros", function (req, res) {
    alertasController.obterQtdCadastros(req, res);
})

router.post("/obterQtdTentativas", function (req, res) {
    alertasController.obterQtdTentativas(req, res);
})

router.post("/obterMediaAcertos", function (req, res) {
    alertasController.obterMediaAcertos(req, res);
})

module.exports = router;