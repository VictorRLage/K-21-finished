var express = require("express");
var router = express.Router();

var medidaController = require("../controllers/medidaController");

router.get("/ultimas/:idAquario", function (req, res) {
    medidaController.buscarUltimasMedidas(req, res);
});

router.get("/tempo-real/:idAquario", function (req, res) {
    medidaController.buscarMedidasEmTempoReal(req, res);
})

router.get("/ultimasM/:idAquario", function (req, res) {
    medidaController.buscarUltimasMedidasM(req, res);
});

router.get("/ultimasA/:idAquario", function (req, res) {
    medidaController.buscarUltimasMedidasA(req, res);
});

router.get("/ultimasAA/:idAquario", function (req, res) {
    medidaController.buscarUltimasMedidasAA(req, res);
});

router.get("/ultimasI/:idAquario", function (req, res) {
    medidaController.buscarUltimasMedidasI(req, res);
});

module.exports = router;