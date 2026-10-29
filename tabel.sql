CREATE DATABASE petclinic_db

use petclinic_db;
CREATE TABLE pet_visits (
    id INT PRIMARY KEY AUTO_INCREMENT,
    owner_name VARCHAR(100),
    pet_type VARCHAR(20),
    charges DECIMAL(10,2),
    visit_date DATE
);