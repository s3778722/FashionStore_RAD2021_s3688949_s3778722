class LoginTokenMailer < ApplicationMailer
    default :from => 'fashionapps3688949@gmail.com'
  
    def send_email(address, token, username)
      @login_link = token
      @username = username
      mail( :to => address,
      :subject => 'Temporary Login Link' )
    end
end
  