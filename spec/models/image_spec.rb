require 'spec_helper'

describe Image do
  before(:each) do
    @attr = { :name => "gal_test.jpg" }
  end

  it "should create a new instance given valid attributes" do
    Image.create!(@attr)
  end

  it "should require a name" do
    no_name_image = Image.new(@attr.merge(:name => ""))
    no_name_image.should_not be_valid
  end
end
