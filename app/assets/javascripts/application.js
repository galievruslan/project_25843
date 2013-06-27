//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require bootstrap-datetimepicker
//= require locales/bootstrap-datetimepicker.ru.js
//= require select2
//= require select2_locale_ru

/* ===================================================
 Date and datetime pickers 
* ===================================================*/
$(function() {
  $('.datepicker').datetimepicker({    	
	format: 'dd-MM-yyyy',
	pickTime: false,
	language: 'ru'
  });
});
$(function() {
	$('.datetimepicker').datetimepicker({    	
	format: 'dd-MM-yyyy hh:mm',
	language: 'ru'
	});
});