const { McpServer } = require("@modelcontextprotocol/sdk/server/mcp.js");
const { StdioServerTransport } = require("@modelcontextprotocol/sdk/server/stdio.js");
const { z } = require("zod");
const runbooks = require("../sample-extension/runbooks.json");

const server = new McpServer({
  name: "techmart-runbook",
  version: "1.0.0",
  description:
    "TechMart operational runbooks — deploy procedures, rollback steps, monitoring alerts, and incident response"
});

server.tool(
  "search_runbooks",
  "Search TechMart operational runbooks for deploy procedures, rollback steps, monitoring alerts, and incident response",
  { query: z.string().describe("The operational question or topic to search for") },
  async ({ query }) => ({
    content: [{ type: "text", text: searchRunbooks(query) }]
  })
);

function searchRunbooks(query) {
  const lowerQuery = query.toLowerCase();
  const matches = runbooks.filter(
    (r) =>
      r.title.toLowerCase().includes(lowerQuery) ||
      r.keywords.some((k) => lowerQuery.includes(k))
  );

  if (matches.length === 0) {
    return (
      "I couldn't find a runbook matching your question. Available topics: " +
      runbooks.map((r) => r.title).join(", ")
    );
  }

  const best = matches[0];
  return (
    `## ${best.title}\n\n` +
    best.steps.map((s, i) => `${i + 1}. ${s}`).join("\n") +
    `\n\n**Last updated:** ${best.lastUpdated}\n**Owner:** ${best.owner}`
  );
}

async function main() {
  const transport = new StdioServerTransport();
  await server.connect(transport);
}

main().catch((err) => {
  console.error(err);
  process.exit(1);
});
