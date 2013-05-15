$(document).ready(function() {
	$(".datepicker").datepicker({dateFormat: 'yy-mm-dd'});
	
	function loadPhoto(ele){
		val=ele.val();
		if(val>0){
			$(".photo_preview").html('<div><img src="'+SITE_URL+'files/thumb/'+ele.val()+'/154/109/fit"/></div>');
		}else {
			$(".photo_preview").html('');
		}
	}
	
	loadPhoto($('select[name="photo_id"]'));
	
	$('select[name="photo_id"]').change(function(){
		loadPhoto($(this));
	});
	
	$("#btn_add_date_range").click(function() {
		tr=$('<tr><td><input type="checkbox" name="action_to[]"><input type="hidden" name="tour_available_date_id[]" value=""/><input type="hidden" name="tour_available_date_status[]" value="create"/></td>'
				+ '<td><input type="text" name="available_from_date[]" maxlength="10" class="datepicker" /></td>'
				+ '<td><input type="text" name="available_to_date[]" maxlength="10" class="datepicker" /></td>'
				+ '<td><input type="text" name="adult_price[]" maxlength="20" /></td>'
				+ '<td><input type="text" name="child_price[]" maxlength="20" /></td>'
				+ '</td><td class="actions"><input type="button" value="Delete" class="btn red small btn_delete_date_range" /></td></tr>');
		
		tr.find('input[name^="available_from_date"]').val($("#tmp_available_from_date").val());
		tr.find('input[name^="available_to_date"]').val($("#tmp_available_to_date").val());
		tr.find('input[name^="adult_price"]').val($("#tmp_adult_price").val());
		tr.find('input[name^="child_price"]').val($("#tmp_child_price").val());	
		$("#tbl_date_range tbody").append(tr);
		
		$(".datepicker").datepicker({dateFormat: 'yy-mm-dd'});
		$('#tbl_date_range tr.newrow input[type="text"]').val("");			
	});

	$(".btn_delete_date_range").live('click',function() {
		if(confirm("Are you sure you want to delete this?")){
			tr=$(this).parent().parent();
			tour_available_date_id=tr.find('input[name^="tour_available_date_id"]').val();
			tr.remove();
			if(tour_available_date_id!=""){
				ele=$('input[name="delete_tour_available_date_ids"]');
				ele.val(ele.val()+tour_available_date_id+",");
			}
		}
	});
	
	$("#btn_delete_all_date_range").click(function() {
		tds=$('#tbl_date_range tr td:has(input:checked)');
		if(tds.length>0){
			if(confirm("Are you sure you want to delete this?")){
				delete_ids="";
				tds.each(function(){
					tr=$(this).parent();
					tour_available_date_id=tr.find('input[name^="tour_available_date_id"]').val();
					if(tour_available_date_id!=""){
						delete_ids+=tour_available_date_id+",";
					}
					tr.remove();
				})
				ele=$('input[name="delete_tour_available_date_ids"]');
				ele.val(ele.val()+delete_ids);
			}
		}			
	});
});