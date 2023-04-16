CREATE TABLE Stores (
  store_id INT NOT NULL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  address VARCHAR(255) NOT NULL,
  opening_hours TIME NOT NULL,
  is_open_all_day BOOLEAN NOT NULL,
  city_id INT NOT NULL,
  FOREIGN KEY (city_id) REFERENCES Cities(city_id)
);

CREATE TABLE Cities (
  city_id INT NOT NULL PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE Employees (
  emp_id INT NOT NULL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  phone VARCHAR(255) NOT NULL,
  store_id INT NOT NULL,
  FOREIGN KEY (store_id) REFERENCES Stores(store_id)
);

CREATE TABLE Drugs (
  drug_id INT NOT NULL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  description TEXT NOT NULL,
  price DECIMAL(10, 2) NOT NULL,
  manufacturer VARCHAR(255) NOT NULL
);

CREATE TABLE Customers (
  customer_id INT NOT NULL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  phone VARCHAR(255) NOT NULL,
  address VARCHAR(255) NOT NULL
);

CREATE TABLE Inventory (
  store_id INT NOT NULL,
  drug_id INT NOT NULL,
  quantity INT NOT NULL,
  expiry_date DATE NOT NULL,
  PRIMARY KEY (store_id, drug_id),
  FOREIGN KEY (store_id) REFERENCES Stores(store_id),
  FOREIGN KEY (drug_id) REFERENCES Drugs(drug_id)
);

CREATE TABLE Receipts (
  receipt_id INT NOT NULL PRIMARY KEY,
  date DATE NOT NULL,
  customer_id INT NOT NULL,
  store_id INT NOT NULL,
  total_price DECIMAL(10, 2) NOT NULL,
  FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
  FOREIGN KEY (store_id) REFERENCES Stores(store_id)
);

CREATE TABLE Receipt_Items (
  receipt_id INT NOT NULL,
  drug_id INT NOT NULL,
  quantity INT NOT NULL,
  price DECIMAL(10, 2) NOT NULL,
  PRIMARY KEY (receipt_id, drug_id),
  FOREIGN KEY (receipt_id) REFERENCES Receipts(receipt_id),
  FOREIGN KEY (drug_id) REFERENCES Drugs(drug_id)
);

CREATE TABLE Payment_Methods (
  payment_method_id INT NOT NULL PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);
