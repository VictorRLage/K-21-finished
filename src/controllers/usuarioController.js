var usuarioModel = require("../models/usuarioModel");

var sessoes = [];

function testar(req, res) {
    console.log("ENTRAMOS NA usuarioController");
    res.json("ESTAMOS FUNCIONANDO!");
}

function listar(req, res) {
    usuarioModel.listar()
        .then(function (resultado) {
            if (resultado.length > 0) {
                res.status(200).json(resultado);
            } else {
                res.status(204).send("Nenhum resultado encontrado!")
            }
        }).catch(
            function (erro) {
                console.log(erro);
                console.log("Houve um erro ao realizar a consulta! Erro: ", erro.sqlMessage);
                res.status(500).json(erro.sqlMessage);
            }
        );
}

function verificar(req, res) {
    var nomeU = req.body.nomeUServer;

    if (nomeU == undefined) {
        res.status(400).send("Seu nomeU está undefined!");
    } else {
        
        usuarioModel.verificar(nomeU)
            .then(
                function (resultado) {
                    console.log(`\nResultados encontrados: ${resultado.length}`);
                    console.log(`Resultados: ${JSON.stringify(resultado)}`); // transforma JSON em String

                    if (resultado.length == 0) {
                        console.log(resultado);
                        res.json(resultado[0]);
                        res.status(403).send("nomeU valido");
                    } else {
                        res.status(403).send("ja existe um usuario com esse nome de usuario");
                    }
                }
            ).catch(
                function (erro) {
                    console.log(erro);
                    console.log("\nHouve um erro ao realizar o login! Erro: ", erro.sqlMessage);
                    res.status(500).json(erro.sqlMessage);
                }
            );
    }

}

function entrar(req, res) {
    var nomeU = req.body.nomeUServer;
    var senha = req.body.senhaServer;

    if (nomeU == undefined) {
        res.status(400).send("Seu nomeU está undefined!");
    } else if (senha == undefined) {
        res.status(400).send("Sua senha está indefinida!");
    } else {
        
        usuarioModel.entrar(nomeU, senha)
            .then(
                function (resultado) {
                    console.log(`\nResultados encontrados: ${resultado.length}`);
                    console.log(`Resultados: ${JSON.stringify(resultado)}`); // transforma JSON em String

                    if (resultado.length == 1) {
                        console.log(resultado);
                        res.json(resultado[0]);
                    } else if (resultado.length == 0) {
                        res.status(403).send("nomeU e/ou senha inválido(s)");
                    } else {
                        res.status(403).send("Mais de um usuário com o mesmo login e senha!");
                    }
                }
            ).catch(
                function (erro) {
                    console.log(erro);
                    console.log("\nHouve um erro ao realizar o login! Erro: ", erro.sqlMessage);
                    res.status(500).json(erro.sqlMessage);
                }
            );
    }

}

function cadastrar(req, res) {
    // Crie uma variável que vá recuperar os valores do arquivo cadastro.html
    var nome = req.body.nomeServer;
    var email = req.body.emailServer;
    var senha = req.body.senhaServer;
    var nomeU = req.body.nomeUServer;

    // Faça as validações dos valores
    if (nome == undefined) {
        res.status(400).send("Seu nome está undefined!");
    } else if (email == undefined) {
        res.status(400).send("Seu email está undefined!");
    } else if (senha == undefined) {
        res.status(400).send("Sua senha está undefined!");
    }else if (nomeU == undefined) {
        res.status(400).send("Sua nomeU está undefined!");
    } else {
        
        // Passe os valores como parâmetro e vá para o arquivo usuarioModel.js
        usuarioModel.cadastrar(nome, email, senha, nomeU)
            .then(
                function (resultado) {
                    res.json(resultado);
                }
            ).catch(
                function (erro) {
                    console.log(erro);
                    console.log(
                        "\nHouve um erro ao realizar o cadastro! Erro: ",
                        erro.sqlMessage
                    );
                    res.status(500).json(erro.sqlMessage);
                }
            );
    }
}
function cadastrarVotos(req, res) {
    // Crie uma variável que vá recuperar os valores do arquivo cadastro.html
    var JogoDoAno = req.body.JogoDoAnoServer;
    var Multiplayer = req.body.MultiplayerServer;
    var Audio = req.body.AudioServer;
    var AcaoAventura = req.body.AcaoAventuraServer;
    var Indie = req.body.IndieServer;
    var fkUsuario = req.body.fkUsuarioServer;

    // Faça as validações dos valores
    if (JogoDoAno == undefined) {
        res.status(400).send("Seu JogoDoAno está undefined!");
    } else if (Multiplayer == undefined) {
        res.status(400).send("Seu Multiplayer está undefined!");
    } else if (Audio == undefined) {
        res.status(400).send("Sua Audio está undefined!");
    }else if (AcaoAventura == undefined) {
        res.status(400).send("Sua AcaoAventura está undefined!");
    }else if (Indie == undefined) {
        res.status(400).send("Sua Indie está undefined!");
    }
    else if (fkUsuario == undefined) {
        res.status(400).send("Sua fkUsuario está undefined!");
    } else {
        
        // Passe os valores como parâmetro e vá para o arquivo usuarioModel.js
        usuarioModel.cadastrarVotos(JogoDoAno, Multiplayer, Audio, AcaoAventura, Indie, fkUsuario)
            .then(
                function (resultado) {
                    res.json(resultado);
                }
            ).catch(
                function (erro) {
                    console.log(erro);
                    console.log(
                        "\nHouve um erro ao realizar o cadastro! Erro: ",
                        erro.sqlMessage
                    );
                    res.status(500).json(erro.sqlMessage);
                }
            );
    }
}

module.exports = {
    entrar,
    cadastrar,
    listar,
    testar,
    verificar,
    cadastrarVotos
}