Drop table user_roles;
Drop table users;

CREATE TABLE users (
    username VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL,
    full_name VARCHAR(50) NOT NULL,
    phone VARCHAR(8) NOT NULL,
    address VARCHAR(50) NOT NULL,
    PRIMARY KEY (username)
);

CREATE TABLE user_roles (
    user_role_id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
    username VARCHAR(50) NOT NULL,
    role VARCHAR(50) NOT NULL,
    PRIMARY KEY (user_role_id),
    FOREIGN KEY (username) REFERENCES users(username)
);

INSERT INTO users VALUES ('keith', '{noop}keithpw', 'keith Y','91234567','Hong Kong');
INSERT INTO user_roles(username, role) VALUES ('keith', 'ROLE_USER');
INSERT INTO user_roles(username, role) VALUES ('keith', 'ROLE_ADMIN');

INSERT INTO users VALUES ('vanessa', '{noop}vanessapw', 'vanessa B','61234867','Hong Kong');
INSERT INTO user_roles(username, role) VALUES ('vanessa', 'ROLE_ADMIN');

INSERT INTO users VALUES ('kevin', '{noop}kevinpw' , 'kevin H','48137694','Hong Kong');
INSERT INTO user_roles(username, role) VALUES ('kevin', 'ROLE_USER');