<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Module_Tour extends Module {

    public $version = '1.0';

    public function info() {
        return array(
            'name' => array(
                'en' => 'Tour System'
            ),
            'description' => array(
                'en' => 'Tour System for Ongoasia'
            ),
			'frontend'	=> true,
			'backend'	=> true,
            'menu' => 'Tour',
            'sections' => array(
			    'tours' => array(
				    'name' => 'Tour',
				    'uri' => 'admin/tour',
				    'shortcuts' => array(
						array(
					 	   	'name' => 'tour_create_title',
						    'uri' => 'admin/tour/create',
						    'class' => 'add'
						),
						array(
					 	   	'name' => 'tour_manage_photo',
						    'uri' => 'admin/files'
						)
					)
				),
				'bookings' => array(
				    'name' => 'Booking',
				    'uri' => 'admin/tour/booking'
			    ),
		    ),
        );
    }

    public function install() {
        return true;
    }

    public function uninstall() {
		return true;
    }

    public function upgrade($old_version) {
        // Your Upgrade Logic
        return true;
    }

    public function help() {
        // Return a string containing help info
        // You could include a file and return it here.
        return "<h4>Overview</h4>
		<p>The tour module for Ongoasia.</p>";
    }

}

/* End of file details.php */