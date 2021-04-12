const router = require("express").Router();
const service = require("../models/alerts");

const list = async (req, res) => {
  try {
    const { search, page } = req.query || "";
    const alerts = await service.getItems(search, page);
    const countAlerts = await service.countAlerts(search);
    const countedAlerts = countAlerts.length;
    const pagination = service.pagination(countedAlerts, req);
    pagination.total = countedAlerts;
    console.log(alerts)
    return res.json({ alerts, ...pagination });
  } catch (e) {
    console.log(e);
    return res.json({ error: true, message: "Ocurrió un error" });
  }
};

router.get("/", list);

module.exports = router;
