ActionMailer::Base.default_url_options[:host] = "localhost:3000"
ActionMailer::Base.default_url_options[:only_path] = false
#Mail.register_interceptor(DevelopmentMailInterceptor) if Rails.env.development?

ActionMailer::Base.smtp_settings = {
    :address => 'secure.emailsrvr.com',
    :port => 587,
    :domain => 'anypresence.com',
    :authentication => :login,
    :user_name => 'support@anypresence.com',
    :password => 'Kiching12',
    :enable_starttls_auto => true
}

#ActionMailer::Base.default_url_options[:host] = "localhost:3000"
#Mail.register_interceptor(DevelopmentMailInterceptor) if Rails.env.development?
