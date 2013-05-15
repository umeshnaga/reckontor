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
class Tour_photo_m extends MY_Model {
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

	function get_tour_photos() {		
		$this->db->select('files.id as id, files.filename as name');
		$this->db->from('files');
		$this->db->join('file_folders', 'files.folder_id = file_folders.id');
		$this->db->where('file_folders.name =', 'tour_photo');
		$this->db->where('files.type =', 'i');
		$this->db->order_by("id", "desc"); 
		$query = $this->db->get();
		return $query->result_object();
	}

	function get_tour_photo_options() {
		return $this->common_m->get_select_options($this->get_tour_photos());
	}
}