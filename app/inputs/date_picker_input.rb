class DatePickerInput < SimpleForm::Inputs::Base
  def input
  	template.content_tag(:div, class: "input-append date datepicker") do
		"#{@builder.text_field(attribute_name, input_html_options)}".html_safe + 
	  	template.content_tag(:span, class: "add-on") do 
		   template.content_tag(:i, nil, :data => {time_icon: 'icon-time', date_icon: 'icon-calendar'})
	  	end
	end
  end
end