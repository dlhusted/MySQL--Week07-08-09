DROP TABLE IF EXISTS project_category;
DROP TABLE IF EXISTS material;
DROP TABLE IF EXISTS step;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS project;


CREATE TABLE project (
	project_id INT AUTO_INCREMENT NOT NULL,
	project_name VARCHAR(128) NOT NULL,
	estimated_hours DECIMAL(7,2),
	actual_hours DECIMAL(7,2),
	difficulty INT,
	notes TEXT,
	PRIMARY KEY (project_id)
);

CREATE TABLE category (
	category_id INT AUTO_INCREMENT NOT NULL,
	category_name VARCHAR(128) NOT NULL,
	PRIMARY KEY (category_id)
);

CREATE TABLE step (
	step_id INT AUTO_INCREMENT NOT NULL,
	project_id INT NOT NULL,
	step_text TEXT NOT NULL,
	step_order INT NOT NULL,
	PRIMARY KEY (step_id),
	FOREIGN KEY (project_id) REFERENCES project (project_id) ON DELETE CASCADE
);

CREATE TABLE material (
	material_id INT AUTO_INCREMENT NOT NULL,
	project_id INT NOT NULL,
	material_name VARCHAR(128) NOT NULL,
	num_required INT,
	cost DECIMAL (7, 2),
	PRIMARY KEY (material_id),
	FOREIGN KEY (project_id) REFERENCES project (project_id) ON DELETE CASCADE
);

CREATE TABLE project_category ( /*join table*/
	project_id INT NOT NULL,
	category_id INT NOT NULL,
	FOREIGN KEY (project_id) REFERENCES project (project_id) ON DELETE CASCADE,
	FOREIGN KEY (category_id) REFERENCES category (category_id) ON DELETE CASCADE,
	UNIQUE KEY (project_id, category_id)
);

/*
add some data below
*/


INSERT INTO project (project_name, estimated_hours, actual_hours, difficulty, notes) VALUES ('Build a table', 15, 12.75, 4, 'make sure you have plenty of space');
INSERT INTO material (project_id, material_name, num_required, cost) VALUES (1, '2x4 wood planks', 10, 200.50);
INSERT INTO material (project_id, material_name, num_required, cost) VALUES (1, 'screws', 200, 35.50);
INSERT INTO material (project_id, material_name, num_required, cost) VALUES (1, 'glue', 1, 10.50);
INSERT INTO step (project_id, step_text, step_order) VALUES (1, 'cut wood to desired lengths', 1);
INSERT INTO step (project_id, step_text, step_order) VALUES (1, 'drill holes in wood where needed', 2);
INSERT INTO step (project_id, step_text, step_order) VALUES (1, 'add glue to wood pieces', 3);
INSERT INTO step (project_id, step_text, step_order) VALUES (1, 'screw wood pieces together and let glue dry', 4);
INSERT INTO category (category_id, category_name) VALUES (1, 'Tables and Chairs');
INSERT INTO project_category (project_id, category_id) VALUES (1, 1);




INSERT INTO project (project_name, estimated_hours, actual_hours, difficulty, notes) VALUES ('Hang a door', 1, 2.75, 1, 'make sure the door fits');
INSERT INTO material (project_id, material_name, num_required, cost) VALUES (1, 'door', 1, 3200.50);
INSERT INTO material (project_id, material_name, num_required, cost) VALUES (1, 'screws', 5, 5.50);
INSERT INTO step (project_id, step_text, step_order) VALUES (1, 'line the door up to the frame', 1);
INSERT INTO step (project_id, step_text, step_order) VALUES (1, 'screw the door to the hinges', 2);
INSERT INTO category (category_id, category_name) VALUES (1, 'Doors and Windows');
INSERT INTO project_category (project_id, category_id) VALUES (1, 1);















