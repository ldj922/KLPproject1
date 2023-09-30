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
