var database = require("../DATABASE/config")

// Coloque os mesmos parâmetros aqui. Vá para a var instrucaoSql
function Registrar(idUsuario, idQuiz, qtdAcertos) {
    console.log("ACESSEI O QUIZ MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function Registrar():", idUsuario, idQuiz, qtdAcertos);
    
    // Insira exatamente a query do banco aqui, lembrando da nomenclatura exata nos valores
    //  e na ordem de inserção dos dados.
    var instrucaoSql = `
        INSERT INTO tentativa (fkUsuario, fkQuiz, qtdAcertos) VALUES ('${idUsuario}', '${idQuiz}', '${qtdAcertos}');
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
    Registrar
};