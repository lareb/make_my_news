class SessionsController < Devise::SessionsController

  def create
    resource = warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#failure")
    sign_in(resource_name, resource)
    #news#new
    #redirect_to new_news_path
    flash[:notice] = "Sign in successfully"
    redirect_to "/"
    #return render :json => {:success => true, :content => render_to_string(:layout => false, :partial => 'sessions/manager')}
  end

  def failure
    #return render:json => {:success => false, :errors => ["Login failed."]}
    @errors = "" #intigrate flash messages here
    flash[:alert] = "Oopss!! womething wrong.."
    redirect_to "/"
  end

  # GET /resource/sign_up
  def new
    resource = build_resource({})
    respond_with_navigational(resource){ render_with_scope :index, :home }
  end

   # DELETE /resource/sign_out
  def destroy
    signed_in = signed_in?(resource_name)
    redirect_path = after_sign_out_path_for(resource_name)
    Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)
    #set_flash_message :notice, :signed_out if signed_in

    # We actually need to hardcode this as Rails default responder doesn't
    # support returning empty response on GET request
    flash[:alert] = "Sign out successfully"
    respond_to do |format|
      format.any(*navigational_formats) { redirect_to redirect_path }
      format.all do
        method = "to_#{request_format}"
        text = {}.respond_to?(method) ? {}.send(method) : ""
        render :text => text, :status => :ok
      end
    end
  end

  # POST /resource
=begin
  def create
    build_resource
    if resource.save
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_navigational_format?
        sign_in(resource_name, resource)
        respond_with resource, :location => after_sign_up_path_for(resource)
      else
        set_flash_message :notice, :inactive_signed_up, :reason => inactive_reason(resource) if is_navigational_format?
        expire_session_data_after_sign_in!
        respond_with resource, :location => after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords(resource)
      respond_with_navigational(resource) { render_with_scope :new }
    end
  end
=end
end
