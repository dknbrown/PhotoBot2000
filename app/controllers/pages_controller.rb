class PagesController < ApplicationController
  def home
    @title = "Home"
   
    @image_all = Image.all
    @image_start = Image.first 
 
  end

end
