-- Create Product table
CREATE TABLE product (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    SKU VARCHAR(50),
    category_id INT,
    inventory_id INT,
    price DECIMAL(10, 2) NOT NULL,
    discount_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP
);

-- Create Product Category table
CREATE TABLE product_category (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP
);

-- Create Product Inventory table
CREATE TABLE product_inventory (
    id SERIAL PRIMARY KEY,
    quantity INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP
);

-- Create Discount table
CREATE TABLE discount (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    discount_percent DECIMAL(5, 2) NOT NULL,
    active BOOLEAN DEFAULT TRUE,
    deleted_at TIMESTAMP
);

-- Add foreign key constraints
ALTER TABLE product
    ADD CONSTRAINT fk_product_category
    FOREIGN KEY (category_id)
    REFERENCES product_category(id);

ALTER TABLE product
    ADD CONSTRAINT fk_product_inventory
    FOREIGN KEY (inventory_id)
    REFERENCES product_inventory(id);

ALTER TABLE product
    ADD CONSTRAINT fk_discount
    FOREIGN KEY (discount_id)
    REFERENCES discount(id);
