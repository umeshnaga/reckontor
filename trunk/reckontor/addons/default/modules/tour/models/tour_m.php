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
		
		$sql = "SELECT * FROM r_tour_available_date WHERE tour_id = ? AND DAY(available_date) = ? AND MONTH(available_date) = ? AND YEAR(available_date) = ?"; 
		
		$price_info = $this->db->query($sql, array($tour_id, 
											 $day,
											 $month,
											 $year))->row();
		if (sizeof($price_info) > 0) {
			return $price_info;
		}
		
		return null;
	}

}