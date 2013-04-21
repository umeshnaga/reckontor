<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
/**
 *
 * Module template
 *
 * @author 		Nga
 * @package 	PyroCMS
 * @subpackage 	Tour Module
 * @category 	Modules
 * @license 	Apache License v2.0
 */
class Tour extends Public_Controller
{
	/**
	 * Constructor method
	 *
	 * @author Nga
	 * @access public
	 * @return void
	 */
	public function __construct()
	{
		parent::__construct();
		$this->load->model('common_m');
		$this->load->model('tour_m');
		$this->load->model('region_m');
		$this->load->model('booking_m');
		$this->load->model('instagram_m');
		$this->lang->load('tour');
		$this->load->helper('html');	
		$this->load->helper('user');
		$this->template->append_js('module::ajax.js');
		$this->template->append_js('module::SegmentedSearch.js');
		$this->template->append_js('module::script.js');		
		
		$countries = $this->region_m->get_all_countries();
		$hot_cities = $this->region_m->get_cities_by_highlight_level('HOT CITY');

		$shots = $this->instagram_m->getUserMedia(array('count'=>20)); //Get the shots from instagram
                
		$this->template
			 ->set('hot_cities', $hot_cities)
			 ->set('countries', $countries)
			 ->set('shots', $shots)
			 ->set('title', "Tours, sightseeing tours, activities &amp; things to do | ".SITE_URL);
	}

	/**
	 * Index method
	 *
	 * @access public
	 * @return void
	 */
	function index()
	{
		$this->template->set_layout('three_cols.html')
			   ->set_partial('left_sidebar', 'partials/left_sidebar')
			   ->set_partial('right_sidebar', 'partials/right_sidebar')
			   ->set_partial('home_slider', 'partials/home_slider');
			   
		$this->template
			 ->build('index');
	}
	
	function search($page = 1, $country_id, $city_id = "") {
		if($city_id==""){
			$tour_count = $this->tour_m->get_tours_count_by_country_id($country_id);
			
			$tours = $this->tour_m->get_tours_by_country_id($country_id, $page);
			$info = $this->region_m->get_country_by_id($country_id);
		}else {
			$tour_count = $this->tour_m->get_tours_count_by_city_id($city_id);			
			
			$tours = $this->tour_m->get_tours_by_city_id($city_id, $page);
			$info = $this->region_m->get_city_by_id($city_id);
		}
		$page_count = ceil($tour_count/RECORD_PER_PAGE);
		$page_nav=$this->common_m->get_page_nav($page, $page_count, count($tours), $tour_count);
		$title= $info->name." Tours & Things to Do in ".$info->name." | ".SITE_URL;
		
		$this->template->set_layout('three_cols.html')
					   ->set_partial('left_sidebar', 'partials/left_sidebar')
					   ->set_partial('right_sidebar', 'partials/right_sidebar');
		$this->template
			->set('title',$title)
			->set('page_nav',$page_nav)
			->set('selected_country_id', $country_id)
			->set('selected_city_id', $city_id)
			->set('country_id', $country_id)
			->set('city_id', $city_id)
			->set('location_info', $info)
			->set('tours', $tours)
			->build('list_tour');
	}
	
	function search_keyword($page = 1, $keyword){
		$keyword=urldecode($keyword);
		
		$country_destinations = $this->region_m->get_countries($keyword);
		$city_destinations = $this->region_m->get_cities($keyword);
		
		$tour_count = $this->tour_m->get_tours_count_by_keyword($keyword);
		$tours = $this->tour_m->get_tours_by_keyword($keyword, $page);
		
		$page_count = ceil($tour_count/RECORD_PER_PAGE);
		$page_nav=$this->common_m->get_page_nav($page, $page_count, count($tours), $tour_count);
		
		$this->template->set_layout('two_cols.html')
			   ->set_partial('left_sidebar', 'partials/left_sidebar');
			   
		$this->template
			 ->set('title',"Search Results for ".$keyword." on ".SITE_URL.".")
			 ->set('keyword',$keyword)
			 ->set('country_destinations',$country_destinations)
			 ->set('city_destinations',$city_destinations)
			 ->set('page_nav',$page_nav)
			 ->set('tours', $tours)
			 ->set('search_count', count($country_destinations)+count($city_destinations)+$tour_count)
			 ->set('tour_count', $tour_count)
			 ->build('search_keyword');
	}
	
