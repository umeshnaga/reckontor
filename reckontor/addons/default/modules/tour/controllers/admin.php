<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
/**
 *
 *
 * @author 		Nga
 * @package 		PyroCMS
 * @subpackage 	Tour Module
 * @category 	Modules
 * @license 	Apache License v2.0
 */
class Admin extends Admin_Controller
{
	/**
	 * The current active section
	 *
	 * @var string
	 */
	protected $section = 'tours';
	
	/**
	 * Array that contains the validation rules
	 *
	 * @var array
	 */
	protected $validation_rules = array(
		array(
		'field' => 'city_id',
		'label' => 'City',
		'rules' => 'trim|required'
		),
		array(
		'field' => 'tour_status_id',
		'label' => 'Tour status',
		'rules' => 'trim|required'
		),
		array(
		'field' => 'code',
		'label' => 'Code',
		'rules' => 'trim|required|max_length[20]|alphanumeric'
		),
		array(
		'field' => 'title',
		'label' => 'Title',
		'rules' => 'trim|htmlspecialchars|required|max_length[2056]'
		),
		array(
		'field' => 'common_adult_price',
		'label'	=> 'Common adult price',
		'rules'	=> 'trim|required|max_length[20]|numeric'
		),
		array(
		'field' => 'common_child_price',
		'label'	=> 'Common child price',
		'rules'	=> 'trim|required|max_length[20]|numeric'
		),
		array(
		'field' => 'duration',
		'label'	=> 'Duration',
		'rules'	=> 'trim|required|max_length[100]'
		),
		array(
		'field' => 'photo_id',
		'label'	=> 'Photo',
		'rules'	=> 'trim|required|numeric'
		),
		array(
		'field' => 'introduction',
		'label' => 'Introduction',
		'rules' => 'trim|required'
		),
		array(
		'field' => 'highlight',
		'label' => 'Highlight',
		'rules' => 'trim|required'
		),
		array(
		'field' => 'description',
		'label' => 'Description',
		'rules' => 'trim|required'
		),
		array(
		'field' => 'scheduler',
		'label' => 'Scheduler',
		'rules' => 'trim|required'
		),
		array(
		'field' => 'additional_info',
		'label' => 'Additional info',
		'rules' => 'trim|required'
		),
		array(
		'field' => 'available_from_date[]',
		'label' => 'Available from date',
		'rules' => 'trim|required|maxlength[10]|callback__check_date[Available from date]'
		),
		array(
		'field' => 'available_to_date[]',
		'label' => 'Available to date',
		'rules' => 'trim|required|maxlength[10]|callback__check_date[Available to date]|callback__compare_date'
		),
		array(
		'field' => 'adult_price[]',
		'label'	=> 'Adult price',
		'rules'	=> 'trim|required|max_length[20]|numeric'
		),
		array(
		'field' => 'child_price[]',
		'label'	=> 'Child price',
		'rules'	=> 'trim|required|max_length[20]|numeric'
		),
		array(
		'field' => 'delete_tour_available_date_ids',
		'label'	=> 'delete_tour_available_date_ids',
		'rules'	=> ''
		));

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
		$this->load->model('tour_status_m');
		$this->load->model('tour_photo_m');
		$this->load->model('region_m');
		$this->load->model('booking_m');
		$this->lang->load('tour');
		$this->load->helper('html');
		$this->load->helper('user');
		$this->load->library('form_validation');
	}

	/**
	 * Index method
	 *
	 * @access public
	 * @return void
	 */
	public function index()
	{
		$all_cities = $this->region_m->get_city_options();
		$all_tour_statuses = $this->tour_status_m->get_tour_status_options();
		//set the base/default where clause
		$base_where = array();

		//add post values to base_where if f_module is posted
		if ($this->input->post('f_tour_status_id')) 	$base_where['tour_status_id'] = $this->input->post('f_tour_status_id');
		if ($this->input->post('f_city_id')) 	$base_where['city_id'] 	= $this->input->post('f_city_id');
		if ($this->input->post('f_title')) 	$base_where['title'] = $this->input->post('f_title');

		// Create pagination links
		$total_rows = $this->tour_m->count_by($base_where);
		$pagination = create_pagination('admin/tour/index', $total_rows);

		// Using this data, get the relevant results
		$tours = $this->tour_m->limit($pagination['limit'])->get_many_by($base_where);

		//do we need to unset the layout because the request is ajax?
		$this->input->is_ajax_request() and $this->template->set_layout(FALSE);
		
		$this->template
			->title($this->module_details['name'])
			->append_js('admin/filter.js')
			->set_partial('filters', 'admin/partials/filters')
			->set('pagination', $pagination)
			->set('all_cities', $all_cities)
			->set('all_tour_statuses', $all_tour_statuses)
			->set('tours', $tours);

		$this->input->is_ajax_request()
			? $this->template->build('admin/tables/tours')
			: $this->template->build('admin/index');
	}

	public function create(){
		$this->form_validation->set_rules($this->validation_rules);

		$post = new stdClass;
		$post->tour_id=null;
		
		if ($this->form_validation->run())
		{
			$tour_available_from_date=min($_POST['available_from_date']);
			$tour_available_to_date=max($_POST['available_to_date']);

			if ($tour_id = $this->tour_m->insert_tour(array(
				'city_id'			 => $this->input->post('city_id'),
				'tour_status_id'	 => $this->input->post('tour_status_id'),
				'common_adult_price' => $this->input->post('common_adult_price'),
				'common_child_price' => $this->input->post('common_child_price'),
				'available_from_date'=> $tour_available_from_date,
				'available_to_date'	 => $tour_available_to_date,
				'duration'	 		 => $this->input->post('duration'),
				'photo_id'	 		 => $this->input->post('photo_id')
			)))
			{
				if ($this->tour_m->insert_tour_detail(array(
					'tour_id'			=> $tour_id,
					'code'	 			=> $this->input->post('code'),
					'title' 			=> $this->input->post('title'),
					'introduction' 		=> $this->input->post('introduction'),
					'highlight'			=> $this->input->post('highlight'),
					'description'	 	=> $this->input->post('description'),
					'scheduler'	 		=> $this->input->post('scheduler'),
					'additional_info'	=> $this->input->post('additional_info')
				))){
					if($this->add_tour_available_dates($tour_id)){
						$this->clear_tour_related_cache();
						$this->session->set_flashdata('success', sprintf('The tour "%s" was added.', $this->input->post('title')));
						redirect('admin/tour');
					}
				}
			}
			$this->session->set_flashdata('error', "An error occured.");
			redirect('admin/tour/create');
		}
		
		// Go through all the known fields and get the post values
		foreach ($this->validation_rules as $key => $field)
		{
			$post->$field['field'] = set_value($field['field']);
		}
		
		$this->assign_tour_available_dates_data($post);
		
		$this->template->title($this->module_details['name'], 'Add new tour');
		
		$this->build_page($post);
	}
	
	/**
	 * Edit tour
	 *
	 * 
	 * @param int $id the ID of the tour to edit
	 * @return void
	 */
	public function edit($id = 0)
	{
		$id OR redirect('admin/tour');
		
		$this->form_validation->set_rules($this->validation_rules);
		
		$post = $this->tour_m->get($id);
		$post->original_title=$post->title;
		$post->delete_tour_available_date_ids='';
		
		if ($this->form_validation->run())
		{
			$tour_available_from_date=min($_POST['available_from_date']);
			$tour_available_to_date=max($_POST['available_to_date']);
			
			$tour_id=$this->input->post('tour_id');
			if ($this->tour_m->update_tour($tour_id, array(
				'city_id'			 => $this->input->post('city_id'),
				'tour_status_id'	 => $this->input->post('tour_status_id'),
				'common_adult_price' => $this->input->post('common_adult_price'),
				'common_child_price' => $this->input->post('common_child_price'),
				'available_from_date'=> $tour_available_from_date,
				'available_to_date'	 => $tour_available_to_date,
				'duration'	 		 => $this->input->post('duration'),
				'photo_id'	 		 => $this->input->post('photo_id')
			)))
			{
				if ($this->tour_m->update_tour_detail($tour_id, array(
					'code'	 			=> $this->input->post('code'),
					'title' 			=> $this->input->post('title'),
					'introduction' 		=> $this->input->post('introduction'),
					'highlight'			=> $this->input->post('highlight'),
					'description'	 	=> $this->input->post('description'),
					'scheduler'	 		=> $this->input->post('scheduler'),
					'additional_info'	=> $this->input->post('additional_info')
				))){
					if($this->update_tour_available_dates($tour_id)){
						$this->clear_tour_related_cache();
						$this->session->set_flashdata('success', sprintf('The tour "%s" was updated.', $this->input->post('title')));
						redirect('admin/tour');
					}
				}
			}
			$this->session->set_flashdata('error', "An error occured.");
			redirect('admin/tour/edit/' . $id);
		}

		// Go through all the known fields and get the post values
		foreach ($this->validation_rules as $key => $field)
		{
			if (isset($_POST[$field['field']]))
			{
				$post->$field['field'] = set_value($field['field']);
			}
		}
		
		if($this->input->post('tour_id')) {
			$this->assign_tour_available_dates_data($post);
		}
		
		$this->template
		->title($this->module_details['name'], 'Edit tour "'.$post->original_title.'"');
		
		$this->build_page($post);
	}
	
	/**
	 * Delete tour
	 * 
	 * @param int $id the ID of the tour to delete
	 * @return void
	 */
	public function delete($id = 0)
	{
		// Delete one
		$ids = ($id) ? array($id) : $this->input->post('action_to');

		// Go through the array of tours to delete
		if ( ! empty($ids))
		{
			if ($this->tour_m->delete_tour_available_date_by_tour_ids($ids))
			{
				if ($this->tour_m->delete_tour_detail($ids)){
					if ($this->tour_m->delete_tour($ids)){
						$this->clear_tour_related_cache();
		
						if (count($ids) == 1)
						{
							$this->session->set_flashdata('success', 'The tour has been deleted.');
						}
						else
						{
							$this->session->set_flashdata('success', 'The tours have been deleted.');
						}
						redirect('admin/tour');
					}
				}
				
			}
			$this->session->set_flashdata('error', 'An error occured.');
		}
		redirect('admin/tour');
	}
	
	/**
	 * Helper method to determine what to do with selected items from form tour
	 * 
	 * @return void
	 */
	public function action()
	{
		switch ($this->input->post('btnAction'))
		{			
			case 'delete':
				$this->delete();
			break;
			
			default:
				redirect('admin/tour');
			break;
		}
	}
	
	private function build_page($post){
		$all_cities = $this->region_m->get_city_options();
		$all_tour_statuses = $this->tour_status_m->get_tour_status_options();
		$all_tour_photos = $this->tour_photo_m->get_tour_photo_options();
		
		
		$this->template->append_metadata($this->load->view('fragments/wysiwyg', $this->data, TRUE))
		->append_js('jquery/jquery.tagsinput.js')
		->append_css('jquery/jquery.tagsinput.css')
		->append_css('module::admin.css')
		->append_js('module::admin_tour.js')
		->set('all_cities', $all_cities)
		->set('all_tour_statuses', $all_tour_statuses)
		->set('all_tour_photos', $all_tour_photos)
		->set('post', $post)
		->build('admin/form');
	}
	
	private function assign_tour_available_dates_data(&$post){
		$post->available_dates = array();
		
		$items = $this->input->post('tour_available_date_id');
		if ( ! empty($items)){
			foreach ($items as $i => $item) {
				$available_date=new stdClass();
				$available_date->tour_available_date_id= $_POST['tour_available_date_id'][$i];
				$available_date->tour_available_date_status= $_POST['tour_available_date_status'][$i];
				$available_date->available_from_date= $_POST['available_from_date'][$i];
				$available_date->available_to_date= $_POST['available_to_date'][$i];
				$available_date->adult_price= $_POST['adult_price'][$i];
				$available_date->child_price= $_POST['child_price'][$i];
				array_push($post->available_dates,$available_date);
			}
		}
	}
	
	private function add_tour_available_dates($tour_id){
		$items = $this->input->post('tour_available_date_id');
		if ( ! empty($items)){
			foreach ($items as $i => $item) {
				if (!$this->tour_m->insert_tour_available_date(array(
					'tour_id'			 => $tour_id,
					'available_from_date'=> $_POST['available_from_date'][$i],
					'available_to_date'	 => $_POST['available_to_date'][$i],
					'adult_price'=> $_POST['adult_price'][$i],
					'child_price'=> $_POST['child_price'][$i]
				))){
					return false;
				}
			}
		}
		return true;
	} 
	
	private function clear_tour_related_cache(){
		$this->pyrocache->delete('tour_m');
		$this->pyrocache->delete('region_m');
	}
	
	private function update_tour_available_dates($tour_id){						
		$delete_ids=$this->input->post('delete_tour_available_date_ids');
		if($delete_ids!=''){
			if(!$this->tour_m->delete_tour_available_date(explode(",", $delete_ids))){
				return false;
			}
		}
		
		$items = $this->input->post('tour_available_date_id');
		if ( ! empty($items)){
			foreach ($items as $i => $item) {
				$status=$_POST['tour_available_date_status'][$i];
				if($status=='create'){
					$ret=$this->tour_m->insert_tour_available_date(array(
						'tour_id'			 => $tour_id,
						'available_from_date'=> $_POST['available_from_date'][$i],
						'available_to_date'	 => $_POST['available_to_date'][$i],
						'adult_price'=> $_POST['adult_price'][$i],
						'child_price'=> $_POST['child_price'][$i]
					));
				} else{
					$ret=$this->tour_m->update_tour_available_date($_POST['tour_available_date_id'][$i], array(
						'available_from_date'=> $_POST['available_from_date'][$i],
						'available_to_date'	 => $_POST['available_to_date'][$i],
						'adult_price'=> $_POST['adult_price'][$i],
						'child_price'=> $_POST['child_price'][$i]
					));		
				}
				if(!$ret){
					return false;
				}
			}
		}
		return true;
	}
	
	/**
	 * Callback method used in validation rules
	 */
	function _check_date($value, $label)
	{
		$this->form_validation->set_message('_check_date', "The ".$label." field must be valid date in yyyy-mm-dd format");
		return date('Y-m-d', strtotime($value)) == $value;
	}

	function _compare_date($value)
	{
		$items = $this->input->post('tour_available_date_id');
		if ( ! empty($items)){
			$item_count=count($items);
			for($i=0;$i<$item_count;$i++){
				$available_from_date=$_POST['available_from_date'][$i];
				$available_to_date=$_POST['available_to_date'][$i];
				if (strtotime($available_to_date) < strtotime($available_from_date)){
					$this->form_validation->set_message('_compare_date', "The Available to date field must be equal or later than the Available from date field");
					return false;
				}
			}
			for($i=0;$i<$item_count;$i++){
				$available_from_dateA=$_POST['available_from_date'][$i];
				$available_to_dateA=$_POST['available_to_date'][$i];

				for($j=$i+1;$j<$item_count;$j++){
					$available_from_dateB=$_POST['available_from_date'][$j];
					$available_to_dateB=$_POST['available_to_date'][$j];
						
					if($available_from_dateA<$available_to_dateB && $available_to_dateA>$available_from_dateB){
						$this->form_validation->set_message('_compare_date', "The Available date range is overlapped");
						return false;
					}else{
						if($available_to_dateA==$available_from_dateB || $available_from_dateA==$available_to_dateB){
							$this->form_validation->set_message('_compare_date', "The Available date range is overlapped");
							return false;
						}
					}
				}
			}
		}
		return true;
	}
}
