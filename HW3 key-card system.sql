/*six users and four rooms: "101", "102", “Auditorium A” & “Auditorium B”
"IT": Modesto & Ayine: Room 101, 102 
"Sales": Christopher & Cheong woo: 102, A
"Admin": Saulat
"operation": no users
New employee: Heidy */

DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS rooms;
DROP TABLE IF EXISTS assign_department;
DROP TABLE IF EXISTS assign_room;

CREATE TABLE departments (
department_id real PRIMARY KEY,
department_name TEXT);
INSERT INTO departments(department_id, department_name)
VALUES
(1, 'IT'),
(2, 'Sales'),
(3, 'Administration'),
(4, 'Operations');

CREATE TABLE users(
user_id real PRIMARY KEY,
user_name TEXT);
INSERT INTO users(user_id, user_name)
VALUES 
(1, 'Modesto'),
(2, 'Ayine'),
(3, 'Christopher'),
(4, 'Cheong woo'),
(5, 'Saulat'),
(6, 'Heidy ');

CREATE TABLE assign_department(
department_id real,
user_id real);
INSERT INTO assign_department(department_id, user_id)
VALUES
(1,1),
(1,2),
(2,3),
(2,4),
(3,5);

CREATE TABLE rooms(
room_id real,
room_name text);
INSERT INTO rooms(room_id, room_name)
VALUES
(1, '101'),
(2, '102'),
(3, 'Auditorium A'),
(4, 'Auditorium B');

CREATE TABLE assign_room(
department_id real,
room_id real);
INSERT INTO assign_room(department_id,room_id)
VALUES
(1,1),
(1,2),
(2,2),
(2,3);

/*Q1:All groups, and the users in each group. A group should appear even if there are no users assigned to the group.*/

SELECT department_name, users.user_name 
From departments 
LEFT JOIN assign_department
ON departments.department_id = assign_department.department_id
LEFT JOIN users
ON users.user_id = assign_department.user_id;


/*Q2:All rooms, and the groups assigned to each room. The rooms should appear even if no groups have been assigned to them.*/

SELECT room_name, department_name
FROM rooms
LEFT JOIN assign_room 
ON rooms.room_id = assign_room.room_id
LEFT JOIN departments
ON assign_room.department_id = departments.department_id;



/*Q3:A list of users, the groups that they belong to, and the rooms to which they are assigned. This should be sorted alphabetically by user, then by group, then by room.*/

SELECT users.user_name, departments.department_name, rooms.room_name 
FROM users
LEFT JOIN assign_department
ON users.user_id = assign_department.user_id
LEFT JOIN departments
ON assign_department.department_id = departments.department_id
LEFT JOIN assign_room
on departments.department_id = assign_room.department_id
LEFT JOIN rooms
ON assign_room.room_id = rooms.room_id
ORDER BY users.user_name, departments.department_name, rooms.room_name;