	function detail($tour_id) {
		$tour = $this->tour_m->get_tour_by_id($tour_id);
		
		$this->template->set_layout('two_cols.html')
			   ->set_partial('left_sidebar', 'partials/left_sidebar');
			   
		$this->template
			->set('selected_country_id',$tour->country_id)
			->set('selected_city_id',$tour->city_id)
			->set("tour", $tour)->build('detail');
	}
	
	function add_to_cart () {
		$this->load->library('form_validation');
		$this->form_validation->set_rules('tour_id', 'Tour', 'required|greater_than[0]');
		$this->form_validation->set_rules('day', 'Day', 'required|greater_than[0]');
		$this->form_validation->set_rules('monthyear', 'Month/Year', 'required');
		$this->form_validation->set_rules('adult_count', 'Adult', 'required|greater_than[0]');
		//FIXME check `r_tour_available_date` here
		if ($this->form_validation->run() == FALSE)
		{
			$this->template->set_layout('two_cols.html')
			   ->set_partial('left_sidebar', 'partials/left_sidebar');
			$tour_id = $this->input->post('tour_id');
			$tour = $this->tour_m->get_tour_by_id($tour_id); 
			$this->template->set("tour", $tour)->set("tour_id", $tour_id)->build('detail');
		}
		else
		{
			if(!isset($_SESSION['cart'])) {
				$_SESSION['cart']=array();
			}
			$booking = new stdClass();
			$booking->tour_id =  $this->input->post('tour_id');
			$booking->day = $this->input->post('day');
			$booking->monthyear = $this->input->post('monthyear');
			$booking->adult_count = $this->input->post('adult_count');
			$booking->children_count = $this->input->post('children_count');
			
			$_SESSION['cart'][] = $booking;
			
			redirect('/tour/cart');
		}
	}
		
	function cart() {
		$bookings = $_SESSION['cart'];
		$traveler_count = 0;
		$booking_details = array();
		$total_fee = 0;
		foreach ($bookings as $i => $booking) {
			$traveler_count = $traveler_count + $booking->adult_count + $booking->children_count;
			$tour = $this->tour_m->get_tour_by_id($booking->tour_id);
			$booking_details[$i] = $booking;
			$booking_details[$i]->tour = $tour;
			
			$price_info = $this->tour_m->get_price_by_tour_id_and_day($booking->tour_id, 
													    $booking->day, 
													    $booking->monthyear);
			$booking_details[$i]->price_info = $price_info;
			$booking_details[$i]->total_fee = ($booking->adult_count * $price_info->adult_price) + 
											  ($booking->children_count * $price_info->child_price);
			$total_fee = $total_fee + $booking_details[$i]->total_fee;
		}
		$booking_count = sizeof($bookings);
		
		$this->template->set_layout('two_cols.html')
			   ->set_partial('left_sidebar', 'partials/left_sidebar');
			   
		$this->template->set('booking_count', $booking_count)
					   ->set('traveler_count', $traveler_count)
					   ->set('total_fee', $total_fee)
					   ->set('booking_details', $booking_details)
					   ->build('cart');
	}
	
	function checkout() {
		$bookings = $_SESSION['cart'];
		//Handle session time out
		$traveler_count = 0;
		$booking_details = array();
		$total_fee = 0;
		foreach ($bookings as $i => $booking) {
			$traveler_count = $traveler_count + $booking->adult_count + $booking->children_count;
			$tour = $this->tour_m->get_tour_by_id($booking->tour_id);
			$booking_details[$i] = $booking;
			$booking_details[$i]->tour = $tour;
			
			$price_info = $this->tour_m->get_price_by_tour_id_and_day($booking->tour_id, 
													    $booking->day, 
													    $booking->monthyear);
			$booking_details[$i]->price_info = $price_info;
			$booking_details[$i]->total_fee = ($booking->adult_count * $price_info->adult_price) + 
											  ($booking->children_count * $price_info->child_price);
			$total_fee = $total_fee + $booking_details[$i]->total_fee;
		}
		$booking_count = sizeof($bookings);
		
		$this->template->set_layout('two_cols.html')
			   ->set_partial('left_sidebar', 'partials/left_sidebar');
			   
		$this->template->set('booking_count', $booking_count)
					   ->set('traveler_count', $traveler_count)
					   ->set('total_fee', $total_fee)
					   ->set('booking_details', $booking_details)
					   ->build('checkout');
	}
	
