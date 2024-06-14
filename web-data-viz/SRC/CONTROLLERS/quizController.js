var quizModel = require("../MODELS/quizModel");


function Registrar(req, res) {
    var idUsuario = req.body.idUsuarioServer;
    var idQuiz = req.body.idQuizServer;
    var qtdAcertos = req.body.qtdAcertosServer;

    // Faça as validações dos valores
    if (idUsuario == undefined) {
        res.status(400).send("Seu idUsuario está undefined!");
    } else if (idQuiz == undefined) {
        res.status(400).send("Seu idQuiz está undefined!");
    } else if (qtdAcertos == undefined) {
        res.status(400).send("Sua qtdAcertos está undefined!");
    } else {

        quizModel.Registrar(idUsuario, idQuiz, qtdAcertos)
            .then(
                function (resultado) {
                    res.json(resultado);
                }
            ).catch(
                function (erro) {
                    console.log(erro);
                    console.log(
                        "\nHouve um erro ao registrar a tentativa! Erro: ",
                        erro.sqlMessage
                    );
                    res.status(500).json(erro.sqlMessage);
                }
            );
    }
}

module.exports = {
    Registrar
}