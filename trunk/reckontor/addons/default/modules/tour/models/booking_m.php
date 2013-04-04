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
		var_dump($traveler);
	}
}