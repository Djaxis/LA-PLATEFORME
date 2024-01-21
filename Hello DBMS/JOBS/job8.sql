/* JOB 8 */

-- 1. Créez la base de données SomeCompany à l’aide d’une requête, ajoutez une condition sur l'existence de SomeCompany.*/
CREATE DATABASE IF NOT EXISTS SomeCompany;
USE SomeCompany;


--SET FOREIGN_KEY_CHECKS=0;: Cette commande désactive temporairement la vérification des clés étrangères. 
-- Cela peut être utile lorsque vous prévoyez de supprimer des tables ou de modifier des contraintes de clé étrangère. 
-- La désactivation temporaire des vérifications permet de contourner les erreurs liées à la vérification des contraintes 
-- de clé étrangère pendant les opérations.

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS Departments;
DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Project;
SET FOREIGN_KEY_CHECKS=1; 
-- SET FOREIGN_KEY_CHECKS=1;: Cette commande réactive la vérification des clés étrangères après les opérations précédentes.

-- 2. Créez la table Employees.
CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    birthdate DATE,
    position VARCHAR(50),
    department_id INT
);

INSERT INTO Employees (employee_id, first_name, last_name, birthdate, position, department_id) VALUES
(1, 'John', 'Doe', '1990-05-15', 'Software Engineer', 1),
(2, 'Jane', 'Smith', '1985-08-20', 'Project Manager', 2),
(3, 'Mike', 'Johnson', '1992-03-10', 'Data Analyst', 1),
(4, 'Emily', 'Brown', '1988-12-03', 'UX Designer', 1),
(5, 'Alex', 'Williams', '1995-06-28', 'Software Developer', 1),
(6, 'Sarah', 'Miller', '1987-09-18', 'HR Specialist', 3),
(7, 'Ethan', 'Clark', '1991-02-14', 'Database Administrator', 1),
(8, 'Olivia', 'Garcia', '1984-07-22', 'Marketing Manager', 2),
(9, 'Emilia', 'Clark', '1986-01-12', 'HR Manager', 3),
(10, 'Daniel', 'Taylor', '1993-11-05', 'Systems Analyst', 1),
(11, 'William', 'Lee', '1994-08-15', 'Software Engineer', 1),
(12, 'Sophia', 'Baker', '1990-06-25', 'IT Manager', 2);

-- 3. Créez la table Departments.
CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50),
    department_head INT,
    location VARCHAR(50)
);

INSERT INTO Departments (department_id, department_name, department_head, location) VALUES
(1, 'IT', 11, 'Headquarters'),
(2, 'Project Management', 2, 'Branch Office West'),
(3, 'Human Resources', 6, 'Branch Office East');

ALTER TABLE Departments
ADD FOREIGN KEY (department_head) REFERENCES Employees(employee_id);

ALTER TABLE Employees
ADD FOREIGN KEY (department_id) REFERENCES Departments(department_id);

-- 4. Insérez 6 à 9 nouveaux employés dans la table Employees.
-- Nouvelle liste d'enregistrements pour Employees
INSERT INTO Employees (id, first_name, last_name, birth_date, job_title, department_id)
VALUES
(13, 'Alice', 'Johnson', '1987-06-05', 'Sales Manager', 2),
(14, 'Bob', 'Smith', '1974-07-23', 'Marketing Specialist', 3),
(15, 'Laura', 'Martin', '1986-01-18', 'Project Coordinator', 2),
(16, 'Ethan', 'Clark', '1998-11-16', 'UX/UI Designer', 1),
(17, 'Olivia', 'Taylor', '1995-09-20', 'Software Developer', 1),
(18, 'Daniel', 'Brown', '1999-03-23', 'Marketing Assistant', 3),
(19, 'Sophia', 'Anderson', '1983-12-03', 'Web Developer', 1),
(20, 'Henry', 'Williams', '1979-08-10', 'System Administrator', 1),
(21, 'Emma', 'Davis', '1996-01-24', 'Recruitment Partner', 3);


-- 5. Récupérez le nom et le poste de tous les employés.
SELECT CONCAT(first_name, ' ', last_name) AS name, position FROM Employees;

-- 6. Mettez à jour le poste d’un employé dans la table Employees.
UPDATE Employees
SET position = 'Software Developer'
WHERE employee_id = 5;

