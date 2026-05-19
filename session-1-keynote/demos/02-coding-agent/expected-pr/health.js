const express = require("express");
const router = express.Router();
const { getDb } = require("../db/connection");
const { version } = require("../../package.json");

const startTime = Date.now();

// GET /health — application health check
router.get("/", (req, res) => {
  let databaseStatus = "ok";

  try {
    const db = getDb();
    db.prepare("SELECT 1").get();
  } catch {
    databaseStatus = "error";
  }

  res.json({
    status: "healthy",
    version,
    uptime: Math.floor((Date.now() - startTime) / 1000),
    timestamp: new Date().toISOString(),
    database: databaseStatus
  });
});

module.exports = router;
