PRAGMA foreign_keys = ON;

CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL
);

CREATE TABLE questions (
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    author_id INTEGER NOT NULL,

    FOREIGN KEY (author_id) REFERENCES users(id)
);

CREATE TABLE questions_follows (
    id INTEGER PRIMARY KEY,
    author_id INTEGER NOT NULL,
    question_id INTEGER,

    FOREIGN KEY (author_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);

CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    body TEXT NOT NULL,
    author_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,
    parent_reply_id INTEGER,

    FOREIGN KEY (parent_reply_id) REFERENCES replies(id),
    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (author_id) REFERENCES users(id)
);

CREATE TABLE question_likes (
    id INTEGER PRIMARY KEY,
    author_id INTEGER NOT NULL,
    question_id INTEGER,

    FOREIGN KEY (author_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);


INSERT INTO questions_follows ("id", "author_id", "question_id") VALUES (2, 25, 112);
INSERT INTO questions_follows ("id", "author_id", "question_id") VALUES (1, 11, 112);
INSERT INTO questions_follows ("id", "author_id", "question_id") VALUES (3, 26, 112);



-- INSERT INTO users ("id", "fname", "lname") VALUES (1, "Demetri","Sakellaropoulos"); 
-- INSERT INTO users ("id", "fname", "lname") VALUES (2, "Kathryn","Chu");

-- INSERT INTO questions ("id", "title", "body", "author_id") VALUES (0, "yo waddup??","just checking in not really tho", 0);
-- INSERT INTO replies ("id", "body", "author_id", "question_id","parent_reply_id") VALUES (0, "i like puppies", 1, 0, NULL);
-- INSERT INTO replies ("id", "body", "author_id", "question_id","parent_reply_id") VALUES (1, "just got back from lunch", 2, 0, NULL);

-- INSERT INTO questions ("id", "title", "body", "author_id") VALUES (112, "Please feed me","woof woof", 11);

-- INSERT INTO users ("id", "fname", "lname") VALUES (25, "Eustace","Bagge");
-- INSERT INTO replies ("id", "body", "author_id", "question_id","parent_reply_id") VALUES (3, "frank, i already fed you! you animal", 25, 112, NULL);
-- INSERT INTO replies ("id", "body", "author_id", "question_id","parent_reply_id") VALUES (4, "eustace (aka) dad, i hate you", 11, 112, 3);


-- UPDATE replies SET parent_reply_id = 3 WHERE id = 4

-- INSERT INTO users ("id", "fname", "lname") VALUES (26, "Muriel", "Bagge");


INSERT INTO questions_follows ("id", "author_id", "question_id") VALUES (4,26,113);
