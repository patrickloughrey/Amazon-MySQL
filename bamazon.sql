CREATE TABLE departments (
  id INTEGER(11) AUTO_INCREMENT NOT NULL UNIQUE,
  department_name VARCHAR(30),
  over_head_costs INTEGER(11),
  PRIMARY KEY (id)
);

CREATE TABLE products (
  id INTEGER(11) AUTO_INCREMENT NOT NULL UNIQUE,
  product_name VARCHAR(30),
  FOREIGN KEY (department_id) references departments(id),
  price DECIMAL(10,4),
  stock_quantity INTEGER(11),
  PRIMARY KEY (id)
);

CREATE TABLE sales (
  id INTEGER(11) AUTO_INCREMENT NOT NULL UNIQUE,
  FOREIGN KEY (product_id) references products(id),
  quantity_purchased INTEGER(11),
  created_at TIMESTAMP(20)  
);

INSERT INTO departments (department_name, over_head_costs)
VALUES ("Technology", 8000);

INSERT INTO departments (department_name, over_head_costs)
VALUES ("Home Improvement", 1000);

INSERT INTO departments (department_name, over_head_costs)
VALUES ("Automotive", 10000);

INSERT INTO products (product_name, department_id, price, stock_quantity)
VALUES ("Macbook Pro", (SELECT id FROM departments WHERE department_name="Technology"), 1500.0, 5);

INSERT INTO products (product_name, department_id, price, stock_quantity)
VALUES ("iPad Pro", (SELECT id FROM departments WHERE department_name="Technology"), 899.95, 5);

INSERT INTO products (product_name, department_id, price, stock_quantity)
VALUES ("Apple Pencil", (SELECT id FROM departments WHERE department_name="Technology"), 149.95, 5);

INSERT INTO products (product_name, department_id, price, stock_quantity)
VALUES ("Amazon Echo", (SELECT id FROM departments WHERE department_name="Technology"), 500.0, 5);

INSERT INTO products (product_name, department_id, price, stock_quantity)
VALUES ("Phantom Drone", (SELECT id FROM departments WHERE department_name="Technology"), 1999.95, 2);

INSERT INTO products (product_name, department_id, price, stock_quantity)
VALUES ("Beats by Dre", (SELECT id FROM departments WHERE department_name="Technology"), 199.95, 10);

INSERT INTO products (product_name, department_id, price, stock_quantity)
VALUES ("Windshield Wipers", (SELECT id FROM departments WHERE department_name="Automotive"), 29.95, 20);

INSERT INTO products (product_name, department_id, price, stock_quantity)
VALUES ("Synthetic Oil", (SELECT id FROM departments WHERE department_name="Automotive"), 49.95, 20);

INSERT INTO products (product_name, department_id, price, stock_quantity)
VALUES ("Jump Starter Battery Pack", (SELECT id FROM departments WHERE department_name="Automotive"), 69.95, 10);

INSERT INTO products (product_name, department_id, price, stock_quantity)
VALUES ("License Plate Frame", (SELECT id FROM departments WHERE department_name="Automotive"), 14.99, 20);

INSERT INTO products (product_name, department_id, price, stock_quantity)
VALUES ("Keurig", (SELECT id FROM departments WHERE department_name="Home Improvement"), 149.95, 10);

INSERT INTO products (product_name, department_id, price, stock_quantity)
VALUES ("Refrigerator", (SELECT id FROM departments WHERE department_name="Home Improvement"), 499.95, 10);

INSERT INTO products (product_name, department_id, price, stock_quantity)
VALUES ("Coffee Grinder", (SELECT id FROM departments WHERE department_name="Home Improvement"), 149.95, 20);

INSERT INTO products (product_name, department_id, price, stock_quantity)
VALUES ("Deluxe Carpet Cleaner", (SELECT id FROM departments WHERE department_name="Home Improvement"), 299.95, 10);




