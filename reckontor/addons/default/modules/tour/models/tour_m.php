<?php defined('BASEPATH') or exit('No direct script access allowed');

/**
 *
 *
 * @author 		Kevin
 * @package 	PyroCMS
 * @subpackage 	Tour Module
 * @category 	Modules
 * @license 	Apache License v2.0
 */
class Tour_m extends MY_Model {
	public function __construct()
	{
		switch (ENVIRONMENT)
		{
			case 'local':
			case 'dev':
				$this->db->db_debug = TRUE;
				break;

			case 'qa':
			case 'live':
				$this->db->db_debug = FALSE;
				break;

			default:
				$this->db->db_debug = FALSE;
		}
	}
	
	public function get_tour_by_id($tour_id)
	{
		$sql = "SELECT * FROM r_tour INNER JOIN r_tour_detail USING(tour_id) WHERE tour_id = ?"; 
		$tour = $this->db->query($sql, array($tour_id))->row();

		$sql = "SELECT * FROM r_tour_photo INNER JOIN r_tour_detail USING(tour_id) WHERE tour_id = ? AND is_main = 1 LIMIT 1";
		$tour_photo = $this->db->query($sql, array($tour_id))->row();
		if (sizeof($tour_photo) > 0) {
			$tour->tour_photo = $tour_photo;
		}
		
		return $tour;
	}
	
	public function get_price_by_tour_id_and_day($tour_id, $day, $monthyear) 
	{
		$parts = explode(' ', $monthyear);
		$month = $parts[0];
		$year = $parts[1];
		
		$sql = "SELECT * FROM r_tour_available_date WHERE tour_id = ? AND STR_TO_DATE(?,'%d %m %Y') BETWEEN `available_from_date` AND `available_to_date`;"; 
		
		$price_info = $this->db->query($sql, array($tour_id, 
											 $day.' '.$monthyear))->row();
		if (sizeof($price_info) > 0) {
			return $price_info;
		}
		
		return null;
	}

	public function get_tours_by_country_id($country_id, $page)
	{
		$sql = "SELECT r_tour.tour_id, title, CONCAT(SUBSTRING(introduction,1,150),' ...') AS introduction, country_name, city_name, duration_hours, common_adult_price FROM r_country INNER JOIN r_city USING (country_id) INNER JOIN r_tour USING (city_id) INNER JOIN r_tour_detail USING (tour_id) WHERE r_country.country_id = ? LIMIT ?,?"; 
		return $this->db->query($sql, array($country_id, ($page-1)*RECORD_PER_PAGE, RECORD_PER_PAGE))->result_object();
	}
	
	public function get_tours_count_by_country_id($country_id)
	{
		$sql = "SELECT COUNT(*) AS count FROM r_country INNER JOIN r_city USING (country_id) INNER JOIN r_tour USING (city_id) INNER JOIN r_tour_detail USING (tour_id) WHERE r_country.country_id = ?"; 
		return $this->db->query($sql, array($country_id))->row()->count;
	}
}