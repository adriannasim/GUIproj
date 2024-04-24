// Importing Required Modules
require("dotenv").config();
const express =require('express');
const cookieParser = require('cookie-parser');
const bodyParser = require('body-parser');
const cors = require('cors');
const apiRouter = require('./apiRouter');

// Creating the Express App
const app = express();
const PORT= process.env.PORT;
 
// Middleware Setup
app.use(bodyParser.json());
app.use(cors());
app.use(express.json());

// Mounting API Router
app.use('/apiRouter',apiRouter)
 
// Starting the Server
app.listen(PORT, ()=>{
    console.log(`server is listening on ${PORT}`);
});
 
module.exports = app;