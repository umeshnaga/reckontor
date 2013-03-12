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
		$this->lang->load('tour');
		$this->load->helper('html');
		$this->template->set_layout('sidebar.html')->set_partial('sidebar', 'partials/sidebar');
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
		$this->template->set("tour_id", $tour_id)->build('detail');
	}
	
	function add_to_cart () {
		//$this->load->helper(array('form', 'url'));

		$this->load->library('form_validation');
		$this->form_validation->set_rules('tour_id', 'Tour', 'required|greater_than[0]');
		$this->form_validation->set_rules('day', 'Day', 'required|greater_than[0]');
		$this->form_validation->set_rules('monthyear', 'Month/Year', 'required');
		$this->form_validation->set_rules('adult_count', 'Adult', 'required|greater_than[0]');
		
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
		$this->template->build('cart');
	}
	
	function checkout() {
		$this->template->build('checkout');
	}
}