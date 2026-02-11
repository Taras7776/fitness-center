-- ============================================
-- Views Script: Fitness Center Management System (Fixed)
-- Author: Taras Lozovii
-- ============================================

-- =====================
-- Horizontal view: shows only member names
-- =====================
CREATE OR REPLACE VIEW view_member_names AS
SELECT name, surname
FROM members;

SELECT * FROM view_member_names;

-- =====================
-- Vertical view: shows attendance after 2026-01-12
-- =====================
CREATE OR REPLACE VIEW view_recent_attendance AS
SELECT *
FROM attendance
WHERE attendance_date > '2026-01-12';

SELECT * FROM view_recent_attendance;

-- =====================
-- Mixed view: active members with contact info
-- =====================
CREATE OR REPLACE VIEW view_active_members_contact AS
SELECT m.member_id, m.name, m.surname, t.phone, t.email
FROM members m
JOIN trainers t ON t.trainer_id = m.member_id -- тестова прив'язка
WHERE m.member_id <= 5;

SELECT * FROM view_active_members_contact;

-- =====================
-- JOIN view: members and classes they attend
-- =====================
CREATE OR REPLACE VIEW view_members_classes AS
SELECT m.member_id, m.name, m.surname, c.class_id, c.class_name, a.attendance_date
FROM attendance a
JOIN members m ON a.member_id = m.member_id
JOIN classes c ON a.class_id = c.class_id;

SELECT * FROM view_members_classes;

-- =====================
-- Subquery view: classes with more than 5 attendees
-- =====================
CREATE OR REPLACE VIEW view_popular_classes AS
SELECT class_id, class_name
FROM classes
WHERE class_id IN (
    SELECT class_id
    FROM attendance
    GROUP BY class_id
    HAVING COUNT(*) > 5
);

SELECT * FROM view_popular_classes;

-- =====================
-- UNION view: combining two sets of attendance
-- =====================
CREATE OR REPLACE VIEW view_attendance_union AS
SELECT * FROM attendance WHERE attendance_date < '2026-01-13'
UNION
SELECT * FROM attendance WHERE attendance_date >= '2026-01-13';

SELECT * FROM view_attendance_union;

-- =====================
-- View based on another view: summary of attendance
-- =====================
CREATE OR REPLACE VIEW view_summary_attendance AS
SELECT class_id, class_name, COUNT(*) AS total_attendance
FROM view_members_classes
GROUP BY class_id, class_name;

SELECT * FROM view_summary_attendance;

-- =====================
-- View with CHECK OPTION: allow updates only on classes with capacity < 30
-- =====================
CREATE OR REPLACE VIEW view_updatable_classes AS
SELECT * FROM classes
WHERE max_capacity < 30
WITH CHECK OPTION;

SELECT * FROM view_updatable_classes;

-- ============================================
-- End of Views Script
-- ============================================
