DROP DATABASE IF EXISTS dbblog;
CREATE DATABASE dbblog;
USE dbblog;

CREATE TABLE `user`(
	user_id INT UNSIGNED,
    user_email VARCHAR (50),
    user_display_name VARCHAR(20),
    user_timestamp_created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(user_id)
);

CREATE TABLE template(
    template_name VARCHAR(20),
    template_desc VARCHAR(100),
    template_url VARCHAR(100),
    PRIMARY KEY(template_name)
);

CREATE TABLE blog(
    blog_id INT UNSIGNED,
    blog_url VARCHAR(100),
    blog_title VARCHAR(50),
    blog_description VARCHAR(100),
    template_name VARCHAR(20),
    user_id INT UNSIGNED,
    PRIMARY KEY(blog_id),
    FOREIGN KEY(template_name) REFERENCES template(template_name),
    FOREIGN KEY(user_id) REFERENCES `user`(user_id)
);

CREATE TABLE post(
    post_id INT UNSIGNED,
    post_title VARCHAR(30),
    post_content VARCHAR(100),
    post_comments_allowed ENUM('True', 'False'),
    post_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    blog_id INT UNSIGNED,
    PRIMARY KEY(post_id),
    FOREIGN KEY(blog_id) REFERENCES blog(blog_id)
);

CREATE TABLE comment(
    comment_id INT UNSIGNED,
    comment_text VARCHAR(100),
    comment_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    post_id INT UNSIGNED,
    PRIMARY KEY(comment_id),
    FOREIGN KEY(post_id) REFERENCES post(post_id)
);

CREATE TABLE blog_keyword(
    keyword VARCHAR(20),
    blog_id INT UNSIGNED,
    PRIMARY KEY(keyword, blog_id),
    FOREIGN KEY(blog_id) REFERENCES blog(blog_id)
);

CREATE TABLE post_keyword(
    keyword VARCHAR(20),
    post_id INT UNSIGNED,
    PRIMARY KEY(keyword, post_id),
    FOREIGN KEY(post_id) REFERENCES post(post_id)
);

INSERT INTO `user` (user_id, user_email, user_display_name)
VALUES (1, 'joe@gmail.com', 'Joey');
INSERT INTO `user` (user_id, user_email, user_display_name)
VALUES (2, 'bob@gmail.com', 'Bob');
INSERT INTO `user` (user_id, user_email, user_display_name)
VALUES (3, 'Brid@gmail.com', 'Brid');
INSERT INTO `user` (user_id, user_email, user_display_name)
VALUES (4, 'mary@gmail.com', 'Mary');
INSERT INTO `user` (user_id, user_email, user_display_name)
VALUES (5, 'tommy@gmail.com', 'Tommy');

INSERT INTO template (template_name, template_desc, template_url)
VALUES ('empty_template', NULL, '/empty_template');
INSERT INTO template (template_name, template_desc, template_url)
VALUES ('financial_template', 'financial description', '/financial_template');
INSERT INTO template (template_name, template_desc, template_url)
VALUES ('accounting_template', 'accounting description', '/accounting_template');
INSERT INTO template (template_name, template_desc, template_url)
VALUES ('0_template', NULL, '/0_template');

INSERT INTO blog (blog_id, blog_url, blog_title, blog_description, template_name, user_id)
VALUES (1, '/financial', 'financial', 'financial description', 'financial_template', 1);
INSERT INTO blog (blog_id, blog_url, blog_title, blog_description, template_name, user_id)
VALUES (2, '/accounting', 'accounting', 'accounting description', 'accounting_template', 2);
INSERT INTO blog (blog_id, blog_url, blog_title, blog_description, template_name, user_id)
VALUES (3, '3rd_blog', 'Making money', NULL, 'empty_template', 3);
INSERT INTO blog (blog_id, blog_url, blog_title, blog_description, template_name, user_id)
VALUES (4, '4th_blog', 'Fast track finance', NULL, 'empty_template', 3);
INSERT INTO blog (blog_id, blog_url, blog_title, blog_description, template_name, user_id)
VALUES (5, '5th_blog', 'Smart Finance', '5th blog description', 'empty_template', 5);
INSERT INTO blog (blog_id, blog_url, blog_title, blog_description, template_name, user_id)
VALUES (6, '6th_blog', '6th blog', '6th blog description', 'empty_template', 3);
INSERT INTO blog (blog_id, blog_url, blog_title, blog_description, template_name, user_id)
VALUES (9, '9th_blog', '9th blog', '9th blog description', 'empty_template', 3);

