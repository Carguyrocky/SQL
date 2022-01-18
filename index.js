const mysql = require("mysql");
const express = require("express");
const bodyParser = require("body-parser");
const app = express();

app.set("view engine", "ejs");
app.use(bodyParser.urlencoded({ extended: true }));

const connection = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "root",
  database: "rails",
});

// Passes updated user count to rendered page
app.get("/", function (req, res) {
  const userCount = "SELECT COUNT(*) AS count FROM users";
  connection.query(userCount, function (error, results, fields) {
    if (error) throw error;
    const countResponse = results[0].count;
    res.render("home", { data: countResponse });
  });
});

// Shows user a count of books that haven't been assigned to user

app.get("/booksLeft", function (req, res) {
  const count =
    "SELECT COUNT(*) AS booksLeft FROM books LEFT JOIN users ON books.id = users.taken_book_id WHERE users.id IS NULL;";
  connection.query(count, function (error, results, fields) {
    if (error) throw error;
    const booksLeftResponse = results[0].booksLeft;
    res.send(`We have ${booksLeftResponse} books left to choose from.`);
  });
});

// Registers a new user without any validations

app.post("/register", function (req, res) {
  const person = {
    first_name: req.body.firstname,
    last_name: req.body.lastname,
    email: req.body.email,
  };
  connection.query("INSERT INTO users SET ?", person, function (err, result) {
    if (err) throw err;
    res.redirect("/");
  });
});

// Finds user by his first name and updates its email column

app.post("/update", function (req, res) {
  const person = {
    first_name: req.body.firstname,
    email: req.body.newEmail,
  };
  const updater = "UPDATE users SET email = ? WHERE first_name = ?";
  const updaterData = [person.email, person.first_name];
  connection.query(updater, updaterData, function (err, result) {
    if (err) throw err;
    res.redirect("/");
  });
});

// Finds and deletes user by his email

app.post("/delete", function (req, res) {
  const person = {
    email: req.body.email,
  };
  const deleter = "DELETE FROM users WHERE email = ?";
  connection.query(deleter, person.email, function (err, result) {
    if (err) throw err;
    res.redirect("/");
  });
});

// Just listens hehe

app.listen(3000, function () {
  console.log("Server running 3000!");
});
