var database = require("../DATABASE/config")

function obterQtdCadastros() {
    console.log("ACESSEI O ALERTAS MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function obterQtdCadastros(): ", )
    var instrucaoSql = `
        SELECT count(idUsuario) AS 'Quantidade de Cadastros' FROM usuario
	        WHERE dataRegistro BETWEEN DATE_SUB(CURDATE(), INTERVAL 7 DAY) AND CURDATE();
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function obterQtdTentativas() {
    console.log("ACESSEI O ALERTAS MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function obterQtdTentativas(): ", )
    var instrucaoSql = `
        SELECT count(idTentativa) AS 'Quantidade de Tentativas' FROM tentativa
	        WHERE dataTentativa BETWEEN DATE_SUB(now(), INTERVAL 7 DAY) AND now();
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function obterMediaAcertos() {
    console.log("ACESSEI O ALERTAS MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function obterMediaAcertos(): ", )
    var instrucaoSql = `
        SELECT round(avg(qtdAcertos),1) FROM tentativa
	        WHERE dataTentativa BETWEEN DATE_SUB(now(), INTERVAL 7 DAY) AND now();
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
    obterQtdCadastros,
    obterQtdTentativas,
    obterMediaAcertos
};