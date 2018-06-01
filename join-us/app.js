
// DEPENDENCIES
const mysql = require('mysql');
const faker = require('faker');

// mySQL connection
const connection = mysql.createConnection({

	host: 'localhost',
	port: 3306,
	user: 'root',
	password: "M@laax0r",
	database: 'join_us'
});

connection.connect(function(err) {	

	if(err) throw err;
	console.log("connected as id: " + connection.threadId);
});

//===============================================================================
// Queries 

const data =[];

for(let i = 0; i < 500; i++) {

	data.push([

		faker.internet.email(),
		faker.date.past()
	]);
}

const q = 'INSERT INTO users (email, created_at) VALUES ?';

connection.query(q, [data], (err, res) => {

	if(err) throw err;
	console.log(res);
});
