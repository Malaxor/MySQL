
const express = require('express');
const mysql   = require('mysql');
const faker   = require('faker');
const app 	  = express();

app.set('view engine', 'ejs');

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

	const q = 'SELECT COUNT(*) AS count FROM users;';

	connection.query(q, (err, results) => {

		if(err) throw err;
		const count = results[0].count;
		// res.send(`We have ${count} users in our database`);
		res.render('home');
	});
});

//===============================================================================
// INSERTING FAKE DATA 

// const data =[];

// for(let i = 0; i < 500; i++) {

// 	data.push([

// 		faker.internet.email(),
// 		faker.date.past()
// 	]);
// }

// const q = 'INSERT INTO users (email, created_at) VALUES ?';

// connection.query(q, [data], (err, res) => {

// 	if(err) throw err;
// 	console.log(res);
// });

// ROUTES
//=========================================================================================
