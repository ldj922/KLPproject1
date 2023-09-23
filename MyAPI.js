const express = require('express');
const path = require('path');
const cors = require('cors');
const app = express();
const port = process.env.PORT || 3000;
const { Pool } = require('pg');
const connectionString = 'postgres://[your_connection_string]';

const pool = new Pool({
  connectionString: connectionString,
  ssl: {
    rejectUnauthorized: false
  }
});

pool.query('SELECT NOW()', (err, res) => {
  if (err) {
    console.error('Error querying database:', err);
  } else {
    console.log('Database connection successful, Current Time:', res.rows[0].now);
  }
});

app.use(cors());

app.use(express.urlencoded({ extended: true }));
app.use(express.json());

app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, 'index.html'));
});

app.post('/save_store', (req, res) => {
  const name = req.body.name;
  const category = req.body.category;
  const phoneNumber = req.body.phoneNumber;
  const menu = req.body.menu;
  const photoUrl = req.body.photoUrl;

  const query = 'INSERT INTO raitto_store(name, category, "phoneNumber", menu, "photoUrl") VALUES($1, $2, $3, $4, $5)';
  const values = [name, category, phoneNumber, menu, photoUrl];

  pool.query(query, values, (err) => {
    if (err) {
      console.error('Error inserting data:', err);
      res.status(500).send('Internal Server Error');
    } else {
      console.log('데이터가 성공적으로 추가되었습니다.');
      res.redirect('/');
    }
  });
});

const fetchDataByCategory = (category, res) => {
  pool.query('SELECT * FROM raitto_store WHERE category = $1', [category], (err, result) => {
    if (err) {
      console.error('Error querying data:', err);
      res.status(500).send('Internal Server Error');
    } else {
      res.json(result.rows);
    }
  });
};

app.get('/place_restaurant', (req, res) => {
  fetchDataByCategory('식당', res);
});

// ... [기존의 엔드포인트들은 그대로 유지]

app.get('/search', (req, res) => {
    const keyword = req.query.keyword;

    pool.query('SELECT * FROM raitto_store WHERE name LIKE $1', [`%${keyword}%`], (err, result) => {
        if (err) {
            console.error('Error querying data:', err);
            res.status(500).send('Internal Server Error');
        } else {
            res.json(result.rows);
        }
    });
});

app.listen(port, () => {
  console.log(`서버가 http://localhost:${port} 에서 실행 중입니다.`);
});
