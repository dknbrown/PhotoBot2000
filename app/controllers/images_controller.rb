class ImagesController < ApplicationController
  

  def show
    @image = Image.find(params[:id]) 
    @title = @image.name 
    @image_size = Image.last.id
    @image_start = Image.first.id 
  end

end
