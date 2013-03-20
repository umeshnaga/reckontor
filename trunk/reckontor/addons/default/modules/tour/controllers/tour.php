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
		$this->template->set_layout('sidebar.html')->set_partial('sidebar', 'partials/sidebar');
		$this->template->append_js('module::ajax.js');
	}

	/**
	 * Index method
	 *
	 * @access public
	 * @return void
	 */
	public function index()
	{
		if(!isset($_SESSION['countries'])) {
			$countries = $this->admin_m->get_all_countries();
			$_SESSION['countries']=$countries;
		}

		$this->template->build('index');
	}
	
	public function country($cmd) {
		switch($cmd) {
			case 'get-cities':
				$country_id = $this->input->post('country_id');
				$cities = $this->admin_m->get_all_cities($country_id,1);
				echo '<option selected="selected" value="">Select region/city</option><optgroup label="- Browse by city -">';
				foreach ($cities as $row)
				{
					echo '<option value="'.$row['city_id'].'">'.$row['city_name'].'</option>';
				}
				echo '</optgroup>';
				$regions = $this->admin_m->get_all_cities($country_id,0);
				echo '<optgroup label="- Browse by region -">';
				foreach ($regions as $row)
				{
					echo '<option value="'.$row['city_id'].'">'.$row['city_name'].'</option>';
				}
				echo '</optgroup>';
				break;
			default:
				if(!isset($_SESSION['countries'])) {
					$countries = $this->admin_m->get_all_countries();
					$_SESSION['countries']=$countries;
				}
				
				$country = $this->admin_m->get_country($cmd);
				$this->template->set('country', $country)->build('country');
				break;
		}
	}
	
	function detail($tour_id) {
		$tour = $this->tour_m->get_tour_by_id($tour_id);
		var_dump($tour);
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
		$this->template->set('booking_count', $booking_count)
					   ->set('traveler_count', $traveler_count)
					   ->set('total_fee', $total_fee)
					   ->set('booking_details', $booking_details)
					   ->set('countries', $countries)
					   ->build('checkout');
	}
	
/**
	 * 
	 * @return void
	 */
	public function cities_by_country($country_id)
	{
		$country_cities_mapping = $this->region_m->get_country_cities_mapping();
		//var_dump($country_cities_mapping[$country_id]);
		return $this->template->build_json($country_cities_mapping[$country_id]);
	}
}