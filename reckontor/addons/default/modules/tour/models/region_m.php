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
class Region_m extends MY_Model {
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
	
	function get_all_countries() {		
		$sql = "SELECT DISTINCT r_country.* FROM r_country INNER JOIN r_city USING (country_id) INNER JOIN r_tour USING (city_id) ORDER BY country_name"; 
		return $this->db->query($sql)->result_object();		
	}
	
	function get_all_cities() {		
		$sql = "SELECT city_id as id, CONCAT(country_name,' - ',city_name) as name FROM r_country INNER JOIN r_city USING (country_id) ORDER BY country_name, city_name"; 
		return $this->db->query($sql)->result_object();		
	}
	
	function get_city_options() {
		return $this->common_m->get_select_options($this->pyrocache->model('region_m', 'get_all_cities', array()));
	}
	
	function get_cities_by_country_id($country_id) {
		$sql = "SELECT DISTINCT r_city.* 
		        FROM r_city INNER JOIN r_tour USING (city_id)
		        WHERE country_id = ? ORDER BY city_name"; 
		return $this->db->query($sql, array($country_id))->result_object();
	}
	
	function get_cities_by_highlight_level($highlight_level) {
		$sql = "SELECT DISTINCT r_city.*, r_country.*
		        FROM r_city INNER JOIN r_tour USING (city_id) 
		        INNER JOIN r_country USING (country_id)
		        WHERE highlight_level = ? ORDER BY city_name";
		$cities = $this->db->query($sql, array($highlight_level))->result_object();
		return $cities;
	}
	
	public function get_country_by_id($country_id)
	{
		$sql = "SELECT country_name as name FROM r_country WHERE country_id = ?"; 
		return $this->db->query($sql, array($country_id))->row();
	}
	
	function get_city_by_id($city_id)
	{
		$sql = "SELECT city_name as name FROM r_city WHERE city_id = ?";
		return $this->db->query($sql, array($city_id))->row();
	}
	
	function get_countries($keyword) {
		$sql = "SELECT DISTINCT c.country_id, c.country_name FROM r_country c INNER JOIN r_city USING (country_id) INNER JOIN r_tour USING (city_id) WHERE c.country_name LIKE ?"; 
		return $this->db->query($sql, array("%".$keyword."%"))->result_object();		
	}
	
	function get_countries_ajax($keyword) {
		$sql = "SELECT DISTINCT CONCAT('tour/search/1/',c.country_id) as url, c.country_name as title, '' as dest FROM r_country c INNER JOIN r_city USING (country_id) INNER JOIN r_tour USING (city_id) WHERE c.country_name LIKE ?"; 
		return $this->db->query($sql, array("%".$keyword."%"))->result_object();		
	}
	
	function get_cities($keyword) {
		$sql = "SELECT DISTINCT c.country_id, c.country_name, ct.city_id, ct.city_name FROM r_country c INNER JOIN r_city ct USING (country_id) INNER JOIN r_tour USING (city_id) WHERE ct.city_name LIKE ?"; 
		$cities = $this->db->query($sql, array("%".$keyword."%"))->result_object();		
		/*if(count($cities)==0){
			$sql = "SELECT DISTINCT c.country_id, c.country_name, ct.city_id, ct.city_name FROM r_country c INNER JOIN r_city ct USING (country_id) INNER JOIN r_tour USING (city_id) WHERE c.country_name LIKE ?"; 
			$cities = $this->db->query($sql, array("%".$keyword."%"))->result_object();		
		}	*/
		return $cities;
	}
	
	function get_cities_ajax($keyword) {
		$sql = "SELECT DISTINCT CONCAT('tour/search/1/',c.country_id,'/',ct.city_id) as url, c.country_name as dest, ct.city_name as title FROM r_country c INNER JOIN r_city ct USING (country_id) INNER JOIN r_tour USING (city_id) WHERE ct.city_name LIKE ?"; 
		return $this->db->query($sql, array("%".$keyword."%"))->result_object();		
	}
}
