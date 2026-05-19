const request = require("supertest");
const app = require("../../server");
const { initDatabase } = require("../../src/db/connection");

beforeAll(() => {
  initDatabase();
});

describe("GET /health", () => {
  it("returns healthy status with version and uptime", async () => {
    const res = await request(app).get("/health");
    expect(res.statusCode).toBe(200);
    expect(res.body.status).toBe("healthy");
    expect(res.body).toHaveProperty("version");
    expect(res.body).toHaveProperty("uptime");
    expect(res.body).toHaveProperty("timestamp");
    expect(res.body.database).toBe("ok");
  });

  it("returns version from package.json", async () => {
    const { version } = require("../../package.json");
    const res = await request(app).get("/health");
    expect(res.body.version).toBe(version);
  });

  it("returns uptime as a number", async () => {
    const res = await request(app).get("/health");
    expect(typeof res.body.uptime).toBe("number");
    expect(res.body.uptime).toBeGreaterThanOrEqual(0);
  });
});
