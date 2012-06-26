class RegistrationsController < Devise::RegistrationsController
  #include Devise::Controllers::InternalHelpers
# POST /resource
  def create
    build_resource
    if resource.save
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_navigational_format?
        sign_in(resource_name, resource)
        #send email
        UserMailer.welcome_email(current_user).deliver
        respond_with resource, :location => "/"
      else
        set_flash_message :notice, :inactive_signed_up, :reason => inactive_reason(resource) if is_navigational_format?
        expire_session_data_after_sign_in!
        respond_with resource, :location => after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords(resource)
      flash[:notice] = resource.errors #flash[:notice].to_a.concat resource.errors.full_messages
      error = {}

      form_fields = {:first_name => params[:user][:first_name], :last_name => params[:user][:last_name], :email => params[:user][:email]}
      resource.errors.each do |k, v|
        error[k.to_sym] = "<#>#{params[:user][k.to_sym]}"
      end
      error = form_fields.merge(error)
      flash[:error] = error
      redirect_to "/"
      #respond_with_navigational(resource) { render_with_scope :new }
    end
  end

  def new
    resource = build_resource({})
    respond_with_navigational(resource){ render_with_scope :new }
  end
end