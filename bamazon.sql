CREATE TABLE departments (
  id INTEGER(11) AUTO_INCREMENT NOT NULL,
  department_name VARCHAR(30),
  over_head_costs INTEGER(11),
  PRIMARY KEY (id)
);

CREATE TABLE products (
  id INTEGER(11) AUTO_INCREMENT NOT NULL,
  product_name VARCHAR(30),
  FOREIGN KEY (department_id) references departments(id),
  price DECIMAL(10,4),
  stock_quantity INTEGER(11),
  PRIMARY KEY (id)
);

CREATE TABLE sales (
  id INTEGER(11) AUTO_INCREMENT NOT NULL,
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