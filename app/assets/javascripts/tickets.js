jQuery(document).ready(function() {
	$("#ticket_q_country_id").select2({allowClear: true});
	$("#ticket_q_region_id").select2({allowClear: true});
	$("#ticket_q_city_id").select2({allowClear: true});
	$("#ticket_q_age_to").select2({allowClear: true});
	$("#ticket_q_age_from").select2({allowClear: true});
	if ($('#ticket_q_country_id option:selected').val()=='') {
		$('#region').hide();
	}
	if ($('#ticket_q_region_id option:selected').val()=='') {
		$('#city').hide();
	}
});

function onCountryChange() {
	var country_selected = $('#ticket_q_country_id option:selected').val();
	var region_select = $('#ticket_q_region_id')
	jQuery.ajax({
    url: "/countries/"+ country_selected + "/regions.json",
    type: "GET",
    dataType: "json",
    success: function(data) {
    	region_select.find('option').each(function() {
			    if ( $(this).val() != '' ) {
			        $(this).remove();
			    };
			});
  		$.each(data, function(i, val){
			    region_select.append($('<option />', { value: val.id, text: val.name }));
			});
			$('#region').show();
			$('#city').hide();
  	},
  	error: function() {
  		region_select.find('option').each(function() {
			    if ( $(this).val() != '' ) {
			        $(this).remove();
			    };
			});
			$('#region').hide();
			$('#city').hide();
  	}
	});
}

function onRegionChange() {
	var country_selected = $('#ticket_q_country_id option:selected').val();
	var region_selected = $('#ticket_q_region_id option:selected').val();
	var city_select = $('#ticket_q_city_id')
	jQuery.ajax({
    url: "/countries/" + country_selected + "/regions/"+ region_selected + "/cities.json",
    type: "GET",
    dataType: "json",
    success: function(data) {
    	city_select.find('option').each(function() {
			    if ( $(this).val() != '' ) {
			        $(this).remove();
			    };
			});
  		$.each(data, function(i, val){
			    city_select.append($('<option />', { value: val.id, text: val.name }));
			});
			$('#city').show();
  	},
  	error: function() {
  		city_select.find('option').each(function() {
			    if ( $(this).val() != '' ) {
			        $(this).remove();
			    };
			});
			$('#city').hide();
  	}
	});
}