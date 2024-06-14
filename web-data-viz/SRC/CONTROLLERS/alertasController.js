var alertasModel = require("../MODELS/alertasModel");

function obterQtdCadastros(req, res) {
    alertasModel.obterQtdCadastros().then(function (resultado) {
        if (resultado.length > 0) {
            res.json(resultado[0]);

        } else {
            res.status(204).send("Nenhum resultado encontrado!")
            
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar os avisos: ", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });

}


function obterQtdTentativas(req, res) {
    alertasModel.obterQtdTentativas().then(function (resultado) {
        console.log(resultado,"jdsksdjsk")

        if (resultado.length > 0) {
            res.json(resultado[0]);

        } else {
            res.status(204).send("Nenhum resultado encontrado!")
            
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar os avisos: ", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });

}


function obterMediaAcertos(req, res) {
    alertasModel.obterMediaAcertos().then(function (resultado) {
        if (resultado.length > 0) {
            res.json(resultado[0]);

        } else {
            res.status(204).send("Nenhum resultado encontrado!")
            
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar os avisos: ", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });

}

module.exports = {
    obterQtdCadastros,
    obterQtdTentativas,
    obterMediaAcertos
}