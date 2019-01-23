#
# TABLE STRUCTURE FOR: users
#

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fname` text COLLATE utf8_unicode_ci NOT NULL,
  `lname` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `users` (`id`, `fname`, `lname`) VALUES (0, 'Gene', 'Lebsack');
INSERT INTO `users` (`id`, `fname`, `lname`) VALUES (3, 'Jabari', 'Nitzsche');
INSERT INTO `users` (`id`, `fname`, `lname`) VALUES (4, 'Colin', 'Thiel');
INSERT INTO `users` (`id`, `fname`, `lname`) VALUES (5, 'Alfonso', 'Goldner');
INSERT INTO `questions_follows` (`id`, `author_id`, `question_id`) VALUES (0, 0, 0);


