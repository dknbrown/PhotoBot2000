require 'spec_helper'

describe ContactsController do
  render_views
describe "GET 'new'" do
it "should be successful" do
  get 'new'
  response.should be_success
end
it "should have the right title" do
  get 'new'
  response.should have_selector("title", 
            :content => "| Contact")
end
end


end
