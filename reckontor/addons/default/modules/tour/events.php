<?php defined('BASEPATH') OR exit('No direct script access allowed');
/**
 * Sample Events Class
 * 
 * @package     PyroCMS
 * @subpackage  Sample Module
 * @category    events
 * @author      PyroCMS Dev Team
 */
class Events_Tour 
{
    protected $ci;
    
    public function __construct()
    {
        $this->ci =& get_instance();
        
        // register the public_controller event when this file is autoloaded
        Events::register('pre_user_logout', array($this, 'run'));
     }
    
    // this will be triggered by the Events::trigger('public_controller') code in Public_Controller.php
    public function run()
    {
    	unset($_SESSION['cart']);
    }
    
}
/* End of file events.php */