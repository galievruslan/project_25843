jQuery(document).ready(function() {
	$("#user_country_id").select2({allowClear: true});
	$("#user_region_id").select2({allowClear: true});
	$("#user_city_id").select2({allowClear: true});
	$('#region').hide();
	$('#city').hide();
});

function onCountryChange() {
	var country_selected = $('#user_country_id option:selected').val();
	var region_select = $('#user_region_id')
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
	var country_selected = $('#user_country_id option:selected').val();
	var region_selected = $('#user_region_id option:selected').val();
	var city_select = $('#user_city_id')
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