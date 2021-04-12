const db = require("../db");
const alert = process.env.ALERT_TABLE;
const server = process.env.SERVER_TABLE;
const limitStatistics = process.env.LIMIT_STATISTICS;

const getItems = () =>
  db(`${alert} as AT`)
    .join(`${server} AS SV`, "AT.server_id", "SV.id")
    .select("SV.id", "SV.server", "AT.description");

const createStatistics = (items) => {
  const counts = items.reduce((p, c) => {
    let name = c.server;
    if (!p.hasOwnProperty(name)) {
      p[name] = 0;
    }
    p[name]++;
    return p;
  }, {});
  // console.log("counts: ", counts);
  let sortable = [];
  for (let server in counts) {
    sortable.push([server, counts[server]]);
  }
  sortable.sort(function (a, b) {
    return b[1] - a[1];
  });
  // console.log("sortable: ", sortable);
  return sortable.slice(0,limitStatistics);
};

module.exports = { getItems, createStatistics };
