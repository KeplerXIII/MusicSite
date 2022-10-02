CREATE TABLE IF NOT EXISTS Departments (
	id SERIAL PRIMARY KEY,
	name VARCHAR(60) NOT NULL
);


CREATE TABLE IF NOT EXISTS Employees (
	id SERIAL PRIMARY KEY,
	name VARCHAR(60) NOT NULL
);

CREATE TABLE IF NOT EXISTS Directors (
	employee_id INTEGER PRIMARY KEY REFERENCES Employees(id),
	departament_id INTEGER REFERENCES Departments(id)
);

CREATE TABLE IF NOT EXISTS EmployeesInfo (
	employee_id INTEGER PRIMARY KEY REFERENCES Employees(id),
	departament_id INTEGER REFERENCES Departments(id),
	director_id INTEGER REFERENCES Directors(employee_id)
);