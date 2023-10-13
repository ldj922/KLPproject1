CREATE TABLE raitto_store (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    category VARCHAR(255),
    phoneNumber VARCHAR(255),
    menu TEXT[],
    photoUrl VARCHAR(255),
    featureOne TEXT[],
    featureTwo TEXT,
    storeAddress TEXT,
    runningTime TEXT[],
    price TEXT[],
    menuUrl TEXT[],
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE store_popularity (
    store_id INT REFERENCES raitto_store(id),
    count INT DEFAULT 1,
    PRIMARY KEY (store_id)
);

CREATE TABLE user_search_history (
    user_id INT,  
    search_term VARCHAR(255),
    count INT DEFAULT 1,
    PRIMARY KEY (user_id, search_term)
);
