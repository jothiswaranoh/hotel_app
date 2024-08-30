-- Step 1: Create the users table first, as it is referenced by other tables
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    user_role_id INT, -- FK will be added later
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Step 2: Create the user_roles table next, since it only references the users table
CREATE TABLE user_roles (
    id SERIAL PRIMARY KEY,
    role_name VARCHAR(255) NOT NULL,
    created_by INT REFERENCES users(id),
    updated_by INT REFERENCES users(id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Step 3: Add the foreign key to the users table for user_role_id
ALTER TABLE users
    ADD CONSTRAINT fk_user_role_id FOREIGN KEY (user_role_id) REFERENCES user_roles(id),
    ADD COLUMN created_by INT REFERENCES users(id),
    ADD COLUMN updated_by INT REFERENCES users(id);

-- Step 4: Create the categories table
CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    category_name VARCHAR(255) NOT NULL,
    image_url TEXT,
    is_active BOOLEAN DEFAULT TRUE,
    created_by INT REFERENCES users(id),
    updated_by INT REFERENCES users(id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Step 5: Create the food table, since it references categories
CREATE TABLE food (
    id SERIAL PRIMARY KEY,
    category_id INT REFERENCES categories(id),
    image_url TEXT,
    price DECIMAL(10, 2) NOT NULL,
    is_active BOOLEAN DEFAULT TRUE,
    qty INT NOT NULL,
    created_by INT REFERENCES users(id),
    updated_by INT REFERENCES users(id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Step 6: Create the tables table
CREATE TABLE tables (
    id SERIAL PRIMARY KEY,
    table_number INT NOT NULL UNIQUE,
    table_position VARCHAR(255),
    created_by INT REFERENCES users(id),
    updated_by INT REFERENCES users(id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Step 7: Create the orders table, since it references food and tables
CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    table_id INT REFERENCES tables(id),
    food_id INT REFERENCES food(id),
    food_qty INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    instructions TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Step 8: Create the sessions table, which references users
CREATE TABLE sessions (
    id SERIAL PRIMARY KEY,
    ip VARCHAR(45),
    user_agent TEXT,
    user_id INT REFERENCES users(id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
