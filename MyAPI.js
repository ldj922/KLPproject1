const express = require('express');
const path = require('path');
const cors = require('cors');
const app = express();
const port = process.env.PORT || 3000;
const { Pool } = require('pg');
const connectionString = 'postgres://zdtmglwuvutdbi:4fdad7a05817739192e79ea461b9cf6cb57305381be912fe52f459f11eb13686@ec2-3-230-24-12.compute-1.amazonaws.com:5432/d6jpb5mbc1nrop';

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
  const menu = req.body.menu.split(',');
  const photoUrl = req.body.photoUrl;
  const featureOne = req.body.featureOne;
  const featureTwo = req.body.featureTwo; 
  const runningTime = req.body.runningTime.split(','); 
  const price = req.body.price.split(',');  
  const menuUrl = req.body.menuUrl.split(',');  

  const query = 'INSERT INTO raitto_store(name, category, "phoneNumber", menu, "photoUrl", "featureOne", "featureTwo", "runningTime", price, "menuUrl") VALUES($1, $2, $3, $4, $5, $6, $7, $8, $9, $10)';

  const values = [name, category, phoneNumber, menu, photoUrl, featureOne, featureTwo, runningTime, price, menuUrl];

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

app.get('/place_drink_alcohol', (req, res) => {
  fetchDataByCategory('술집', res);
});

app.get('/place_drink_caffeine', (req, res) => {
  fetchDataByCategory('카페', res);
});

app.get('/place_play_game', (req, res) => {
  fetchDataByCategory('PC방', res);
});

app.get('/place_sing', (req, res) => {
  fetchDataByCategory('노래방', res);
});

app.get('/place_exercise', (req, res) => {
  fetchDataByCategory('운동 시설', res);
});

app.get('/place_convenience', (req, res) => {
  fetchDataByCategory('편의점', res);
});

app.get('/place_book', (req, res) => {
  fetchDataByCategory('책방', res);
});

app.get('/place_laundry', (req, res) => {
  fetchDataByCategory('빨래방', res);
});

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
