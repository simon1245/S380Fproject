CREATE TABLE Foods (
    food_id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
    name VARCHAR(255) NOT NULL,
    description VARCHAR(65535) NOT NULL,
    available Boolean NOT NULL,
    price INTEGER NOT NULL,
    PRIMARY KEY (food_id)
);
CREATE TABLE Attachment (
    id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
    filename VARCHAR(255) DEFAULT NULL,
    content_type VARCHAR(255) DEFAULT NULL,
    content BLOB DEFAULT NULL,
    food_id INTEGER DEFAULT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (food_id) REFERENCES Foods(food_id)
);

CREATE TABLE Comment (
    id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
    detail VARCHAR(65535) NOT NULL,
    username VARCHAR(50) DEFAULT NULL,
    food_id INTEGER DEFAULT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (food_id) REFERENCES Foods(food_id)
);

CREATE TABLE Orders (
    id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
    username VARCHAR(50) DEFAULT NULL,
    order_time TIMESTAMP ,
    Cost INTEGER ,
    PRIMARY KEY (id)
);

CREATE TABLE OrderedFood (
    id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
    name VARCHAR(255) NOT NULL,
    order_id INTEGER DEFAULT NULL,
    food_id INTEGER DEFAULT NULL,
    price INTEGER DEFAULT NULL,
    quantity INTEGER DEFAULT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (order_id) REFERENCES Orders(id)
);

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

INSERT INTO users VALUES ('keith', '{noop}keithpassword', 'keith Y','91234567','Hong Kong');
INSERT INTO user_roles(username, role) VALUES ('keith', 'ROLE_ADMIN');

INSERT INTO users VALUES ('vanessa', '{noop}vanessapassword', 'vanessa B','61234867','Hong Kong');
INSERT INTO user_roles(username, role) VALUES ('vanessa', 'ROLE_ADMIN');

INSERT INTO users VALUES ('kevin', '{noop}kevinpassword' , 'kevin H','48137694','Hong Kong');
INSERT INTO user_roles(username, role) VALUES ('kevin', 'ROLE_USER');

INSERT INTO Foods(name,description,available,price) VALUES ('Carbonara', 'This Creamy Carbonara recipe is a plate of heavenly, creamy pasta. Silky spaghetti with crispy pancetta in a super creamy and cheesy sauce.',true,100);
INSERT INTO Foods(name,description,available,price) VALUES ('New York Strip', 'Well marbled, full bodied and rich with beefy flavor, a New York Strip is firm and tender when it comes to texture, flavor and fat. Cut from the shorter side of the beef loin, the muscles in this area do little work, and that spells tenderness every time. At Ruth’s, ours is a USDA Prime cut of short loin that can be enjoyed as a 16oz boneless strip steak or as a 19oz bone-in specialty cut',true,150);
INSERT INTO Foods(name,description,available,price) VALUES ('Pizza Margherita', 'Thin crust pizza dough topped with a simple raw tomato sauce, fresh mozzarella cheese, and basil.',true,110);
INSERT INTO Foods(name,description,available,price) VALUES ('Garlic Herb Butter Roast Chicken', 'Roast Chicken slathered with a garlic-herb-lemon butter then oven roasted to golden crispy perfection.',true,200);
INSERT INTO Foods(name,description,available,price) VALUES ('Seared Crispy Skin Duck Breast With Duck Fat Fried Potatoes', 'A perfectly cooked, pan-fried duck breast will have a crisp, golden skin and succulent pink flesh.',true,80);
INSERT INTO Foods(name,description,available,price) VALUES ('Hoisin duck stir-fry', 'Looking for a quick midweek meal? It’s low in fat and calories, but full of flavour',true,75);
INSERT INTO Foods(name,description,available,price) VALUES ('Pan Seared Salmon with Lemon Garlic Butter Sauce', 'Try this roast turkey breast as an tasty journey for your festive dinner',true,100);
INSERT INTO Foods(name,description,available,price) VALUES ('Duck ragu with pappardelle & swede', 'Golden-crisp on top and just barely cooked in the center.',true,100);
INSERT INTO Foods(name,description,available,price) VALUES ('Lobster Linguine', 'Linguine with Boston Lobster and Fresh Home-Made Tomato Sauce',true,98);
INSERT INTO Foods(name,description,available,price) VALUES ('Penne Amatriciana', 'Penne with Amatriciana Sauce, Guanciale, Onion',true,75);

INSERT INTO Comment(detail,username,food_id) VALUES('Very tasty!', 'Alex Keung', 2);
INSERT INTO Comment(detail,username,food_id) VALUES('Very expensive!', 'Simon Keung', 3);
INSERT INTO Comment(detail,username,food_id) VALUES('Very tasty!', 'Anima Keung', 4);
INSERT INTO Comment(detail,username,food_id) VALUES('Very expensive!', 'Alex Keung', 5);
INSERT INTO Comment(detail,username,food_id) VALUES('Very cheap!', 'Simon Keung', 6);
INSERT INTO Comment(detail,username,food_id) VALUES('Very tasty!', 'Soe Keung', 7);
INSERT INTO Comment(detail,username,food_id) VALUES('Very expensive!', 'Alex Wong', 8);
INSERT INTO Comment(detail,username,food_id) VALUES('Very cheap!', 'Anima Wong', 9);
INSERT INTO Comment(detail,username,food_id) VALUES('Very tasty!', 'Soe Wong', 6);
INSERT INTO Comment(detail,username,food_id) VALUES('Very tasty!', 'Alex Keung', 1);
INSERT INTO Comment(detail,username,food_id) VALUES('Very expensive!', 'Simon Keung', 2);
INSERT INTO Comment(detail,username,food_id) VALUES('Very tasty!', 'Soe Keung', 3);
INSERT INTO Comment(detail,username,food_id) VALUES('Very expensive!', 'Jenny Keung', 4);
INSERT INTO Comment(detail,username,food_id) VALUES('Very cheap!', 'Simon Keung', 8);
INSERT INTO Comment(detail,username,food_id) VALUES('Very tasty!', 'Soe Keung', 7);
INSERT INTO Comment(detail,username,food_id) VALUES('Very expensive!', 'Jenny Wong', 6);
INSERT INTO Comment(detail,username,food_id) VALUES('Very cheap!', 'Simon Wong', 3);
INSERT INTO Comment(detail,username,food_id) VALUES('Very tasty!', 'Jenny Wong', 2);

