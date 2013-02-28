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
class Admin_m extends MY_Model {
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
	public function get_all_countries()
	{
		return $this->db->query('SELECT country_id, country_name FROM r_country ORDER BY priority DESC,country_name ASC')->result_array();
	}
	
	public function get_all_cities($country_id,$get_cities)
	{
		return $this->db->query("SELECT city_id, city_name FROM r_city WHERE country_id='".$country_id."' AND is_city=".$get_cities)->result_array();
	}

	public function get_country($id)
	{
		return $this->db->query("SELECT country_id, country_name FROM r_country WHERE country_id=".$id)->row_array();
	}
	
	public function insert_supplier($data)
	{
		return $this->db->insert($this->db->dbprefix('gpsi_suppliers'), $data);
	}

	public function update_supplier($id, $data)
	{
		$this->db->where('id', $id);
		return $this->db->update($this->db->dbprefix('gpsi_suppliers'), $data);
	}

	public function delete_supplier($id)
	{
		$this->db->where('id', $id);
		return $this->db->delete($this->db->dbprefix('gpsi_suppliers'));
	}

	

	public function get_all_clients()
	{
		return $this->db->get($this->db->dbprefix('gpsi_clients'))->result_array();
	}

}