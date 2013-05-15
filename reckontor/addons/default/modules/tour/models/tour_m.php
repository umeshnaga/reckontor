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
	protected $_table = 'r_tour';
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
		$sql = "SELECT r_tour.*,r_tour_detail.*, country_id, country_name, city_name, photo_id FROM r_country INNER JOIN r_city USING (country_id) INNER JOIN r_tour USING (city_id) INNER JOIN r_tour_detail USING(tour_id) WHERE tour_id = ? limit 1";
		$tour = $this->db->query($sql, array($tour_id))->row();	
		$sql = "SELECT available_from_date, available_to_date FROM r_tour_available_date WHERE tour_id = ? ORDER BY available_from_date";
		$tour_date_ranges = $this->db->query($sql, array($tour_id))->result_object();
		
		foreach ($tour_date_ranges as $tour_date_range) {
			$from_date=strtotime($tour_date_range->available_from_date);
			$to_date=strtotime($tour_date_range->available_to_date);
			
		    while( $from_date <= $to_date ) {
		    	$m_y_value = date(DATE_VALUE_PATTERN , $from_date);
		    	$m_y_text = date(DATE_TEXT_PATTERN, $from_date);
		    	$need_add = true;
		    	if (isset($m_y_array)) {
			    	foreach ($m_y_array as $added_m_y) {
			    		if($added_m_y["value"] == $m_y_value) {
			    			$need_add = false;
			    			break;
			    		}
			    	}
		    	}
		    	if ($need_add) {
		    		$m_y_array[date(DATE_VALUE_PATTERN , $from_date)]= array("value"=>date(DATE_VALUE_PATTERN , $from_date),"text"=>date(DATE_TEXT_PATTERN, $from_date));
		    	}
		        $from_date = strtotime("+1 month", $from_date);
		    }
		}
		if(isset($m_y_array)){
			/**
			 * check if date is available in month 
			 */
			foreach ($m_y_array as $key => $avaliable_m_y) {
				$avaliable_dates = array();
				for ($i = 1; $i < 31; $i++) {
					$checking_date = strtotime($i . '-' . $avaliable_m_y["text"]);
					foreach ($tour_date_ranges as $tour_date_range) {
						
						$from_date=strtotime($tour_date_range->available_from_date);
						$to_date=strtotime($tour_date_range->available_to_date);
						if ($checking_date >= strtotime("-1 day", $from_date) && $checking_date <= $to_date) {
							$avaliable_dates[] = $i;
							break;
						}
					}
				}
				$m_y_array[$key]["available_dates"] = $avaliable_dates;
			}
			$tour->tour_dates=$m_y_array;
		}
		return $tour;
	}
	
	public function get_price_by_tour_id_and_day($tour_id, $day, $monthyear) 
	{
		$parts = explode(' ', $monthyear);
		$month = $parts[0];
		$year = $parts[1];
		
		$sql = "SELECT * FROM r_tour_available_date WHERE tour_id = ? AND STR_TO_DATE(?,'%d %m %Y') BETWEEN ADDDATE(`available_from_date`, -1) AND `available_to_date`;"; 
		
		$price_info = $this->db->query($sql, array($tour_id, 
											 $day.' '.$monthyear))->row();
		if (sizeof($price_info) > 0) {
			return $price_info;
		}
		
		return null;
	}

	function get_tours_by_country_id($country_id, $page)
	{
		$sql = "SELECT r_tour.tour_id, title, CONCAT(SUBSTRING(introduction,1,150),' ...') AS introduction, country_name, city_name, duration, common_adult_price, photo_id FROM r_country INNER JOIN r_city USING (country_id) INNER JOIN r_tour USING (city_id) INNER JOIN r_tour_detail USING (tour_id) WHERE r_country.country_id = ? LIMIT ?,?"; 
		return $this->db->query($sql, array($country_id, ($page-1)*RECORD_PER_PAGE, RECORD_PER_PAGE))->result_object();
	}
	
	function get_tours_by_city_id($city_id, $page)
	{
		$sql = "SELECT r_tour.tour_id, title, CONCAT(SUBSTRING(introduction,1,150),' ...') AS introduction, country_name, city_name, duration, common_adult_price, photo_id FROM r_country INNER JOIN r_city USING (country_id) INNER JOIN r_tour USING (city_id) INNER JOIN r_tour_detail USING (tour_id) WHERE r_city.city_id = ? LIMIT ?,?"; 
		return $this->db->query($sql, array($city_id, ($page-1)*RECORD_PER_PAGE, RECORD_PER_PAGE))->result_object();
	}
	
	function get_tours_count_by_country_id($country_id)
	{
		$sql = "SELECT COUNT(*) AS count FROM r_country INNER JOIN r_city USING (country_id) INNER JOIN r_tour USING (city_id) WHERE r_country.country_id = ?"; 
		return $this->db->query($sql, array($country_id))->row()->count;
	}
	
	function get_tours_count_by_city_id($city_id)
	{
		$sql = "SELECT COUNT(*) AS count FROM r_city INNER JOIN r_tour USING (city_id) WHERE r_city.city_id = ?"; 
		return $this->db->query($sql, array($city_id))->row()->count;
	}
	
	function get_tours_count_by_keyword($keyword)
	{
		$like_keyword='%'.$keyword.'%';
		$sql = "SELECT COUNT(*) AS count FROM r_country INNER JOIN r_city USING (country_id) INNER JOIN r_tour USING (city_id) INNER JOIN r_tour_detail td USING (tour_id) WHERE td.title LIKE ? OR td.introduction LIKE ? OR td.highlight LIKE ? OR td.description LIKE ?"; 
		return $this->db->query($sql, array($like_keyword, $like_keyword, $like_keyword, $like_keyword))->row()->count;
	}
	
	function get_tours_by_keyword($keyword, $page)
	{
		$like_keyword='%'.$keyword.'%';
		$sql = "SELECT r_tour.tour_id, title, CONCAT(SUBSTRING(introduction,1,150),' ...') AS introduction, country_name, city_name, duration, common_adult_price, photo_id FROM r_country INNER JOIN r_city USING (country_id) INNER JOIN r_tour USING (city_id) INNER JOIN r_tour_detail td USING (tour_id) WHERE td.title LIKE ? OR td.introduction LIKE ? OR td.highlight LIKE ? OR td.description LIKE ? LIMIT ?,?"; 
		return $this->db->query($sql, array($like_keyword, $like_keyword, $like_keyword, $like_keyword, ($page-1)*RECORD_PER_PAGE, RECORD_PER_PAGE))->result_object();
	}
	
	function get_tours_by_keyword_ajax($keyword, $top)
	{
		$like_keyword='%'.$keyword.'%';
		$sql = "SELECT CONCAT('tour/detail/',r_tour.tour_id) as url, title, city_name as dest FROM r_country INNER JOIN r_city USING (country_id) INNER JOIN r_tour USING (city_id) INNER JOIN r_tour_detail td USING (tour_id) WHERE td.title LIKE ? OR td.introduction LIKE ? OR td.highlight LIKE ? OR td.description LIKE ? LIMIT ?"; 
		return $this->db->query($sql, array($like_keyword, $like_keyword, $like_keyword, $like_keyword, $top))->result_object();
	}
	
	function insert_tour($object){
		$this->db->set_dbprefix('');
		$this->db->insert("r_tour", $object);
		$ret= $this->db->insert_id();
		$this->db->set_dbprefix(SITE_REF.'_');
		return $ret;
	}
	
	function insert_tour_detail($object){
		$this->db->set_dbprefix('');
		$this->db->insert("r_tour_detail", $object);
		$ret= $this->db->insert_id();
		$this->db->set_dbprefix(SITE_REF.'_');
		return $ret;
	}
	
	function insert_tour_available_date($object){
		$this->db->set_dbprefix('');
		$this->db->insert("r_tour_available_date", $object);
		$ret= $this->db->insert_id();
		$this->db->set_dbprefix(SITE_REF.'_');
		return $ret;
	}
	
	function update_tour($id, $object){
		$this->db->set_dbprefix('');
		$this->db->where('tour_id', $id);
		$ret=$this->db->update("r_tour", $object);
		$this->db->set_dbprefix(SITE_REF.'_');
		return $ret;
	}
	
	function update_tour_detail($id, $object){
		$this->db->set_dbprefix('');
		$this->db->where('tour_id', $id);
		$ret=$this->db->update("r_tour_detail", $object);
		$this->db->set_dbprefix(SITE_REF.'_');
		return $ret;
	}
	
	function update_tour_available_date($id, $object){
		$this->db->set_dbprefix('');
		$this->db->where('tour_available_date_id', $id);
		$ret=$this->db->update("r_tour_available_date", $object);
		$this->db->set_dbprefix(SITE_REF.'_');
		return $ret;
	}
	
	function delete_tour($ids){
		$this->db->set_dbprefix('');
		$this->db->where_in('tour_id', $ids);
		$ret=$this->db->delete("r_tour");
		$this->db->set_dbprefix(SITE_REF.'_');
		return $ret;
	}
	
	function delete_tour_detail($ids){
		$this->db->set_dbprefix('');
		$this->db->where_in('tour_id', $ids);
		$ret=$this->db->delete("r_tour_detail");
		$this->db->set_dbprefix(SITE_REF.'_');
		return $ret;
	}
	
	function delete_tour_available_date_by_tour_ids($ids){
		$this->db->set_dbprefix('');
		$this->db->where_in('tour_id', $ids);
		$ret=$this->db->delete("r_tour_available_date");
		$this->db->set_dbprefix(SITE_REF.'_');
		return $ret;
	}
	
	function delete_tour_available_date($ids){
		$this->db->set_dbprefix('');
		$this->db->where_in('tour_available_date_id', $ids);
		$ret=$this->db->delete("r_tour_available_date");
		$this->db->set_dbprefix(SITE_REF.'_');
		return $ret;
	}
	
	public function count_by($params = array())
	{
		$this->db->set_dbprefix('');
		$this->db->join('r_tour_detail', 'r_tour.tour_id = r_tour_detail.tour_id')
			->join('r_city', 'r_tour.city_id = r_city.city_id')
			->join('r_tour_status', 'r_tour.tour_status_id = r_tour_status.tour_status_id');
			
		if (!empty($params['tour_status_id']))
		{
			// If it's all, then show whatever the city id
			if ($params['tour_status_id'] != '')
			{
				// Otherwise, show only the specific status
				$this->db->where('r_tour_status.tour_status_id', $params['tour_status_id']);
			}
		}
		
		if (!empty($params['title']))
		{
			$this->db
				->like('r_tour_detail.title', trim($params['title']));
		}

		if (!empty($params['city_id']))
		{
			// If it's all, then show whatever the city id
			if ($params['city_id'] > 0)
			{
				// Otherwise, show only the specific status
				$this->db->where('r_tour.city_id', $params['city_id']);
			}
		}
		
		$ret= $this->db->count_all_results('r_tour');
		$this->db->set_dbprefix(SITE_REF.'_');
		return $ret;
	}
	
	public function get_many_by($params = array())
	{
		$this->db->set_dbprefix('');
		
		if (!empty($params['tour_status_id']))
		{
			// If it's all, then show whatever the city id
			if ($params['tour_status_id'] != '')
			{
				// Otherwise, show only the specific status
				$this->db->where('r_tour_status.tour_status_id', $params['tour_status_id']);
			}
		}
		
		if (!empty($params['title']))
		{
			$this->db
				->like('r_tour_detail.title', trim($params['title']));
		}

		if (!empty($params['city_id']))
		{
			// If it's all, then show whatever the city id
			if ($params['city_id'] > 0)
			{
				// Otherwise, show only the specific status
				$this->db->where('r_tour.city_id', $params['city_id']);
			}
		}

		// Limit the results based on 1 number or 2 (2nd is offset)
		if (isset($params['limit']) && is_array($params['limit']))
			$this->db->limit($params['limit'][0], $params['limit'][1]);
		elseif (isset($params['limit']))
			$this->db->limit($params['limit']);

		
		$ret= $this->get_all();
		$this->db->set_dbprefix(SITE_REF.'_');
		return $ret;
	}
	
	public function get_all()
	{
		$this->db->set_dbprefix('');
		$this->db
			->select('r_tour.tour_id, r_city.city_name, r_tour_status.status_name, r_tour_detail.title, r_tour.available_from_date, r_tour.available_to_date')
			->join('r_tour_detail', 'r_tour.tour_id = r_tour_detail.tour_id')
			->join('r_city', 'r_tour.city_id = r_city.city_id')
			->join('r_tour_status', 'r_tour.tour_status_id = r_tour_status.tour_status_id')
			->order_by('tour_id', 'DESC');

		$ret= $this->db->get('r_tour')->result();
		$this->db->set_dbprefix(SITE_REF.'_');
		return $ret;
	}
	
	public function get($id)
	{
		$this->db->set_dbprefix('');
		$ret= $this->db
			->select('r_tour.*, r_tour_detail.*')
			->join('r_tour_detail', 'r_tour.tour_id = r_tour_detail.tour_id')
			->where(array('r_tour.tour_id' => $id))
			->get('r_tour')
			->row();
		$ret->available_dates=$this->get_tour_available_date($id);
		
		$this->db->set_dbprefix(SITE_REF.'_');
		return $ret;
	}
	
	public function get_tour_available_date($id)
	{
		$this->db->set_dbprefix('');
		$ret= $this->db
			->select('r_tour_available_date.*')
			->where('tour_id', $id)	
			->get('r_tour_available_date')
			->result();
		$this->db->set_dbprefix(SITE_REF.'_');
		return $ret;
	}
}