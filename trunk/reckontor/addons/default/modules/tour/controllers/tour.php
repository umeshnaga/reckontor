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
		$this->load->model('admin_m');
		$this->load->model('tour_m');
		$this->load->model('region_m');
		$this->lang->load('tour');
		$this->load->helper('html');
		$this->template->append_js('module::ajax.js');
		
		$countries = $this->region_m->get_all_countries();
		$hot_cities = $this->region_m->get_cities_by_highlight_level('HOT CITY');
		$this->template
			 ->set('hot_cities', $hot_cities)
			 ->set('countries', $countries);
	}

	/**
	 * Index method
	 *
	 * @access public
	 * @return void
	 */
	public function index()
	{
		$countries = $this->region_m->get_all_countries();
		$hot_cities = $this->region_m->get_cities_by_highlight_level('HOT CITY');
		
		$this->template->set_layout('three_cols.html')
			   ->set_partial('left_sidebar', 'partials/left_sidebar')
			   ->set_partial('right_sidebar', 'partials/right_sidebar')
			   ->set_partial('home_slider', 'partials/home_slider');
			   
		$this->template
			 ->build('index');
	}
	
	public function search($country_id, $city_id = "") {
		
		
		$this->template->set_layout('three_cols.html')
					   ->set_partial('left_sidebar', 'partials/left_sidebar')
					   ->set_partial('right_sidebar', 'partials/right_sidebar');
					   
		$this->template
			 ->build('list_tour');
	}
	
	function detail($tour_id) {
		$tour = $this->tour_m->get_tour_by_id($tour_id);
		
		$this->template->set_layout('two_cols.html')
			   ->set_partial('left_sidebar', 'partials/left_sidebar');
			   
		$this->template->set("tour", $tour)->build('detail');
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
			   
			$this->template->set("tour_id", $this->input->post('tour_id'))->build('detail');
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
		
		$countries = $this->region_m->get_all_countries();
		
		$this->template->set_layout('two_cols.html')
			   ->set_partial('left_sidebar', 'partials/left_sidebar');
			   
		$this->template->set('booking_count', $booking_count)
					   ->set('traveler_count', $traveler_count)
					   ->set('total_fee', $total_fee)
					   ->set('booking_details', $booking_details)
					   ->set('countries', $countries)
					   ->build('checkout');
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
	
	 
}