-- 7. Supprimez un employé de la table Employees.
DELETE FROM Employees
WHERE employee_id = 2;

-- 8. Affichez le nom, le département et le bureau de chaque employé.
SELECT CONCAT(e.first_name, ' ', e.last_name) AS name, d.department_name, d.location
FROM Employees e
JOIN Departments d ON (e.department_id = d.department_id);

-- 9. Affichez, à l’aide d’un filtre, les membres de l’équipe IT, puis le management, puis les ressources humaines.
SELECT CONCAT(e.first_name, ' ', e.last_name) AS 'IT team'
FROM Employees e
JOIN Departments d ON (e.department_id = d.department_id)
WHERE d.department_name = 'IT';

SELECT CONCAT(e.first_name, ' ', e.last_name) AS 'Management team'
FROM Employees e
JOIN Departments d ON (e.department_id = d.department_id)
WHERE d.department_name = 'Manager';

SELECT CONCAT(e.first_name, ' ', e.last_name) AS 'HR team'
FROM Employees e
JOIN Departments d ON (e.department_id = d.department_id)
WHERE d.department_name = 'HR';

-- 10. Affichez les départements de SomeCompany dans l’ordre alphabétique, avec les managers respectifs de chaque département.
SELECT department_name, CONCAT(first_name, ' ', last_name) as Manager
FROM Departments d
JOIN Employees e ON (d.department_head = e.employee_id)
ORDER BY department_name;

-- 11.Ajoutez un nouveau département à la table Department (Marketing peut-être?), 

INSERT INTO Departments (department_id, department_name, location) VALUES
(4, 'Marketing', 'Branch SUD Office');
-- ajoutez ou mettez à jour les employés de ce nouveau département.
UPDATE Employees
SET department_id = 4
WHERE employee_id IN (5, 16, 11, 21);

-- 12.Créez une nouvelle table Project : project_id (INT, PK), project_name (VARCHAR), start_date (DATE), end_date (DATE), departement_id (INT, FK).
CREATE TABLE Project (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100),
    start_date DATE,
    end_date DATE,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

-- Ajoutez des observations à cette nouvelle table
INSERT INTO Project (project_id, project_name, start_date, end_date, department_id) VALUES
(201, 'Database Optimization', '2022-01-05', '2022-02-15', 2),
(202, 'Mobile App Development', '2022-02-10', '2022-05-20', 3),
(203, 'Customer Feedback Analysis', '2022-03-15', '2022-04-30', 1),
(204, 'Website Redesign', '2022-04-01', '2022-06-01', 4),
(205, 'Data Security Enhancement', '2022-05-10', '2022-07-15', 2),
(206, 'Product Launch Campaign', '2022-06-15', '2022-08-15', 4),
(207, 'AI Integration Project', '2022-07-01', '2022-09-30', 1),
(208, 'Social Media Marketing', '2022-08-10', '2022-09-30', 3),
(209, 'E-commerce Platform Upgrade', '2022-09-15', '2022-12-01', 4),
(210, 'Internal Training Program', '2022-10-01', '2022-11-30', 2),
(211, 'New Product Development', '2022-11-05', '2023-01-15', 3),
(212, 'Financial Reporting System', '2022-12-10', '2023-03-01', 1),
(213, 'Cybersecurity Audit', '2023-01-15', '2023-03-15', 2),
(214, 'Global Expansion Strategy', '2023-02-01', '2023-05-31', 4),
(215, 'Employee Wellness Program', '2023-03-10', '2023-05-15', 2),
(216, 'Supply Chain Optimization', '2023-04-15', '2023-07-01', 3),
(217, 'Brand Recognition Campaign', '2023-05-01', '2023-06-30', 4),
(218, 'Cloud Migration Project', '2023-06-15', '2023-09-01', 1),
(219, 'Collaboration Platform Implementation', '2023-07-10', '2023-09-30', 3),
(220, 'Customer Support Enhancement', '2023-08-01', '2023-10-15', 2);


-- Analysez la productivité des départements en IT et du nouveau département créé précédemment.
SELECT 
    d.department_name,
    COUNT(p.project_id) AS num_projects,
    ROUND(AVG(DATEDIFF(p.end_date, p.start_date))) AS average_duration
FROM Project p
JOIN Departments d ON p.department_id = d.department_id
WHERE d.department_name IN ('IT', 'Marketing')
GROUP BY d.department_name;

