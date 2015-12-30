SQL EXAMPLES
============

Join by foreign key column
--------------------------

		CREATE TABLE roles(
			role_id INT AUTO_INCREMENT PRIMARY KEY,
			role_name varchar(100)
		);

		INSERT INTO roles(`role_id`, `role_name`) VALUES
			(1, 'agent'),
			(2, 'view_all_cases'),
			(3, 'view_confidential'),
			(4, 'view_restricted'),
			(5, 'edit_confidential'),
			(6, 'edit_restricted');

		-- SELECT * FROM roles;

		CREATE TABLE users(
			user_id INT AUTO_INCREMENT PRIMARY KEY,
			username varchar(100),
			role_id INT,
			FOREIGN KEY(role_id) REFERENCES roles(role_id)
		);

		INSERT INTO users(`user_id`,`username`,`role_id`) VALUES
		(111, 'System Admin', 1),
		(112, 'System Admin', 2),
		(113, 'System Admin', 3);

		INSERT INTO users(`user_id`,`username`,`role_id`) VALUES
		(114, 'Case Manager', 2),
		(115, 'Case Manager', 4),
		(116, 'Case Manager', 5),
		(117, 'Case Manager', 6);

		SELECT * FROM users;

		SELECT * FROM users JOIN roles USING(role_id);

*   This joins on column 'role_id'


Join by arbitrary column
------------------------
		CREATE TABLE roles(
			role_id INT AUTO_INCREMENT PRIMARY KEY,
			role_name varchar(100)
		);

		INSERT INTO roles(`role_id`, `role_name`) VALUES
			(1, 'agent'),
			(2, 'view_all_cases'),
			(3, 'view_confidential'),
			(4, 'view_restricted'),
			(5, 'edit_confidential'),
			(6, 'edit_restricted');

		-- SELECT * FROM roles;

		CREATE TABLE users(
			user_id INT AUTO_INCREMENT PRIMARY KEY,
			username varchar(100),
			role_name varchar(100),
			INDEX (role_name)
		);

		INSERT INTO users(`user_id`,`username`,`role_name`) VALUES
		(111, 'System Admin', 'agent'),
		(112, 'System Admin', 'view_all_cases'),
		(113, 'System Admin', 'edit_confidential'),
		(114, 'Case Manager', 'view_all_cases'),
		(115, 'Case Manager', 'view_confidential'),
		(116, 'Case Manager', 'view_restricted'),
		(117, 'Case Manager', 'edit_restricted');

		SELECT * FROM users JOIN roles USING(role_name);

*   allows you to basically create arrays - in the instance above, a 'roles' array
    with values linked to 'users'

*   Note: in postgres, INDEX is done via:

				CREATE INDEX ON roles (role);
