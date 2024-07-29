const express = require('express');
const mysql = require('mysql2');
const app = express();

// Create MySQL connection
const connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'bookapp'
});

connection.connect((err) => {
    if (err) {
        console.error('Error connecting to MySQL:', err);
        return;
    }
    console.log('Connected to MySQL database');
});

// Set up view engine
app.set('view engine', 'ejs');

// Enable static files
app.use(express.static('public'));

// Enable form processing
app.use(express.urlencoded({
    extended: false 
}));

//--------------------------------------------------
// L08 AM - Read

//R - get all items  (it can be "/" or "/getAllItems")
app.get("/", (req, res) => {
    //database mysql connection
    const sql = "SELECT * FROM books"
    connection.query(sql, (error, results) => {
        if (error){
            console.log("Database error", error);
            return res.status(500).send("Database error");
        }
        res.render('index', { books:results }); // Render HTML page with data
    });
    
});

//R - get item by id (it can be "/product/:id" or "/getProductByID/:id")
app.get("/book/:id", (req, res) => {
    const id = req.params.id;

    //database mysql connection
    const sql = "SELECT * FROM books WHERE bookId = ?"
    connection.query(sql, [id], (error, results) => {
        if (error){
            console.log("Database error", error);
            return res.status(500).send("Database error");
        }
        res.render('book', { book:results[0] }); // Render HTML page with the first row 
    });
});


//--------------------------------------------------
// L08 PM - Create, Update, Delete


//C - display form
app.get("/addBook", (req, res) => {
    res.render("addBook");
});

//C - process form
app.post("/addBook", (req, res) => {
    //Extract data
    const {name, synopsis, rating, image} = req.body;
    
    //optional print for debugging
    console.log("Name: " + name);    
    console.log("Synopsis: " + synopsis );
    console.log("Rating: " + rating);
    console.log("Image: " + image );
    
    //insert into database
    sql = "INSERT INTO books (bookName, synopsis, rating, image) VALUES (?, ?, ?, ?)";
    connection.query(sql, [name, synopsis, rating, image], (error, results) => {
        if (error){
            console.log("Database error", error);
            return res.status(500).send("Database error");
        }
        res.redirect("/"); // Redirect to home page
    });


});


//L09 - Update
app.get("/editBook/:id", (req, res) => {
    const bookId = req.params.id;

    const sql = "SELECT * FROM books WHERE bookId = ?";
    connection.query(sql, [bookId], (error, results) => {
        if (error){
            console.error("Database query error", error.message);
            return res.status(500).send("Error Retrieving book by ID");
        }        

        if (results.length > 0) {
            res.render("editBook", { book:results[0] });
        } else {
            res.status(404).send("Book not found");
        }
    });
});

app.post("/editBook/:id", (req, res) => {

    const bookId = req.params.id;
    const {name, synopsis, rating} = req.body;

    const sql = "UPDATE books SET bookName = ?, synopsis = ?, rating = ? WHERE bookId = ?";
    connection.query(sql, [name, synopsis, rating, bookId], (error, results) => {
        if (error){
            console.error("Error updating book:", error);
            res.status(500).send("Error updating book");
        } else {
        res.redirect("/"); 
        }
    }); 
});


//L09 - Delete
app.get("/deleteBook/:id", (req, res) => {
    const bookId = req.params.id;

    const sql = "DELETE FROM books WHERE bookId = ?";
    connection.query(sql, [bookId], (error, results) => {
        if (error){
            console.error("Error deleting book:", error);
            res.status(500).send("Error deleting book");
        } else {
        res.redirect("/");
        }
    });
});

const PORT = process.env.PORT || 3003; 
app.listen(PORT, () => console.log(`Server running on port ${PORT}`)); 
