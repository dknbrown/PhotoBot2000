class Contact
  include ActiveModel::Validations
 
  #validates_presence_of :email, :sender_name, :event_date, :content
  # to deal with form, you must have an id attribute
  attr_accessor :id, :email, :sender_name, :event_date, :content
  
  validates :sender_name,  :presence => true,
                    :length   => { :maximum => 50 }
  
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, :presence => true,
            :format => { :with => email_regex }
  date_regex = /\d{2}\/\d{2}\/\d{4}/
  validates :event_date, :presence => true,
            :format => { :with => date_regex }
  validates :content, :presence => true


  def initialize(attributes = {})
    attributes.each do |key, value|
      self.send("#{key}=", value)
    end
    @attributes = attributes
  end
 
  def read_attribute_for_validation(key)
    @attributes[key]
  end
 
  def to_key
  end
 
  def save
    if self.valid?
      Notifier.contact_request(self).deliver!
      return true
    end
    return false
  end
end
