import materialize_css from "materialize-css/dist/css/materialize.min.css"
import materialize_js from "materialize-css/dist/js/materialize.min.js"
import css from "../css/app.css"

import "jquery"
import "phoenix_html"
import { Socket } from "phoenix"
import LiveSocket from "phoenix_live_view"

let liveSocket = new LiveSocket("/app", Socket, {})
liveSocket.connect()

// jQuery
const $ = require('jquery');
global.$ = global.jQuery = $;

// application
require("./admin/app.js")
require("./web/app.js")