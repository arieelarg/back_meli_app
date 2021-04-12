// Listar los 3 servers con la mayor cantidad de alertas en el último mes, junto con un valor entero que especifique esa cantidad.

const router = require("express").Router();
const service = require("../models/statistics");

const list = async (req, res) => {
  try {
    const items = await service.getItems();
    const statistics = service.createStatistics(items, 3);
    return res.json(statistics);
  } catch (e) {
    console.log(e);
    return res.json({ error: true, message: "Ocurrió un error" });
  }
};

router.get("/", list);

module.exports = router;
