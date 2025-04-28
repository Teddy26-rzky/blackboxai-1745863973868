-- Database schema for bale's room

CREATE DATABASE IF NOT EXISTS bales_room CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE bales_room;

-- Table users
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role ENUM('user', 'admin') NOT NULL DEFAULT 'user'
);

-- Table rooms
CREATE TABLE IF NOT EXISTS rooms (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    deskripsi TEXT,
    harga INT NOT NULL,
    status ENUM('available', 'maintenance') NOT NULL DEFAULT 'available',
    foto VARCHAR(255) DEFAULT NULL
);

-- Table bookings
CREATE TABLE IF NOT EXISTS bookings (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    room_id INT NOT NULL,
    tanggal_booking DATE NOT NULL,
    status ENUM('pending', 'confirmed', 'cancelled') NOT NULL DEFAULT 'pending',
    invoice_url VARCHAR(255) DEFAULT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (room_id) REFERENCES rooms(id)
);

-- Insert initial rooms
INSERT INTO rooms (nama, deskripsi, harga, status) VALUES
('studio', 'Kamar studio nyaman', 300000, 'available'),
('bed', 'Kamar bed nyaman', 350000, 'available');
