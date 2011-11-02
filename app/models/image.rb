class Image < ActiveRecord::Base
  attr_accessible :name, :length, :width
  
  validates :name, :presence => true

  def self.all_images 
    Image.all
  end

  
    
  

end
