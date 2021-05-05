Drop table Attachment;
Drop table Comment;
Drop table Foods;

CREATE TABLE Foods (
    food_id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
    name VARCHAR(255) NOT NULL,
    description VARCHAR(255) NOT NULL,
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
    detail VARCHAR(255) NOT NULL,
    username VARCHAR(50) DEFAULT NULL,
    food_id INTEGER DEFAULT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (food_id) REFERENCES Foods(food_id)
);


INSERT INTO Foods(name,description,available,price) VALUES ('Carbonara', 'This Creamy Carbonara recipe is a plate of heavenly, creamy pasta. Silky spaghetti with crispy pancetta in a super creamy and cheesy sauce.',true,100);
INSERT INTO Foods(name,description,available,price) VALUES ('New York Strip', 'Well marbled, full bodied and rich with beefy flavor, a New York Strip is firm and tender when it comes to texture, flavor and fat. Cut from the shorter side of the beef loin, the muscles in this area do little work, and that spells tenderness every time.',true,150);
INSERT INTO Foods(name,description,available,price) VALUES ('Pizza Margherita', 'Thin crust pizza dough topped with a simple raw tomato sauce, fresh mozzarella cheese, and basil.',true,110);
INSERT INTO Foods(name,description,available,price) VALUES ('Garlic Herb Butter Roast Chicken', 'Roast Chicken slathered with a garlic-herb-lemon butter then oven roasted to golden crispy perfection.',true,200);
INSERT INTO Foods(name,description,available,price) VALUES ('Seared Crispy Skin Duck Breast With Duck Fat Fried Potatoes', 'A perfectly cooked, pan-fried duck breast will have a crisp, golden skin and succulent pink flesh.',true,80);
INSERT INTO Foods(name,description,available,price) VALUES ('Hoisin duck stir-fry', 'Looking for a quick midweek meal? It’s low in fat and calories, but full of flavour',true,75);
INSERT INTO Foods(name,description,available,price) VALUES ('Pan Seared Salmon with Lemon Garlic Butter Sauce', 'Try this roast turkey breast as an tasty journey for your festive dinner',true,100);
INSERT INTO Foods(name,description,available,price) VALUES ('Duck ragu with pappardelle & swede', 'Golden-crisp on top and just barely cooked in the center.',true,100);
INSERT INTO Foods(name,description,available,price) VALUES ('Lobster Linguine', 'Linguine with Boston Lobster and Fresh Home-Made Tomato Sauce',true,98);
INSERT INTO Foods(name,description,available,price) VALUES ('Penne Amatriciana', 'Penne with Amatriciana Sauce, Guanciale, Onion',true,75);



