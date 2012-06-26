class UserMailer < Devise::Mailer
  default :from => "support@makemynews.com"

  def welcome_email(user)
    @user = user
    @url = "http://localhost.com:3000/users/login"
    mail(:to => user.email, :subject => "Welcome to Make My NEWS")
  end

  def welcome_email2(user_email)
    puts "================================="
    puts user_email
    @user = user_email
    @url  = "http://localhost:3000"
    t = mail(:to => user_email, :subject => "Welcome to Make My NEWS")
    puts "#{t}\n============END HERE============="
  end  

end
