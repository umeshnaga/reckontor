<?php defined('BASEPATH') or exit('No direct script access allowed');
define('RECORD_PER_PAGE', 15);
define('MAX_PAGE_DISPLAYED', 5);
define('DEFAULT_TOUR_PHOTO_PATH','photo_154x109.png');
define('DATE_VALUE_PATTERN','m Y');
define('DATE_TEXT_PATTERN','M Y');
define('SITE_URL', 'Ongoasia.com');
/**
 *
 *
 * @author 		Nga
 * @package 	PyroCMS
 * @subpackage 	Tour Module
 * @category 	Modules
 * @license 	Apache License v2.0
 */
class Common_m extends MY_Model {
	public function __construct()
	{
	}
	
	public function get_page_nav($page, $page_count, $current_page_record_count, $record_count)
	{
		$nav=array();
		$page_start=max(1,$page-2);
		$page_end=min($page_start+MAX_PAGE_DISPLAYED-1,$page_count);
		if($page_end-$page_start+1-MAX_PAGE_DISPLAYED<0){
			$page_start= max(1,$page_end+1-MAX_PAGE_DISPLAYED);
		}
		$next_page=$page+1;
		if ($next_page>$page_count){
			$next_page=0;
		}
		$start_record=($page-1)*RECORD_PER_PAGE+1;
		$end_record=$start_record+$current_page_record_count-1;
		return array("page"=>$page,"page_start"=>$page_start,"page_end"=>$page_end,"page_count"=>$page_count,"next_page"=>$next_page,
			"start_record"=>$start_record,"end_record"=>$end_record,"record_count"=>$record_count);
	}
}