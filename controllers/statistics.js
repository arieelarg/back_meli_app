const router = require("express").Router();
const service = require("../models/statistics");

const list = async (req, res) => {
  try {
    const items = await service.getItems();
    return res.json(items);
  } catch (e) {
    console.log(e);
    return res.json({ error: true, message: "Ocurrió un error" });
  }
};

router.get("/", list);

module.exports = router;
