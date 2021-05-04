CREATE TABLE Foods (
    food_id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
    name VARCHAR(255) NOT NULL,
    description VARCHAR(255) NOT NULL,
    available Boolean NOT NULL,
    price INTEGER NOT NULL,
    PRIMARY KEY (food_id)
);

INSERT INTO Foods(name,description,available,price) VALUES ('aaa', 'Tast good',true,1111);

CREATE TABLE Menu_attachment (
    id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
    filename VARCHAR(255) DEFAULT NULL,
    content_type VARCHAR(255) DEFAULT NULL,
    content BLOB DEFAULT NULL,
    food_id INTEGER DEFAULT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (food_id) REFERENCES Foods(food_id)
);


