ALTER TABLE `reckontor`.`r_tour_photo` ADD COLUMN `is_main` INT(1) DEFAULT '0' NOT NULL AFTER `photo_id`;
ALTER TABLE `reckontor`.`r_tour_photo` DROP FOREIGN KEY `FK_r_tour_photo_photo` ;
ALTER TABLE `reckontor`.`r_tour_photo` ADD COLUMN `photo_comment` TINYTEXT NULL AFTER `photo_path`, ADD COLUMN `posted_by_id` INT(11) NULL AFTER `photo_comment`, CHANGE `photo_id` `photo_path` VARCHAR(1024) NULL ;
ALTER TABLE `reckontor`.`r_country` DROP FOREIGN KEY `FK_r_country_photo` ;
ALTER TABLE `reckontor`.`r_country` CHANGE `photo_id` `photo_path` VARCHAR(1024) DEFAULT '1' NULL ; 
DROP TABLE `reckontor`.`r_photo`;  
ALTER TABLE `reckontor`.`r_traveler` ADD COLUMN `is_children` INT(11) DEFAULT '0' NULL AFTER `last_name`;  
ALTER TABLE `reckontor`.`r_booking` ADD COLUMN `email` VARCHAR(512) NOT NULL AFTER `phone_number`;