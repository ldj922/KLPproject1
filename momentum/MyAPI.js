const express = require('express');
const multer = require('multer');
const path = require('path');
const app = express();
const port = process.env.PORT || 3000;
const { Pool } = require('pg');

const raittoData = [];


const pool = new Pool({
  connectionString: process.env.DATABASE_URL,
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

app.use('/uploads', express.static(path.join(__dirname, 'uploads')));
app.use(express.urlencoded({ extended: true }));

//데이터베이스 코드



app.use('/uploads', express.static(path.join(__dirname, 'uploads')));
app.use(express.urlencoded({ extended: true }));

const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, 'uploads/');
  },
  filename: function (req, file, cb) {
    const originalFilename = file.originalname;
    const safeFilename = sanitizeFilename(originalFilename);
    cb(null, safeFilename);
  },
});

const upload = multer({ storage: storage });

const sanitizeFilename = (filename) => {
  return filename.replace(/[^a-zA-Z0-9-_\.]/g, '_');
};

app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, 'index.html'));
});

app.post('/save_store', upload.single('photo_url'), (req, res) => {
  const storeName = req.body.store_name;
  const category = req.body.category;
  const phoneNumber = req.body.phone_number;
  const menu = req.body.menu;
  const photoUrl = req.body.photo_url;

  const raittoDataInfo = {
    storeName,
    category,
    phoneNumber,
    menu,
    photoUrl,
  };

  raittoData.push(raittoDataInfo);
  
  console.log('데이터가 성공적으로 추가되었습니다.');

  const successPage = `
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>추가 성공</title>
    </head>
    <body>
        <h1>추가 성공</h1>
        <p>새로운 데이터가 추가되었습니다.</p>
        <a href="/">돌아가기</a>
    </body>
    </html>
  `;
  res.send(successPage);  
});

const filterData = (data) => {
  return data.map(item => {
    const { category, ...rest } = item;
    return rest;
  });
};

app.get('/place_restaurant', (req, res) => {
  const restaurants = raittoData.filter(item => item.category === '식당');
  res.json(filterData(restaurants));
});

app.get('/place_drink_alcohol', (req, res) => {
  const alcoholPlaces = raittoData.filter(item => item.category === '술집');
  res.json(filterData(alcoholPlaces));
});

app.get('/place_drink_caffeine', (req, res) => {
  const cafePlaces = raittoData.filter(item => item.category === '카페');
  res.json(filterData(cafePlaces));
});

app.get('/place_play_game', (req, res) => {
  const pcPlaces = raittoData.filter(item => item.category === 'PC방');
  res.json(filterData(pcPlaces));
});

app.get('/place_sing', (req, res) => {
  const karaokePlaces = raittoData.filter(item => item.category === '노래방');
  res.json(filterData(karaokePlaces));
});

app.get('/place_exercise', (req, res) => {
  const exercisePlaces = raittoData.filter(item => item.category === '운동 시설');
  res.json(filterData(exercisePlaces));
});

app.get('/place_convenience', (req, res) => {
  const convenienceStores = raittoData.filter(item => item.category === '편의점');
  res.json(filterData(convenienceStores));
});

app.get('/place_book', (req, res) => {
  const bookStores = raittoData.filter(item => item.category === '책방');
  res.json(filterData(bookStores));
});

app.get('/place_laundry', (req, res) => {
  const laundries = raittoData.filter(item => item.category === '빨래방');
  res.json(filterData(laundries));
});

app.listen(port, () => {
  console.log(`서버가 http://localhost:${port} 에서 실행 중입니다.`);
});