rename table r_tour_price to r_tour_available_date;
alter table r_tour_available_date drop column apply_to_date,drop column description, change apply_from_date available_date datetime   NOT NULL, change tour_price_id tour_available_date_id int (11)  NOT NULL AUTO_INCREMENT ;
alter table r_country add column priority int NOT  NULL  after country_name;
alter table r_city add column is_city int NOT NULL  after country_id;

CREATE TABLE IF NOT EXISTS `r_attraction` (
  `attraction_id` int(11) NOT NULL AUTO_INCREMENT,
  `attraction_name` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `attraction_desc` varchar(2000) DEFAULT NULL,
  `city_id` varchar(16) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `latitude` float DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  PRIMARY KEY (`attraction_id`),
  KEY `FK_r_attraction_city` (`city_id`),
  CONSTRAINT `FK_r_attraction_city` FOREIGN KEY (`city_id`) REFERENCES `r_city` (`city_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `r_tour_rating` (
  `tour_rating_id` int(11) NOT NULL AUTO_INCREMENT,
  `tour_id` int(11) NOT NULL,
  `rating` tinyint(4) NOT NULL,
  `feedback` varchar(256) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `by_user_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`tour_rating_id`),
  KEY `FK_r_tour_rating_tour` (`tour_id`),
  KEY `FK_r_tour_rating_user` (`by_user_id`),
  CONSTRAINT `FK_r_tour_rating_tour` FOREIGN KEY (`tour_id`) REFERENCES `r_tour` (`tour_id`),
  CONSTRAINT `FK_r_tour_rating_user` FOREIGN KEY (`by_user_id`) REFERENCES `default_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;