
// DEPENDENCIES 
const express    = require('express');
const mysql      = require('mysql');
const faker      = require('faker');
const bodyParser = require('body-parser');
const app 	     = express();

app.set('view engine', 'ejs');
app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static(__dirname + '/public'));

app.listen(3000, () =>  {
	console.log('server running on 8000');
});

// mySQL connection
const connection = mysql.createConnection({
	host: 'localhost',
	port: 3306,
	user: 'root',
	password: "M@laax0r",
	database: 'join_us'
});
connection.connect( (err) => {	
	if(err) throw err;
	console.log("connected as id: " + connection.threadId);
});

// ROUTES
//===============================================================================

app.get('/', (req, res) => {

	const q = 'SELECT COUNT(*) AS count FROM users;';

	connection.query(q, (err, results) => {

		if(err) throw err;
		const count = results[0].count;
		res.render('home', {count: count});
	});
});

app.post('/register', (req, res) => {

	const person = {
		email: req.body.email
	};

	connection.query('INSERT INTO users SET ?', person, (err, result) => {

		if(err) throw err;
		res.redirect('/');
	});	
});