INSERT INTO post (post_id, post_title, post_content, post_comments_allowed, blog_id)
VALUES (1, '1st post', '1st post content', 'True',  1);
INSERT INTO post (post_id, post_title, post_content, post_comments_allowed, blog_id)
VALUES (2, '2nd post', '2nd post content', 'True',  2);
INSERT INTO post (post_id, post_title, post_content, post_comments_allowed, blog_id)
VALUES (3, '3rd post', '3rd post content', 'True',  3);
INSERT INTO post (post_id, post_title, post_content, post_comments_allowed, blog_id)
VALUES (4, '4th post', '4th post content', 'True',  4);
INSERT INTO post (post_id, post_title, post_content, post_comments_allowed, blog_id)
VALUES (5, '5th post', '5th post content', 'True',  5);
INSERT INTO post (post_id, post_title, post_content, post_comments_allowed, blog_id)
VALUES (6, '6th post', '6th post content', 'True',  6);
INSERT INTO post (post_id, post_title, post_content, post_comments_allowed, blog_id)
VALUES (9, '9th post', '9th post content', 'True',  9);

INSERT INTO comment (comment_id, comment_text, post_id)
VALUES (1, 'money, business, financial', 4);
INSERT INTO comment (comment_id, comment_text, post_id)
VALUES (2, '2nd comment', 3);
INSERT INTO comment (comment_id, comment_text, post_id)
VALUES (3, '3rd comment', 5);
INSERT INTO comment (comment_id, comment_text, post_id)
VALUES (4, '4th comment', 9);
INSERT INTO comment (comment_id, comment_text, post_id)
VALUES (5, '5th comment', 1);
INSERT INTO comment (comment_id, comment_text, post_id)
VALUES (6, '6th comment', 1); 

INSERT INTO blog_keyword (keyword, blog_id)
VALUES ('multimedia', 4);
INSERT INTO blog_keyword (keyword, blog_id)
VALUES ('video', 5);
INSERT INTO blog_keyword (keyword, blog_id)
VALUES ('creative', 1);
INSERT INTO blog_keyword (keyword, blog_id)
VALUES ('animation', 6);

INSERT INTO post_keyword (keyword, post_id)
VALUES ('money', 1);

-- 1.
SELECT *
FROM `user`
WHERE user_display_name = 'Joey' AND user_email = 'joe@gmail.com';

-- 2.
SELECT user_display_name AS 'Display Name'
FROM `user`
WHERE user_id > 3
ORDER BY user_display_name DESC;

-- 3.
SELECT user_display_name
FROM `user`
WHERE user_display_name LIKE '%y'
ORDER BY user_display_name;

-- 4.
SELECT user_id, user_email, user_display_name, user_timestamp_created
FROM `user`
WHERE user_timestamp_created > '2010-11-27 10:10:10';

-- 5.
SELECT template_name, template_desc
FROM template
WHERE template_desc IS NULL
ORDER BY template_name ASC;

-- 6.
SELECT blog_url
FROM blog
WHERE blog_title IN('financial', 'accounting') AND blog_description IS NOT NULL;

-- 7.
SELECT p.* 
FROM post p JOIN blog b ON p.blog_id = b.blog_id 
WHERE p.post_comments_allowed = 'True' AND p.blog_id IN(4,5,6);

-- 8.
SELECT c.*
FROM comment c JOIN post p ON c.post_id = p.post_id 
WHERE (c.comment_text LIKE '%money%' OR c.comment_text LIKE '%business%' OR c.comment_text LIKE '%financial%') AND p.post_id = 4;

-- 9.
SELECT b.blog_id, b_k.keyword
FROM blog b JOIN blog_keyword b_k ON b.blog_id = b_k.blog_id
WHERE b_k.keyword IN('multimedia', 'creative', 'animation', 'flash', 'video');

