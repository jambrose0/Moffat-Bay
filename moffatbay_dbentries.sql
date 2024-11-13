-- Insert data into the Guests table
INSERT INTO guests (first_name, last_name, email, phone, password) VALUES
('Gus', 'Garcia', 'gusser.garcia@gmail.com', '7131112245', 'H0u$ton45!'),
('Charlie', 'Mendez', 'good.boy24@gmail.com', '8324787100', 'B0ne$4lyfe'),
('Nova', 'Brown', 'nova.brown@gmail.com', '2814444569', 'Qca3fy!t')
;



-- Insert data into the Rooms table
INSERT INTO rooms (room_type, price, adult_guest, child_guest) VALUES
('double full beds', 120.00, 2, 2),
('single queen bed', 135.00, 2, 1),
('double queen beds', 150.00, 4, 2),
('single king bed', 160.00, 2, 1),
('double full beds', 120.00, 2, 2),
('single queen bed', 135.00, 2, 1),
('double queen beds', 150.00, 4, 2),
('single king bed', 160.00, 2, 1),
('single queen bed', 135.00, 2, 1);

-- Insert data into the Bookings table
INSERT INTO bookings (guest_id, room_id, check_in, check_out, guest_count, adult_guest, child_guest) VALUES
(1, 1, '2024-11-05', '2024-11-07', 3, 2, 1),
(2, 2, '2024-11-10', '2024-11-12', 5, 2, 3),
(3, 3, '2024-11-15', '2024-11-20', 4, 2, 2),
(4, 4, '2024-11-18', '2024-11-21', 3, 2, 1),
(5, 5, '2024-11-24', '2024-11-27', 1, 1, 0),
(6, 6, '2024-11-24', '2024-11-26', 5, 3, 2),
(7, 7, '2024-12-06', '2024-12-08', 6, 3, 3),
(8, 8, '2024-12-12', '2024-12-14', 2, 2, 0),
(9, 9, '2024-12-15', '2024-12-20', 3, 2, 1);
