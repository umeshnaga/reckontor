<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
/**
*
* The galleries module enables users to create albums, upload photos and manage their existing albums.
*
* @author 		Nga
* @package 		PyroCMS
* @subpackage 	Contractors Module
* @category 	Modules
* @license 	Apache License v2.0
*/
class Admin extends Admin_Controller
{
	public $id = 0;
			
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
		
		$this->load->library('form_validation');
		$this->form_validation->set_message('required', lang('tour.form_required'));
		
		$this->load->helper('html');
		$this->template->set_partial('shortcuts', 'admin/partials/navigation');
	}
	
	/**
	* List all possible methods
	*
	* @access public
	* @return void
	*/
	public function index()
	{
		$data_tables = array('tour.suppliers', 'tour.clients');
		$this->template
			->title($this->module_details['name'])
			->set('data_tables', $data_tables)
			->build('admin/index');
	}
	
	public function suppliers($cmd = 'index') {
		switch($cmd) {
			case 'index':
			$data_suppliers = $this->admin_m->get_all_suppliers();
			/// SUPPLIERS DATA ///
			$rows = 0;
			$cols = 0; 
			$isEmpty = 1;
			if (!empty($data_suppliers)) 
			{
				$isEmpty = 0;
				$cols = count($data_suppliers[0]);
				$rows = count($data_suppliers);
			} 
			
			$suppliers = array(
				'isEmpty' => $isEmpty,
				'cols' => $cols,
				'rows' => $rows
			);
			
			$this->template
			->append_metadata( css('buttons.css', 'tour'))
			->append_metadata( js('jquery/jquery.min.js') )
			->append_metadata( js('jquery.editable.js', 'tour') )
			->append_metadata( js('script.js', 'tour') )
			->title($this->module_details['name'])
			->set('cmd_index', 1)
			->set('data_suppliers', $data_suppliers)
			->set('suppliers', $suppliers)
			->build('admin/suppliers');
			break;
			case 'add':
			
			if ($this->form_validation->run('suppliers') ) 
			{
				$data = 
				array(
					'name' => set_value('supplier_name')
				);
				
				if ($id = $this->admin_m->insert_supplier($data))
				{
					$this->session->set_flashdata('success', sprintf(lang('tour.suppliers.add_success'), $data['name']) );
					redirect($this->uri->uri_string);
				}
				else
				{
					$this->session->set_flashdata('error', lang('tour.suppliers.add_error') );
					redirect($this->uri->uri_string);
				}
			}
			
			$this->template
			->append_metadata(css('buttons.css', 'tour'))
			//->append_metadata( js('jquery/jquery.min.js') )
			//->append_metadata( js('jquery.ajaxContractors.js', 'tour') )
			//->append_metadata( js('script.js', 'tour') )
				->title($this->module_details['name'])
				->set('cmd_add', 1)
				->build('admin/suppliers');
			break;
			
			case 'edit':
			$id = $this->input->post('supplier_id');
			$arr_result = ($this->admin_m->get_supplier($id));
			$result = $arr_result['name'];
			
			if ($this->form_validation->run('suppliers')) 
			{
				$data = 
				array(
					'name' => $this->input->post('supplier_name'),
					'id' => $id
				);
				
				if ($id = $this->admin_m->update_supplier($data['id'], $data))
				{
					$result = $data['name'];
				}
			}
			echo $result;
			break;
			
			case 'delete':
			
				$id = $this->input->post('supplier_id');
				if ($id = $this->admin_m->delete_supplier($id))
				{
					echo "success";
				}
				else
				{
					echo "error";
				}
				
			break;
			
			default:
			echo "Unknown action for specified module";
		}
	}
	
	public function clients($cmd = 'index') {
		switch($cmd) {
			case 'index':
			$data_clients = $this->admin_m->get_all_clients();
			$this->template
			->append_metadata(css('buttons.css', 'tour'))
				->title($this->module_details['name'])
				->set('cmd_index', 1)
				->set('clients', $data_suppliers)
				->build('admin/clients');
			break;
			case 'add':
			$this->template
			->append_metadata(css('buttons.css', 'tour'))
				->title($this->module_details['name'])
				->set('cmd_add', 1)
				->build('admin/clients');
			break;
			default:
			echo "Unknown action for specified module";
		}
	}
	
}
