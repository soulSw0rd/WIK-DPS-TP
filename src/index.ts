import { createServer, IncomingMessage, ServerResponse } from "http";

const PORT = process.env.PING_LISTEN_PORT || 3000;

const sendJsonResponse = (res: ServerResponse, statusCode: number, data: object): void => {
    res.writeHead(statusCode, { "Content-Type": "application/json" });
    res.end(JSON.stringify(data));
};

const handlePingRequest = (req: IncomingMessage, res: ServerResponse): void => {
    sendJsonResponse(res, 200, { message: "Headers received", headers: req.headers });
};

const requestHandler = (req: IncomingMessage, res: ServerResponse): void => {
    if (req.method === "GET" && req.url === "/ping") {
        handlePingRequest(req, res);
    } else {
        res.writeHead(404, { "Content-Type": "text/plain" });
        res.end("Not Found");
    }
};

createServer(requestHandler).listen(PORT, () => {
    console.log(`Server is running : http://localhost:${PORT}`);
});

