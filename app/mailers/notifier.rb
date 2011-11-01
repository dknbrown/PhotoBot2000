class Notifier < ActionMailer::Base
  
  def contact_request(sender)
    @sender = sender
    mail(:from => 'phoyobot2000@gmail.com', 
	 :to => 'photobot2000@gmail.com', 
	 :subject => "Photobot Inquery Form")
  end

end
