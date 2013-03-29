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
		$sql = "SELECT r_tour.*,r_tour_detail.*, country_id, country_name, city_name, COALESCE(p.photo_path,'".DEFAULT_TOUR_PHOTO_PATH."') as photo_path FROM r_country INNER JOIN r_city USING (country_id) INNER JOIN r_tour USING (city_id) INNER JOIN r_tour_detail USING(tour_id) LEFT JOIN (SELECT tour_id, photo_path FROM r_tour_photo WHERE is_main=1 LIMIT 1) AS p USING (tour_id) WHERE tour_id = ?"; 
		$tour = $this->db->query($sql, array($tour_id))->row();	

		$sql = "SELECT available_from_date, available_to_date FROM r_tour_available_date WHERE tour_id = ? ORDER BY available_from_date";
		$tour_date_ranges = $this->db->query($sql, array($tour_id))->result_object();
		
		foreach ($tour_date_ranges as $tour_date_range) {
			$from_date=strtotime($tour_date_range->available_from_date);
			$to_date=strtotime($tour_date_range->available_to_date);
			
		    while( $from_date <= $to_date ) {
		    	$m_y_array[]= array("value"=>date(DATE_VALUE_PATTERN , $from_date),"text"=>date(DATE_TEXT_PATTERN, $from_date));
		        $from_date = strtotime("+1 month", $from_date);
		    }
		}
		if(isset($m_y_array)){
			$tour->tour_dates=$m_y_array;
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
		$sql = "SELECT r_tour.tour_id, title, CONCAT(SUBSTRING(introduction,1,150),' ...') AS introduction, country_name, city_name, duration_hours, common_adult_price, COALESCE(p.photo_path,'".DEFAULT_TOUR_PHOTO_PATH."') as photo_path FROM r_country INNER JOIN r_city USING (country_id) INNER JOIN r_tour USING (city_id) INNER JOIN r_tour_detail USING (tour_id) LEFT JOIN (SELECT tour_id, photo_path FROM r_tour_photo WHERE is_main=1 LIMIT 1) AS p USING (tour_id) WHERE r_country.country_id = ? LIMIT ?,?"; 
		return $this->db->query($sql, array($country_id, ($page-1)*RECORD_PER_PAGE, RECORD_PER_PAGE))->result_object();
	}
	
	public function get_tours_by_city_id($city_id, $page)
	{
		$sql = "SELECT r_tour.tour_id, title, CONCAT(SUBSTRING(introduction,1,150),' ...') AS introduction, country_name, city_name, duration_hours, common_adult_price, COALESCE(p.photo_path,'".DEFAULT_TOUR_PHOTO_PATH."') as photo_path FROM r_country INNER JOIN r_city USING (country_id) INNER JOIN r_tour USING (city_id) INNER JOIN r_tour_detail USING (tour_id) LEFT JOIN (SELECT tour_id, photo_path FROM r_tour_photo WHERE is_main=1 LIMIT 1) AS p USING (tour_id) WHERE r_city.city_id = ? LIMIT ?,?"; 
		return $this->db->query($sql, array($city_id, ($page-1)*RECORD_PER_PAGE, RECORD_PER_PAGE))->result_object();
	}
	
	public function get_tours_count_by_country_id($country_id)
	{
		$sql = "SELECT COUNT(*) AS count FROM r_country INNER JOIN r_city USING (country_id) INNER JOIN r_tour USING (city_id) WHERE r_country.country_id = ?"; 
		return $this->db->query($sql, array($country_id))->row()->count;
	}
	
	public function get_tours_count_by_city_id($city_id)
	{
		$sql = "SELECT COUNT(*) AS count FROM r_city INNER JOIN r_tour USING (city_id) WHERE r_city.city_id = ?"; 
		return $this->db->query($sql, array($city_id))->row()->count;
	}
}