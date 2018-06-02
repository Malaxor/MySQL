
CREATE TABLE users(

	email VARCHAR(255) PRIMARY KEY,
	created_at TIMESTAMP DEFAULT NOW()	
);

INSERT INTO users(email) VALUES('Katie34@yahoo.com'), ('Tunde@gmail.com');

-- ===============================================================================
-- INSERTING FAKE DATA 

-- const data =[];

--  for(let i = 0; i < 500; i++) {

--  	data.push([

--  		faker.internet.email(),
--  		faker.date.past()
--  	]);
--  }

--  const q = 'INSERT INTO users (email, created_at) VALUES ?';

--  connection.query(q, [data], (err, res) => {

--  	if(err) throw err;
--  	console.log(res);
--  });
