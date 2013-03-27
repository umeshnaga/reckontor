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
	}
	
	function get_all_countries() {
		if(isset($_SERVER['ALL_COUNTRIES'])) {
			return $_SERVER['ALL_COUNTRIES'];
		}
		
		$sql = "SELECT DISTINCT r_country.* FROM r_country INNER JOIN r_city USING (country_id) INNER JOIN r_tour USING (city_id) ORDER BY country_name"; 
		$countries = $this->db->query($sql)->result_object();
		
		$_SERVER['ALL_COUNTRIES'] = $countries;
		return $countries;
		
	}
	
	function get_country_cities_mapping() {
		$key = 'COUNTRY_CITIES_MAPPING';
		if(isset($_SERVER[$key])) {
			return $_SERVER[$key];
		}
		
		$countries = $this->get_all_countries();
		$cities_with_country = array();
		foreach ($countries as $i => $country) {
			$cities_with_country[$country->country_id] = $this->get_cities_by_country_id($country->country_id);
		}
		
		$_SERVER[$key] = $cities_with_country;
		return $cities_with_country;
		
	}
	
	function get_cities_by_country_id($country_id) {
		$key = 'CITIES_BY_COUNTRY_' + $country_id;
		if(isset($_SERVER[$key])) {
			return $_SERVER[$key];
		}
		
		$sql = "SELECT DISTINCT r_city.* 
		        FROM r_city INNER JOIN r_tour USING (city_id)
		        WHERE country_id = ? ORDER BY city_name"; 
		$cities = $this->db->query($sql, array($country_id))->result_object();
		
		$_SERVER[$key] = $cities;
		return $_SERVER[$key];
	}
	
	function get_cities_by_highlight_level($highlight_level) {
		$sql = "SELECT DISTINCT r_city.* 
		        FROM r_city INNER JOIN r_tour USING (city_id)
		        WHERE highlight_level = ? ORDER BY city_name";
		$cities = $this->db->query($sql, array($highlight_level))->result_object();
		return $cities;
	}
	
	public function get_country_by_id($country_id)
	{
		$sql = "SELECT country_name FROM r_country WHERE country_id = ?"; 
		return $this->db->query($sql, array($country_id))->row();
	}
}
