 -- Create the database
CREATE DATABASE cosmetics_management;

-- Connect to the database
\c cosmetics_management;

-- Table: Clients
-- Stores information about clients (individuals or businesses)
CREATE TABLE clients (
    client_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    address TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table: Suppliers
-- Stores information about suppliers providing products
CREATE TABLE suppliers (
    supplier_id SERIAL PRIMARY KEY,
    company_name VARCHAR(100) NOT NULL,
    contact_name VARCHAR(100),
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    address TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table: Products
-- Stores details of cosmetic products
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    category VARCHAR(50),
    price DECIMAL(10, 2) NOT NULL CHECK (price >= 0),
    supplier_id INT REFERENCES suppliers(supplier_id) ON DELETE SET NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table: Stock
-- Tracks inventory levels for products
CREATE TABLE stock (
    stock_id SERIAL PRIMARY KEY,
    product_id INT UNIQUE REFERENCES products(product_id) ON DELETE CASCADE,
    quantity INT NOT NULL CHECK (quantity >= 0),
    location VARCHAR(100),
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table: Sales
-- Records sales transactions
CREATE TABLE sales (
    sale_id SERIAL PRIMARY KEY,
    client_id INT REFERENCES clients(client_id) ON DELETE SET NULL,
    product_id INT REFERENCES products(product_id) ON DELETE SET NULL,
    quantity INT NOT NULL CHECK (quantity > 0),
    sale_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10, 2) NOT NULL CHECK (total_amount >= 0)
);

-- Table: Configurations
-- Stores dynamic data for extensibility (e.g., new modules)
CREATE TABLE configurations (
    config_id SERIAL PRIMARY KEY,
    module_name VARCHAR(50) NOT NULL,
    config_data JSONB NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Indexes for performance
CREATE INDEX idx_client_email ON clients(email);
CREATE INDEX idx_supplier_email ON suppliers(email);
CREATE INDEX idx_product_supplier ON products(supplier_id);
CREATE INDEX idx_sale_client ON sales(client_id);
CREATE INDEX idx_sale_product ON sales(product_id);

-- Example: Insert initial configuration data
INSERT INTO configurations (module_name, config_data)
VALUES ('settings', '{"theme": "default", "currency": "USD"}');
