ActionMailer::Base.default_url_options[:host] = "localhost:3000"
ActionMailer::Base.default_url_options[:only_path] = false
ActionMailer::Base.smtp_settings = {
  :enable_starttls_auto => true,
  :address            => 'smtp.gmail.com',
  :port               => 587,
  #:tls                => true,
  :domain             => 'gmail.com', #you can also use google.com
  :authentication     => :plain,
  :user_name          => 'lareb.indore@gmail.com',
  :password           => 'sarfarosh'
}

=begin
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

ActionMailer::Base.default_url_options[:host] = "localhost:3000"
#Mail.register_interceptor(DevelopmentMailInterceptor) if Rails.env.development?
=end