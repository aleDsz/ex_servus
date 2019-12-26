import "phoenix_html"
import { Socket } from "phoenix"
import LiveSocket from "phoenix_live_view"

let liveSocket = new LiveSocket("/app", Socket, {})
liveSocket.connect()

// application
require("./admin/app.js")
require("./web/app.js")