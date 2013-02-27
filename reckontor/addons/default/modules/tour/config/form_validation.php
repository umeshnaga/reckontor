<?php
$config = array(
    'suppliers' => array(
        array(
	'field' => 'supplier_name',
	'label' => 'lang:contractors.suppliers.form_name',
	'rules' => 'trim|max_length[255]|required|alpha_dash|xss_clean'
	)),

    'clients' => array(
        array(
	'field' => 'name',
	'label' => 'lang:contractors.clients.form_name',
	'rules' => 'trim|max_length[255]|required|alpha_dash|xss_clean'
	))
	
	);
?>