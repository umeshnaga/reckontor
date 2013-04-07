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
class Booking_m extends MY_Model {
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
		$this->load->model('tour_m');
	}
	
	public function create_booking($phone_area_code, $phone_number, $email, $book_by_id) {
		$this->db->dbprefix = 'r_';
		$result = $this->db->insert('booking', array(
			'phone_area_code'	=> $phone_area_code,
			'phone_number' 		=> $phone_number,
			'email' 			=> $email,
			'book_by_id' 		=> $book_by_id,
			'booking_status' 	=> 'PENDING'
		));
		return $this->db->insert_id();
	}
	
	public function create_booking_tour($tour_id, $booking_id, $travel_date) {
		$this->db->dbprefix = 'r_';
		$parts = explode(' ', $travel_date);
		$travel_date = $parts[0];
		$travel_month = $parts[1];
		$travel_year = $parts[2];
		$result = $this->db->insert('booking_tour', array(
			'tour_id'		=> $tour_id,
			'booking_id' 	=> $booking_id,
			'travel_date' 	=> $travel_year .'-' . $travel_month . '-' . $travel_date
		));
		return $this->db->insert_id();
	}
	
	public function add_traveler($booking_tour_id, $traveler) {
		$is_children = $traveler['is_children'];
		$is_lead = isset($traveler['is_lead']) ? $traveler['is_lead'] : 0;
  		$title = $traveler['title'];
  		$first_name = $traveler['first_name'];
  	    $last_name = $traveler['last_name'];
		
		$this->db->dbprefix = 'r_';
		$result = $this->db->insert('traveler', array(
			'booking_tour_id' => $booking_tour_id,
			'title'	  => $title,
			'first_name'	  => $first_name,
			'last_name'	  => $last_name,
			'is_children'	  => $is_children,
			'is_leader'	  => $is_lead,
		));
		return $this->db->insert_id();
	}
	
	public function get_booking_info_by_booking_id($booking_id) {
		$sql = "SELECT 
					   b.phone_area_code as phone_area_code,
					   b.phone_number as phone_number,
					   b.email as email,
					   t.tour_id as tour_id, 
					   bt.booking_tour_id as booking_tour_id, 
					   bt.travel_date as travel_date,
					   td.title as tour_title,
					   traveler.traveler_id as traveler_id,
					   traveler.title as traveler_title,
					   traveler.first_name as traveler_first_name,
					   traveler.last_name as traveler_last_name,
					   traveler.is_children as traveler_is_children,
					   traveler.is_leader as traveler_is_leader
			    FROM r_booking  b
			    	 INNER JOIN r_booking_tour bt USING (booking_id)
			    	 INNER JOIN r_tour t USING (tour_id)
			    	 INNER JOIN r_tour_detail td USING (tour_id)
			         INNER JOIN r_traveler traveler ON traveler.booking_tour_id =  bt.booking_tour_id
			    WHERE b.booking_id = ? ORDER BY booking_tour_id, traveler_id";
		$booking_infos = $this->db->query($sql, array($booking_id))->result_object();
		return $booking_infos;
	}
}