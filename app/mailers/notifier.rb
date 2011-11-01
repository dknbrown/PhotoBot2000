class Notifier < ActionMailer::Base
  
  def contact_request(email)
    mail(:from => email, 
	 :to => 'photobot2000@gmail.com', 
	 :subject => "Photobot Inquery Form")
  end

end
