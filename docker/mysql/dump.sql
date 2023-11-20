CREATE DATABASE beesafe;
USE beesafe;

CREATE USER 'beesafe'@'172.20.0.2' IDENTIFIED BY 'i^HB9#EE9Vvk2ZF2b';
GRANT ALL PRIVILEGES ON beesafe.* TO 'beesafe'@'172.20.0.2';
FLUSH PRIVILEGES;

CREATE TABLE IF NOT EXISTS pages (
  id INT(4) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(30),
  content TEXT,
  INDEX(title)
) engine=InnoDB;

INSERT IGNORE INTO pages VALUES (1, 'Bienvenue', 'Bienvenue sur la nouvelle page de votre nouveau site web institutionnel');
