alter table r_tour_available_date drop column description;

alter table r_tour drop column description, drop column available_from_date, drop column available_to_date;

alter table `r_tour_detail` add column `code` varchar (64)  NOT NULL  after `tour_id`;

CREATE TABLE `r_tour_review` (                                                 
                 `tour_review_id` int(11) NOT NULL AUTO_INCREMENT,                            
                 `tour_id` int(11) DEFAULT NULL,                                              
                 `review` varchar(2056) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,  
                 `review_by_id` smallint(6) NOT NULL,                                         
                 PRIMARY KEY (`tour_review_id`)                                               
               ) ENGINE=InnoDB DEFAULT CHARSET=latin1;