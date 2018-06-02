
const express = require('express');
const mysql   = require('mysql');
const app 	  = express();

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
//=========================================================================================

app.get('/', (req, res) => {

	const q = 'SELECT COUNT(*) FROM users;';

	connection.query(q, (err, results) => {

		if(err) throw err;
		res.send(results);
	});
});