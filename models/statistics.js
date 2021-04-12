const db = require("../db");
const alert = process.env.ALERT_TABLE;
const server = process.env.SERVER_TABLE;
const limitStatistics = process.env.LIMIT_STATISTICS;

const getItems = () =>
  db(`${alert} as AT`)
    .join(`${server} AS SV`, "AT.server_id", "SV.id")
    .select("SV.server")
    .count("AT.id as total")
    .groupBy("SV.id")
    .orderBy("total", "desc")
    .limit(parseInt(limitStatistics));

module.exports = { getItems };
