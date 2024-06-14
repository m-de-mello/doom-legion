var express = require("express");
var router = express.Router();

var quizController = require("../CONTROLLERS/quizController");

router.post("/Registrar", function (req, res) {
    quizController.Registrar(req, res);
})

module.exports = router;