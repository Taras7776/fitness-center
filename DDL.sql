-- ============================================
-- Module: Classes, Trainers & Attendance
-- Author: Taras Lozovii
-- Project: Fitness Center Management System
-- DBMS: PostgreSQL
-- ============================================

-- =====================
-- Table: members 
-- =====================
CREATE TABLE members (
    member_id SERIAL PRIMARY KEY,
    name TEXT,
    surname TEXT
);
-- Примітка: спрощена таблиця для FK у attendance

-- =====================
-- Table: trainers
-- =====================
CREATE TABLE trainers (
    trainer_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    surname TEXT NOT NULL,
    specialization VARCHAR(100),
    phone VARCHAR(20),
    email VARCHAR(100)
);

-- =====================
-- Table: classes
-- =====================
CREATE TABLE classes (
    class_id SERIAL PRIMARY KEY,
    class_name VARCHAR(100) NOT NULL,
    class_schedule VARCHAR(100),
    trainer_id INT,
    max_capacity SMALLINT CHECK (max_capacity > 0),
    description TEXT,

    CONSTRAINT fk_classes_trainer
        FOREIGN KEY (trainer_id)
        REFERENCES trainers(trainer_id)
        ON DELETE SET NULL
);

-- =====================
-- Table: attendance
-- =====================
CREATE TABLE attendance (
    attendance_id SERIAL PRIMARY KEY,
    class_id INT NOT NULL,
    member_id INT NOT NULL,
    attendance_date DATE NOT NULL,
    
    CONSTRAINT fk_attendance_class
        FOREIGN KEY (class_id)
        REFERENCES classes(class_id)
        ON DELETE CASCADE,
        
    CONSTRAINT fk_attendance_member
        FOREIGN KEY (member_id)
        REFERENCES members(member_id)
        ON DELETE CASCADE
);

-- Indexes
CREATE INDEX idx_attendance_class_id ON attendance(class_id);
CREATE INDEX idx_attendance_member_id ON attendance(member_id);
CREATE INDEX idx_attendance_date ON attendance(attendance_date);
CREATE INDEX idx_classes_trainer_id ON classes(trainer_id);

-- ============================================
-- End of module: Taras Lozovii
-- ============================================
