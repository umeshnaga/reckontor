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
		return $this->db->query("SELECT c.*,photo_path,CASE WHEN LENGTH(photo_comment)>50 THEN CONCAT(SUBSTRING(photo_comment,1,50),'...') ELSE photo_comment END AS short_photo_comment,u.username FROM r_country c LEFT JOIN (r_photo p LEFT JOIN default_users u ON p.posted_by_id=u.id) ON c.photo_id=p.photo_id WHERE country_id=".$id)->row_array();
	}
	
	public function get_country_tour($country_id,$page,$page_size)
	{
		return $this->db->query("SELECT t.*,td.*,c.city_name FROM r_tour t INNER JOIN r_tour_detail td ON t.tour_id=td.tour_id INNER JOIN r_city c ON t.city_id=c.city_id INNER JOIN r_country cc ON c.country_id=cc.country_id WHERE cc.country_id=".$id)->row_array();
	}
	

}