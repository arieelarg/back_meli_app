const db = require("../db");
const alert = process.env.ALERT_TABLE;
const server = process.env.SERVER_TABLE;
const serverType = process.env.SERVER_TYPE_TABLE;
const limit = process.env.LIMIT_RESPONSE;
const base_url = process.env.BASE_URL;

const countAlerts = (searchValue = "") =>
  db(`${alert} as AT`)
    .join(`${server} AS SV`, "AT.server_id", "SV.id")
    .whereRaw(`SV.server like '%${searchValue}%'`)
    .orWhere({
      ...(searchValue ? { "AT.description": searchValue } : {}),
    })
    .count("* as countAlerts");

const getAlerts = (searchValue = "", page = 1) =>
  db(`${alert} as AT`)
    .join(`${server} AS SV`, "AT.server_id", "SV.id")
    .join(`${serverType} AS STP`, "SV.server_type", "STP.id")
    .select(
      "AT.id",
      "SV.server",
      "STP.type AS server_type",
      "AT.description",
      "AT.created_at"
    )
    .whereRaw(`SV.server like '%${searchValue}%'`)
    .orWhereRaw(`AT.description like '%${searchValue}%'`)
    .limit(limit)
    .offset(page === 0 || page === 1 ? 0 : (page - 1) * limit);

const getItems = (searchValue, page) => getAlerts(searchValue, parseInt(page));

const pagination = (countAlerts, req) => {
  try {
    const { baseUrl: endpoint } = req;
    const total = countAlerts;
    const moreInfo = {
      next: null,
      prev: null,
    };
    const search = req.query.search;
    if (total > limit) {
      if (req.query.page) {
        const page = parseInt(req.query.page);
        if (page > 1) {
          moreInfo.prev = `${base_url}${endpoint}?search=${search}&page=${
            page - 1
          }`;
          if (page + 1 > Math.ceil(total / limit)) {
            moreInfo.next = `${base_url}${endpoint}?search=${search}&page=${page}`;
          } else {
            moreInfo.next = `${base_url}${endpoint}?search=${search}&page=${
              page + 1
            }`;
          }
        } else {
          moreInfo.prev = null;
          moreInfo.next = `${base_url}${endpoint}?search=${search}&page=${
            page + 1
          }`;
        }
      } else {
        moreInfo.prev = null;
        moreInfo.next = `${base_url}${endpoint}?search=${search}&page=2`;
      }
      moreInfo.limit = limit;
    } else {
      moreInfo.limit = limit;
    }
    return moreInfo;
  } catch (e) {
    console.log(e);
  }
};

module.exports = {
  getItems,
  pagination,
  countAlerts,
};
