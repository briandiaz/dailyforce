module FormHelper
    
    def the_force_input(type: nil, html_class: nil, id: nil, value: nil, property: nil, placeholder: nil, additional: nil, required: nil)
        is_required = (required) ? "required" : nil
        "<input type='#{type}' class='#{html_class}' name='#{id}' id='#{id}' placeholder='#{placeholder}' #{additional} value='#{value.send(property)}' #{is_required}>".html_safe
        rescue
        "<input type='#{type}' class='#{html_class}' name='#{id}' id='#{id}' placeholder='#{placeholder}' #{additional} #{is_required}>".html_safe
    end
    
    alias form_input the_force_input
    
    def the_force_input_textarea(html_class: nil, id: nil, value: nil, property: nil, placeholder: nil, additional: nil, required: nil)
        is_required = (required) ? "required" : nil
        "<textarea class='#{html_class}' name='#{id}' id='#{id}' placeholder='#{placeholder}' #{additional}  #{is_required}>#{value.send(property)}</textarea>".html_safe
        rescue
        "<textarea class='#{html_class}' name='#{id}' id='#{id}' placeholder='#{placeholder}' #{additional} #{is_required}></textarea>".html_safe
    end
    
    
    alias form_input_textarea the_force_input_textarea
    
    def form_tag(accept_charset: nil, action: nil, object_id: nil, html_class: nil, controller: nil, role: nil)
        form_identifier = "#{controller.action_name}_#{controller.controller_name.singularize}" 
        form_id = (object_id) ? "#{form_identifier}_#{object_id}" : form_identifier
        
        form = "<form accept-charset='#{accept_charset}' action='#{action}/#{object_id}' class='#{html_class} #{form_identifier}' id='#{form_id}' method='post' role='#{role}'>".html_safe
        form += "<input name='_method' type='hidden' value='patch' />".html_safe if controller.action_name == "edit"
        form
    end
    
    def the_force_select(model: {}, property: {}, class_name: {}, id: {}, name: {}, value: {})
        data = current_client.picklist_values(model, property)
        begin
            selected_value = value.send(property)
        rescue Exception => e
            selected_value = ""
        ensure
            # always executed
        end
        select = "<select class='"+class_name+"' id='"+id+"' name='"+name+"'>"
        select += "<option value=''>Select the "+property+"</option>"
        data.each do |item|
           is_selected = (selected_value==item.value)? "selected": ""
           select += "<option value='"+item.value+"' "+is_selected+">"+item.label+"</option>"
        end
        select += "</select>"
        select = select.html_safe
    end
    
    alias force_select the_force_select
    
    def the_force_select_data(data: {}, model: {}, property: {}, class_name: {}, id: {}, name: {}, value: {})
        begin
            selected_value = value.send(property)
        rescue Exception => e
            selected_value = ""
        ensure
            # always executed
        end
        select = "<select class='"+class_name+"' id='"+id+"' name='"+name+"'>"
        select += "<option value=''>Select the "+property+"</option>"
        data.each do |item|
           is_selected = (selected_value==item.value)? "selected": ""
           select += "<option value='"+item.Id+"' "+is_selected+">"+item.Name+"</option>"
        end
        select += "</select>"
        select = select.html_safe
    end
    
    alias force_select_data the_force_select_data

    
    def select(data: [], class_name: "", id: "", name: "", value: "")
        select = "<select class='"+class_name+"' id='"+id+"' name='"+name+"'>"
        select += "<option value=''>Select the "+id.capitalize+"</option>"
        data.each do |item|
           is_selected = (value==item.value)? "selected": ""
           select += "<option value='"+item.Id+"' "+is_selected+">"+item.Name+"</option>"
        end
        select += "</select>"
        select = select.html_safe
    end
    
    def get_method_type(controller)
        case controller.action_name
        when "edit"
            "patch"
        when "new"
            "post"
        when "destroy"
            "delete"
        end
    end
    
end