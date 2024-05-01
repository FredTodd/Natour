// Import express.js
const express = require("express");
const app = express();


// Add static files location
app.use('/static', express.static('static'));
app.use(express.static("static"));

app.set('view engine', 'pug');
app.set('views', './app/views');
app.use(express.static('css'));

// Get the functions in the db.js file to use
const db = require('./services/db');
app.use(express.urlencoded({ extended: true }));

const { User } = require("./models/user");

// Set the sessions
var session = require('express-session');
app.use(session({
  secret: 'secretkeysdfjsflyoifasd',
  resave: false,
  saveUninitialized: true,
  cookie: { secure: false }
}));

// Create a route for root - /
app.get("/", function(req, res) {
    res.render("index");
});

// JSON output of all reviews
app.get("reviews", function(req, res) {
    var sql = 'select * from Reviews';
    // As we are not inside an async function we cannot use await
    // So we use .then syntax to ensure that we wait until the 
    // promise returned by the async function is resolved before we proceed
    db.query(sql).then(results => {
        console.log(results);
        res.json(results);
    });
});

app.get("/reviews-formatted", function(req, res) {
    var sql = 'select * from Reviews';
    var output = '<table border="1px">';
    db.query(sql).then(results => {
        res.render('reviews', {data: results});
    });
});

// Register
app.get('/register', function (req, res) {
    res.render('register');
});
app.get('/register2', function (req, res) {
    res.render('register2');
});
app.get('/login2', function (req, res) {
    res.render('login2');
});

app.post('/set-password', async function (req, res) {
    params = req.body;
    var user = new User(params.email);
    try {
        uId = await user.getIdFromEmail();
        if (uId) {
            // If a valid, existing user is found, set the password and redirect to the users single-student page
            await user.setUserPassword(params.password);
            console.log(req.session.id);
            res.redirect('/login2');
        }
        else {
            // If no existing user is found, add a new one
            newId = await user.addUser(params.email);
            res.redirect('/register2');
        }
    } catch (err) {
        console.error(`Error while adding password `, err.message);
    }
});

// Login
app.get('/login', function (req, res) {
    res.render('login');
});

// Logout
app.get('/logout', function (req, res) {
    req.session.destroy();
    res.redirect('/login');
  });

  // Check submitted email and password pair
app.post('/authenticate', async function (req, res) {
    params = req.body;
    var user = new User(params.email);
    try {
        uId = await user.getIdFromEmail();
        if (uId) {
            match = await user.authenticate(params.password);
            if (match) {
                req.session.uid = uId;
                req.session.loggedIn = true;
                console.log(req.session.id);
                res.redirect('http://127.0.0.1:3000/');
            }
            else {
                // TODO improve the user journey here
                res.send('invalid password');
            }
        }
        else {
            res.redirect('/register');
        }
    } catch (err) {
        console.error(`Error while comparing `, err.message);
    }
});

// Start server on port 3000
app.listen(3000,function(){
    console.log(`Server running at http://localhost:3000`);
});