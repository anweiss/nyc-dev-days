const express = require("express");
const fs = require("fs");
const path = require("path");
const router = express.Router();

// ──────────────────────────────────────────────────────────────
// This file is the PR version of users.js used in Demo 3
// (Code Review). It intentionally has issues for Copilot to
// flag during a live review.
// ──────────────────────────────────────────────────────────────

const USERS_FILE = path.join(__dirname, "..", "..", "data", "users.json");

// GET /api/users — list all users
// ⚠️ Issue 1: Synchronous file read blocks the event loop
// ⚠️ Issue 2: No try/catch — crashes if file is missing
router.get("/", (req, res) => {
  const data = fs.readFileSync(USERS_FILE, "utf-8");
  const users = JSON.parse(data);
  res.json(users);
});

// GET /api/users/:id — get a single user
router.get("/:id", (req, res) => {
  const data = fs.readFileSync(USERS_FILE, "utf-8");
  const users = JSON.parse(data);
  const user = users.find((u) => u.id === req.params.id);
  if (!user) {
    return res.status(404).json({ error: "User not found" });
  }
  res.json(user);
});

// POST /api/users — create a new user
// ⚠️ Issue 3: No validation — name/email could be undefined or empty
router.post("/", (req, res) => {
  const { name, email, role } = req.body;

  const data = fs.readFileSync(USERS_FILE, "utf-8");
  const users = JSON.parse(data);

  const newUser = {
    id: String(users.length + 1),
    name,
    email,
    role,
    createdAt: new Date().toISOString()
  };

  users.push(newUser);
  fs.writeFileSync(USERS_FILE, JSON.stringify(users, null, 2));

  res.status(201).json(newUser);
});

module.exports = router;
