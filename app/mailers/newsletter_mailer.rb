class NewsletterMailer < ApplicationMailer
  default :from => 'fashionapps3688949@gmail.com'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_email(address)
    mail( :to => address,
    :subject => 'Thanks for signing up for our amazing app' )
  end
  
end
