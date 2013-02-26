rename table r_tour_price to r_tour_available_date;
alter table r_tour_available_date drop column apply_to_date, change apply_from_date available_date datetime   NOT NULL, change tour_price_id tour_available_date_id int (11)  NOT NULL AUTO_INCREMENT ;
alter table r_country add column priority int NOT  NULL  after country_name;
alter table r_city add column is_city int NOT NULL  after country_id;