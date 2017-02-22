CREATE TABLE departments (
  id INTEGER AUTO_INCREMENT NOT NULL,
  department_name VARCHAR(20),
  over_head_costs DECIMAL(10,4),
  PRIMARY KEY (id)
);

INSERT INTO departments (department_name, over_head_costs)
VALUES ("Technology", 8000);

INSERT INTO departments (department_name, over_head_costs)
VALUES ("Home Improvement", 1000);

INSERT INTO departments (department_name, over_head_costs)
VALUES ("Automotive", 10000);

CREATE TABLE products (
  id INTEGER AUTO_INCREMENT NOT NULL UNIQUE,
  product_name VARCHAR(20),
  price DECIMAL(10,4),
  stock_quantity INTEGER(11),
  department_id INTEGER NOT NULL,
  FOREIGN KEY (department_id) references departments (id),
  PRIMARY KEY (id)
);


INSERT INTO products (id, product_name, price, stock_quantity, department_id) VALUES 
(1, "Macbook Pro", 1500.0, 10, 1),
(2, "iPad Pro", 899.95, 10, 1),
(3, "Apple Pencil", 149.95, 10, 1),
(4, "Amazon Echo", 500.0, 10, 1),
(5, "Phantom Drone", 1999.95, 4, 1),
(6, "Beats by Dre", 199.95, 20, 1),
(7, "Windshield Wipers", 29.95, 40, 3),
(8, "Synthetic Oil", 49.95, 40, 3),
(9, "Jump Starter Battery Pack", 69.95, 30, 3),
(10, "License Plate Frame", 14.99, 30, 3),
(11, "Keurig", 149.95, 40, 2),
(12, "Refrigerator", 499.95, 20, 2),
(13, "Coffee Grinder", 149.95, 40, 2),
(14, "Deluxe Carpet Cleaner", 299.95, 100, 2);

CREATE TABLE sales (
  id INTEGER AUTO_INCREMENT NOT NULL UNIQUE,
  product_id INTEGER NOT NULL,
  quantity_purchased INTEGER,
  created_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (product_id) references products(id),
  PRIMARY KEY (id)
);


