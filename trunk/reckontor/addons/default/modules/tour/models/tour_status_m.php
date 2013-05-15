<?php defined('BASEPATH') or exit('No direct script access allowed');

/**
 *
 *
 * @author 		Nga
 * @package 	PyroCMS
 * @subpackage 	Tour Module
 * @category 	Modules
 * @license 	Apache License v2.0
 */
class Tour_status_m extends MY_Model {
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
		$this->load->model('common_m');
	}

	function get_all_tour_statuses() {		
		$sql = "SELECT tour_status_id as id, status_name as name FROM r_tour_status"; 
		return $this->db->query($sql)->result_object();		
	}
	
	function get_tour_status_options() {
		return $this->common_m->get_select_options($this->pyrocache->model('tour_status_m', 'get_all_tour_statuses', array()));
	}
}