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
                'en' => 'Tour System'
            ),
            'frontend' => TRUE,
            'backend' => TRUE,
            'menu' => 'content'
        );
    }

    public function install() {
        return TRUE;
    }

    public function uninstall() {
        return TRUE; //Not interested in uninstalling this for the time being.
    }

    public function upgrade($old_version) {
        // Your Upgrade Logic
        return TRUE;
    }

    public function help() {
        // Return a string containing help info
        // You could include a file and return it here.
        return "<h4>Overview</h4>
		<p>The tour module is the application that controls the submitting of Tour Hours of Work, and generates receipts based on that input.</p>
		<h4>More information to be added</h4>
		<p>Help will be added here</p>";
    }

}

/* End of file details.php */