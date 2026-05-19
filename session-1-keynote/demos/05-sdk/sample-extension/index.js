const http = require("http");
const {
  verifyAndParseRequest,
  createAckEvent,
  createDoneEvent,
  createTextEvent
} = require("@copilot-extensions/preview-sdk");
const runbooks = require("./runbooks.json");

const PORT = process.env.PORT || 8080;
const MAX_BODY_SIZE_BYTES = 1024 * 1024;

const server = http.createServer(async (req, res) => {
  if (req.method !== "POST" || req.url !== "/") {
    res.writeHead(404);
    res.end("Not found");
    return;
  }

  try {
    const body = await readRequestBody(req);
    const signature = req.headers["github-public-key-signature"] || "";
    const keyId = req.headers["github-public-key-identifier"] || "";
    const { isValidRequest, payload } = await verifyAndParseRequest(body, signature, keyId, {
      token: req.headers["x-github-token"] || ""
    });

    if (!isValidRequest) {
      res.writeHead(401);
      res.end("Unauthorized");
      return;
    }

    // Extract the user's question from the last message
    const messages = payload.messages || [];
    const userMessage = messages[messages.length - 1]?.content || "";

    // Search runbooks for relevant content
    const answer = searchRunbooks(userMessage);

    // Stream the response back using SSE
    res.writeHead(200, { "Content-Type": "text/event-stream" });
    res.write(createAckEvent());
    res.write(createTextEvent(answer));
    res.write(createDoneEvent());
    res.end();
  } catch (err) {
    if (err.code === "PAYLOAD_TOO_LARGE") {
      res.writeHead(413);
      res.end("Payload too large");
      return;
    }

    console.error("Error handling request:", err);
    res.writeHead(500);
    res.end("Internal server error");
  }
});

function readRequestBody(req) {
  return new Promise((resolve, reject) => {
    let data = "";
    let size = 0;
    let settled = false;

    const finish = (fn, value) => {
      if (settled) return;
      settled = true;
      fn(value);
    };

    req.on("error", (error) => finish(reject, error));

    req.on("data", (chunk) => {
      if (settled) return;

      size += chunk.length;
      if (size > MAX_BODY_SIZE_BYTES) {
        const error = new Error("Payload too large");
        error.code = "PAYLOAD_TOO_LARGE";
        finish(reject, error);
        req.destroy(error);
        return;
      }
      data += chunk;
    });

    req.on("end", () => finish(resolve, data));
  });
}

/**
 * Search runbooks for content matching the user's question.
 * In production, you'd use embeddings or a vector store.
 */
function searchRunbooks(query) {
  const lowerQuery = query.toLowerCase();
  const matches = runbooks.filter(
    (r) =>
      r.title.toLowerCase().includes(lowerQuery) ||
      r.keywords.some((k) => lowerQuery.includes(k))
  );

  if (matches.length === 0) {
    return "I couldn't find a runbook matching your question. Available topics: " +
      runbooks.map((r) => r.title).join(", ");
  }

  const best = matches[0];
  return `## ${best.title}\n\n${best.steps.map((s, i) => `${i + 1}. ${s}`).join("\n")}\n\n` +
    `**Last updated:** ${best.lastUpdated}\n**Owner:** ${best.owner}`;
}

server.listen(PORT, () => {
  console.log(`Runbook extension listening on http://localhost:${PORT}`);
});
