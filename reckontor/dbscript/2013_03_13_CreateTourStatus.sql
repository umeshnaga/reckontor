update r_tour set tour_status_id = 'A' where tour_status_id = 1;
delete from r_tour_status where tour_status_id = 1;
insert  into `r_tour_status`(`tour_status_id`,`status_name`,`description`) values ('A','Available','Tour is available for booking'),('C','Close','Tour is closed'),('S','Sold Out','Tour is sold out');
