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
				$this->template->build('country');
				break;
		}
	}
}