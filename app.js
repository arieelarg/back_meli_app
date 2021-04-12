const express = require("express");
const dotenv = require("dotenv");
dotenv.config();
const app = express();
const logger = require("morgan");
const cors = require("cors");

const routes = require("./routes");
const port = process.env.PORT || 3000;
const host = '0.0.0.0';

app.use(cors());
app.use(express.json());
app.use(logger("dev"));

app.use("/api", routes);

app.listen(port, host, () => console.log(`Listening on port: ${port}`));
