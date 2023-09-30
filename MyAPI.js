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

let knownCategories = [];
let knownMenus = [];

const fetchCategoriesAndMenus = async () => {
    try {
        const categoryResults = await pool.query('SELECT DISTINCT category FROM raitto_store;');
        knownCategories = categoryResults.rows.map(row => row.category);

        const menuResults = await pool.query('SELECT DISTINCT unnest(menu) as menu_item FROM raitto_store;');
        knownMenus = [...new Set(menuResults.rows.map(row => row.menu_item))];

    } catch (err) {
        console.error('Error fetching categories and menus:', err);
    }
};

fetchCategoriesAndMenus(); // 서버 시작 시 실행

app.use(cors());
app.use(express.urlencoded({ extended: true }));
app.use(express.json());

app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, 'index.html'));
});

app.post('/save_store', (req, res) => {
    const { name, category, phoneNumber, menu: rawMenu, photoUrl, featureTwo, storeAddress, runningTime: rawRunningTime, price: rawPrice, menuUrl: rawMenuUrl, featureOne: rawFeatureOne } = req.body;
    
    const menu = rawMenu.split(',').map(tag => tag.trim());
    const runningTime = rawRunningTime.split(',').map(tag => tag.trim());
    const price = rawPrice.split(',').map(tag => tag.trim());
    const menuUrl = rawMenuUrl.split(',').map(tag => tag.trim());
    const featureOne = rawFeatureOne.split(',').map(tag => tag.trim());

    const query = 'INSERT INTO raitto_store(name, category, "phoneNumber", menu, "photoUrl", "featureTwo", "storeAddress", "runningTime", price, "menuUrl", "featureOne") VALUES($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11)';
    const values = [name, category, phoneNumber, menu, photoUrl, featureTwo, storeAddress, runningTime, price, menuUrl, featureOne];

    pool.query(query, values, async (err) => {
        if (err) {
            console.error('Error inserting data:', err);
            res.status(500).send('Internal Server Error');
        } else {
            console.log('데이터가 성공적으로 추가되었습니다.');
            await fetchCategoriesAndMenus();
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

const categoryRoutes = {
    '/place_restaurant': '식당',
    '/place_drink_alcohol': '술집',
    '/place_drink_caffeine': '카페',
    '/place_play_game': 'PC방',
    '/place_sing': '노래방',
    '/place_exercise': '운동 시설',
    '/place_convenience': '편의점',
    '/place_book': '책방',
    '/place_laundry': '빨래방',
};

for (let [route, category] of Object.entries(categoryRoutes)) {
    app.get(route, (req, res) => {
        fetchDataByCategory(category, res);
    });
}

app.get('/search', (req, res) => {
    const searchTerm = req.query.keyword;

    let searchQuery, queryParams;

    if (knownCategories.includes(searchTerm)) {
        searchQuery = 'SELECT * FROM raitto_store WHERE category = $1';
        queryParams = [searchTerm];
    } else if (knownMenus.includes(searchTerm)) {
        searchQuery = 'SELECT * FROM raitto_store WHERE $1 = ANY(menu)';
        queryParams = [searchTerm];
    } else {
        searchQuery = 'SELECT * FROM raitto_store WHERE name LIKE $1';
        queryParams = [`%${searchTerm}%`];
    }

    pool.query(searchQuery, queryParams, (err, result) => {
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
