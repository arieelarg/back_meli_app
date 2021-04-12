const router = require("express").Router();
const alerts = require("./controllers/alerts");
const statistics = require("./controllers/statistics");

router.use("/alerts", alerts);
router.use("/statistics", statistics);

module.exports = router;
