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
	}
	
	/**
	* List all possible methods
	*
	* @access public
	* @return void
	*/
	public function index()
	{
		$this->template
			->build('admin/index');
	}
}
