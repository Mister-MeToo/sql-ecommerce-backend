1. The "Stock Warning" (Operational Insight)
Business Goal: Find out which products are running low so we can restock.

SELECT 
    name, 
    stock_quantity 
FROM products 
WHERE stock_quantity < 20
ORDER BY stock_quantity ASC;''

2. The "Best Sellers" (Sales Insight)
Business Goal: Identify the top 3 most popular products by quantity sold.
SELECT 
    p.name, 
    SUM(oi.quantity) AS total_sold
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.name
ORDER BY total_sold DESC
LIMIT 3;

3. "Customer Lifetime Value" (Marketing Insight)
Business Goal: Find out who our "VIP" customers are (who has spent the most money?).
SELECT 
    u.first_name, 
    u.last_name, 
    SUM(o.total_amount) AS total_spent
FROM users u
JOIN orders o ON u.user_id = o.user_id
WHERE o.status != 'Cancelled'
GROUP BY u.user_id, u.first_name, u.last_name
ORDER BY total_spent DESC;

4. "Revenue by Category" (Strategic Insight)
Business Goal: Which department is making the most money?

SELECT 
    c.category_name, 
    SUM(oi.quantity * oi.price_at_purchase) AS revenue
FROM categories c
JOIN products p ON c.category_id = p.category_id
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY c.category_name
ORDER BY revenue DESC;

5. The "Empty Cart" Problem (UX Insight)
Business Goal: Identify users who have registered but have never placed an order.
SELECT 
    u.first_name, 
    u.last_name, 
    u.email
FROM users u
LEFT JOIN orders o ON u.user_id = o.user_id
WHERE o.order_id IS NULL;

