require 'spec_helper'

describe ImagesController do
  render_views

  before(:each) do
    @image = Image.find(1)
  end
 
  describe "GET 'show" do
    it "should be successful" do
      get :show, :id => @image
      response.should be_success
    end

    it "should find the right image" do
      get :show, :id => @image
      # @image.should == :id
    end
  end

end