	function complete_checkout() {
		$phone_area_code = $_POST['contact_area_code'];
		$phone_number = $_POST['contact_phone_number'];
		$email = $_POST['contact_email'];
		$book_by_id = $this->current_user->id;
		$booking_id = $this->booking_m->create_booking($phone_area_code, $phone_number, $email, $book_by_id);
		$travellers_of_tours = $_POST['travelers'];
		foreach ($travellers_of_tours as $tour_id => $travellers) {
			$travel_date = $_POST['travel_dates'][$tour_id];
			$booking_tour_id = $this->booking_m->create_booking_tour($tour_id, $booking_id, $travel_date);
			foreach ($travellers as $i => $traveller) {
				$this->booking_m->add_traveler($booking_tour_id, $traveller);
			}
		}
		unset($_SESSION['cart']);
		redirect('/tour/success_checkout/'. $booking_id);
		
	}
	
	function success_checkout($booking_id) {
		$booking_infos = $this->booking_m->get_booking_info_by_booking_id($booking_id);
		
		$booking = new stdClass();
		$booking->contact = new stdClass();
		$booking->contact->phone_area_code = $booking_infos[0]->phone_area_code;
		$booking->contact->phone_number = $booking_infos[0]->phone_number;
		$booking->contact->email = $booking_infos[0]->email;
		
		$booking_tours = array();
		foreach ($booking_infos as $i => $booking_info) {
			if (!isset($booking_tours[$booking_info->booking_tour_id])) {
				$booking_tour_obj = new stdClass();
				$booking_tours[$booking_info->booking_tour_id] = $booking_tour_obj;
			} else {
				$booking_tour_obj = $booking_tours[$booking_info->booking_tour_id];
			}
			
			$booking_tour_obj->tour_id = $booking_info->tour_id;
			$booking_tour_obj->tour_title = $booking_info->tour_title;
			$booking_tour_obj->travel_date = $booking_info->travel_date;
			if (!isset($booking_tour_obj->travelers)) {
				$booking_tour_obj->travelers = array();
			}
			
			$traveler_obj = new stdClass();
			$booking_tour_obj->travelers[$booking_info->traveler_id] = $traveler_obj;
			$traveler_obj->title = $booking_info->traveler_title;
			$traveler_obj->first_name = $booking_info->traveler_first_name;
			$traveler_obj->last_name = $booking_info->traveler_last_name;
			$traveler_obj->is_children = $booking_info->traveler_is_children;
			$traveler_obj->is_leader = $booking_info->traveler_is_leader;
		}
		
		$this->template->set_layout('two_cols.html')
			   ->set_partial('left_sidebar', 'partials/left_sidebar');
			   
		$booking->booking_tours = $booking_tours;
		$this->template->set('booking', $booking)
			 ->build('success_checkout');
	}
	
	/**
	 * For Ajax call
	 * @return void
	 */
	public function cities_by_country($country_id)
	{
		$country_cities_mapping = $this->region_m->get_country_cities_mapping();
		return $this->template->build_json($country_cities_mapping[$country_id]);
	}
	
	function search_keyword_ajax($keyword){
		$keyword=urldecode($keyword);
		$response= new stdClass;
		$response->destinations = $this->region_m->get_countries_ajax($keyword);
		$city_destinations = $this->region_m->get_cities_ajax($keyword);
		$response->destinations=array_merge($response->destinations,$city_destinations);
		$response->products = $this->tour_m->get_tours_by_keyword_ajax($keyword, 5);
		
		$response->moreResults=array();
		$response->moreResults[0]=new stdClass;
		$response->moreResults[0]->title="Find more results for '".$keyword."'";
		$response->moreResults[0]->url="tour/search_keyword/1/".$keyword;
		
		return $this->template->build_json($response);
	}
	 
}