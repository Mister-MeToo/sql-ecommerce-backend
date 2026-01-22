-- 1. Insert Users (Password hashes are just placeholders)
INSERT INTO users (first_name, last_name, email, password_hash) VALUES
('Alice', 'Smith', 'alice@email.com', 'hashed_pw_123'),
('Bob', 'Johnson', 'bob@email.com', 'hashed_pw_456'),
('Charlie', 'Davis', 'charlie@email.com', 'hashed_pw_789');

-- 2. Insert Categories
INSERT INTO categories (category_name) VALUES
('Electronics'),
('Home & Office'),
('Accessories');

-- 3. Insert Products
INSERT INTO products (category_id, name, description, price, stock_quantity) VALUES
(1, 'Mechanical Keyboard', 'RGB Backlit, Brown Switches', 89.99, 50),
(1, 'Wireless Mouse', 'Ergonomic 2.4GHz optical mouse', 25.50, 100),
(2, 'Standing Desk', 'Adjustable height motorized desk', 350.00, 10),
(3, 'USB-C Cable', '6ft braided fast-charging cable', 12.00, 200),
(1, 'Noise Cancelling Headphones', 'Over-ear Bluetooth headphones', 199.99, 15);

-- 4. Create an Order for Alice (User 1)
-- First, create the header
INSERT INTO orders (user_id, status, total_amount) 
VALUES (1, 'Delivered', 115.49);

-- Then, add the items for that order (Keyboard + Mouse)
INSERT INTO order_items (order_id, product_id, quantity, price_at_purchase) VALUES
(1, 1, 1, 89.99), -- Keyboard
(1, 2, 1, 25.50); -- Mouse

-- 5. Create an Order for Bob (User 2)
-- Header
INSERT INTO orders (user_id, status, total_amount) 
VALUES (2, 'Processing', 350.00);

-- Items (Standing Desk)
INSERT INTO order_items (order_id, product_id, quantity, price_at_purchase) VALUES
(2, 3, 1, 350.00);