-- 10.
SELECT u.user_display_name, b.blog_title, b.blog_description
FROM `user` u JOIN blog b ON u.user_id = b.user_id
ORDER BY u.user_display_name, b.blog_title;

-- 11.
SELECT u.user_display_name, b.blog_title, b.blog_description
FROM `user` u JOIN blog b ON u.user_id = b.user_id
WHERE b.blog_description IS NOT NULL
ORDER BY u.user_display_name, b.blog_title;

-- 12.
CREATE VIEW user_blog_vw AS
SELECT u.user_display_name, b.blog_url, b.blog_title
FROM `user` u JOIN blog b ON u.user_id = b.user_id;
SELECT * FROM user_blog_vw;

-- 13.
-- A base relation is a relation that is explicitly stored.
-- A derived relation is defined by axioms in terms of base and/or derived relations.
-- A query may contain an arbitrary number of base and derived relations.
-- The method is to compile the query into a program.

-- 14.
SELECT u.user_display_name, b.blog_title, p.post_title
FROM blog b JOIN post p ON b.blog_id = p.blog_id JOIN `user` u ON u.user_id = b.user_id
WHERE u.user_display_name IN('Joey', 'Mary')
ORDER BY b.blog_title, p.post_title;

-- 15.
SELECT p.post_title, p.post_content, c.comment_id, c.comment_text, b.blog_id, p.post_id
FROM post p JOIN blog b ON  p.blog_id = b.blog_id JOIN comment c ON c.post_id = p.post_id
WHERE b.blog_id IN(3, 5, 9);

-- 16.
SELECT p.post_title, p.post_content, c.comment_text, b.blog_title
FROM blog b JOIN post p ON b.blog_id = p.blog_id JOIN comment c ON c.post_id = p.post_id
WHERE b.blog_title IN('Making money','Fast track finance','Smart Finance');

-- 17.
SELECT keyword FROM blog_keyword
UNION
SELECT keyword FROM post_keyword;

-- 18.
SELECT u.user_display_name, c.comment_text, c.comment_timestamp
FROM comment c JOIN post p ON c.post_id = p.post_id JOIN blog b ON b.blog_id = p.blog_id JOIN `user` u ON u.user_id = b.user_id
WHERE u.user_display_name = 'Joey'
ORDER BY c.comment_timestamp DESC;

-- 19.
SELECT u.user_id, COUNT(*) AS no_blogs
FROM blog b JOIN `user` u ON b.user_id = u.user_id
GROUP BY u.user_id
ORDER BY u.user_id, no_blogs;

-- 20.
SELECT b.blog_title, p.post_title
FROM blog b JOIN post p ON b.blog_id = p.blog_id JOIN `user` u ON u.user_id = b.user_id
WHERE u.user_display_name = 'Brid';

-- 21.
SELECT t.template_name, COUNT(*) AS 'Template Appearance'
FROM blog b JOIN template t ON b.template_name = t.template_name
GROUP BY b.template_name;

-- 22.
SELECT p.post_id, COUNT(*) AS 'Most Comments'
FROM comment c JOIN post p ON c.post_id = p.post_id
GROUP BY c.post_id;

-- 23.
SELECT u.user_display_name, COUNT(*) AS 'Most User Comments'
FROM comment c JOIN post p ON c.post_id = p.post_id JOIN blog b ON p.blog_id = b.blog_id JOIN `user` u ON b.user_id = u.user_id
GROUP BY c.post_id;

-- 24.
SELECT u.user_id, u.user_display_name, b.blog_id, COUNT(*) AS 'Amount of comments'
FROM post p JOIN comment c ON p.post_id = c.post_id JOIN blog b ON b.blog_id = p.blog_id JOIN `user` u ON u.user_id = b.user_id
GROUP BY b.user_id;

-- 25.
SELECT b.blog_title
FROM blog b JOIN `user` u ON b.user_id = u.user_id
WHERE u.user_display_name = 'Tommy';

-- 26.
SELECT p.*, c.comment_text
FROM post p JOIN comment c ON p.post_id = c.post_id
WHERE c.comment_text IS NOT NULL;

-- 27.
SELECT t.template_name
FROM template t
WHERE t.template_name NOT IN (SELECT b.template_name FROM blog b);
