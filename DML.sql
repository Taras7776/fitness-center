-- ============================================
-- DML Script: Classes, Trainers & Attendance
-- Author: Taras Lozovii
-- Project: Fitness Center Management System
-- DBMS: PostgreSQL
-- ============================================

-- =====================
-- Очищення таблиць перед вставкою
-- =====================
TRUNCATE TABLE attendance RESTART IDENTITY CASCADE;
TRUNCATE TABLE classes RESTART IDENTITY CASCADE;
TRUNCATE TABLE trainers RESTART IDENTITY CASCADE;
TRUNCATE TABLE members RESTART IDENTITY CASCADE;

-- =====================
-- TEMP MEMBERS (for FK integrity only)
-- =====================
INSERT INTO members (member_id, name, surname) VALUES
(1, 'Test', 'User1'),
(2, 'Test', 'User2'),
(3, 'Test', 'User3'),
(4, 'Test', 'User4'),
(5, 'Test', 'User5'),
(6, 'Test', 'User6'),
(7, 'Test', 'User7'),
(8, 'Test', 'User8'),
(9, 'Test', 'User9'),
(10, 'Test', 'User10');

-- =====================
-- TRAINERS
-- =====================
INSERT INTO trainers (trainer_id, name, surname, specialization, phone, email) VALUES
(1, 'John', 'Smith', 'Fitness Trainer', '+380501111111', 'john.smith@gym.com'),
(2, 'Anna', 'Brown', 'Yoga Instructor', '+380502222222', 'anna.brown@gym.com'),
(3, 'Mark', 'Wilson', 'CrossFit Coach', '+380503333333', 'mark.wilson@gym.com'),
(4, 'Emily', 'Taylor', 'Pilates Trainer', '+380504444444', 'emily.taylor@gym.com'),
(5, 'David', 'Anderson', 'Boxing Coach', '+380505555555', 'david.anderson@gym.com'),
(6, 'Sophia', 'Moore', 'Dance Trainer', '+380506666666', 'sophia.moore@gym.com'),
(7, 'Chris', 'Martin', 'Strength Coach', '+380507777777', 'chris.martin@gym.com'),
(8, 'Laura', 'Clark', 'Rehab Trainer', '+380508888888', 'laura.clark@gym.com'),
(9, 'Daniel', 'Walker', 'HIIT Trainer', '+380509999999', 'daniel.walker@gym.com'),
(10, 'Kate', 'Hall', 'Cardio Trainer', '+380500000000', 'kate.hall@gym.com');

-- =====================
-- CLASSES
-- =====================
INSERT INTO classes (class_id, class_name, class_schedule, trainer_id, max_capacity, description) VALUES
(1, 'Morning Fitness', 'Mon 08:00', 1, 20, 'General fitness training'),
(2, 'Yoga Flow', 'Tue 10:00', 2, 15, 'Relaxing yoga session'),
(3, 'CrossFit Blast', 'Wed 18:00', 3, 25, 'High intensity CrossFit'),
(4, 'Pilates Core', 'Thu 09:00', 4, 15, 'Core strength pilates'),
(5, 'Boxing Basics', 'Fri 19:00', 5, 20, 'Intro boxing class'),
(6, 'Dance Cardio', 'Sat 12:00', 6, 30, 'Dance + cardio mix'),
(7, 'Strength Pro', 'Mon 17:00', 7, 20, 'Strength training'),
(8, 'Rehab Fit', 'Tue 14:00', 8, 10, 'Rehabilitation training'),
(9, 'HIIT Power', 'Wed 20:00', 9, 25, 'HIIT training'),
(10, 'Cardio Burn', 'Sun 11:00', 10, 30, 'Fat burn cardio');

-- =====================
-- ATTENDANCE
-- =====================
INSERT INTO attendance (attendance_id, class_id, member_id, attendance_date) VALUES
(1, 1, 1, '2026-01-10'),
(2, 1, 2, '2026-01-10'),
(3, 2, 3, '2026-01-11'),
(4, 2, 4, '2026-01-11'),
(5, 3, 5, '2026-01-12'),
(6, 4, 6, '2026-01-12'),
(7, 5, 7, '2026-01-13'),
(8, 6, 8, '2026-01-13'),
(9, 7, 9, '2026-01-14'),
(10, 8, 10, '2026-01-14'); -- останній рядок залишаємо

-- =====================
-- UPDATE EXAMPLE
-- =====================
UPDATE classes
SET max_capacity = 35
WHERE class_name = 'Dance Cardio';

-- =====================
-- SELECT для перевірки даних (зручно для відео)
-- =====================
SELECT * FROM members;
SELECT * FROM trainers;
SELECT * FROM classes;
SELECT * FROM attendance;

-- ============================================
-- End of DML Script
-- ============================================
