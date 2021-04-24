const yargs = require('yargs');
const { hideBin } = require('yargs/helpers');
const config = require('./dbconfig');
const mysql = require('mysql');
let session = require('express-session');
global.argv = yargs(hideBin(process.argv)).argv;
argv.__proto__ = process.env;

let express = require('express');
const dbconfig = require('./dbconfig');
let app = express();
let port = Number(argv.port) || 8080;

exports.app = app;
app.set('trust proxy', 1) // trust first proxy
app.use(session({
  secret: 'keyboard cat',
  resave: false,
  saveUninitialized: true,
  cookie: { secure: true }
}))
require('./routes')

let serve = express();
exports.serve = serve;
serve.use(app);
if ('serve' in argv) {
  console.log('Serving Vue from port', argv.serve);
  serve.use(require('express-http-proxy')(`http://localhost:${argv.serve}`));
} else {
  let dist = `${__dirname}/../dist`;
  let index = `${dist}/index.html`;
  serve.use(express.static(dist));
  serve.use((req, res) => res.sendFile(index));
}

let server = require('http').createServer(serve);
server.listen(port, function() {
  console.log('Listening on port', port);
})

var connection = mysql.createConnection(config);
connection.connect();
global.mysql = connection;