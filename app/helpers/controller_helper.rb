module ControllerHelper
  
  def create_url(controller, action, id)
    url_for :controller => controller, :action => action, :id => id
  end
  
  def create_action(object, params, url, message)
    respond_to do |format|
      object_created = object.create(params)
      controller = url.split("_")[0]
      if object_created
        format_processed(object, create_url(controller, "show", object_created), format, message)
      else
        format_unprocessable_entity(object, format)
      end
    end 
  end

  def update_action(object, params, url, message)
    respond_to do |format|
      if object.update(params)
        format_processed(object, url, format, message)
      else
        format_unprocessable_entity(object, format)
      end
    end
  end

  def destroy_action(object, id, url)
    object.destroy(id)
    respond_to do |format|
      format.html { redirect_to url }
      format.json { head :no_content }
    end
  end

  def format_unprocessable_entity(object, format)
    format.html { render action: 'new' }
  end

  def format_processed(object, url, format, message)
    format.html { redirect_to url,  notice: message }
    format.json { render action: 'show',  status: :created,  location: url }
  end
end