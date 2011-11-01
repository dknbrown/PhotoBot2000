require 'spec_helper'

describe Contact do

  before(:each) do
    @attr = { 
        :id => "1",
        :sender_name => "Example User", 
        :email => "user@example.com",
        :event_date => "01/01/2011",
        :content => "this is a spec test" }
  end

  it "should create a new contact email" do
    Contact.new(@attr)
  end

  it "should require a name" do
    no_name_user = Contact.new(@attr.merge(:sender_name => ""))
    no_name_user.should_not be_valid
  end

  it "should require an email address" do
    no_email_user = Contact.new(@attr.merge(:email => ""))
    no_email_user.should_not be_valid
  end

  it "should accept valid email addresses" do
    addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
    addresses.each do |address|
      valid_email_user = Contact.new(@attr.merge(:email => address))
      valid_email_user.should be_valid
    end
  end

  it "should reject invalid email addresses" do
    addresses = %w[user@foo,com user_at_foo.org example.user@foo. user]
    addresses.each do |address|
      invalid_email_user = Contact.new(@attr.merge(:email => address))
      invalid_email_user.should_not be_valid
    end
  end

  it "should reject names that are too long" do
    long_name = "a" * 51
    long_name_user = Contact.new(@attr.merge(:sender_name => long_name))
    long_name_user.should_not be_valid
  end

  it "should reject invalid dates" do
     bad_dates = %w[1001/01/01 01/01 01/01/01]
     bad_dates.each do |bad_date|
       invalid_date = Contact.new(@attr.merge(:event_date => bad_date))
       invalid_date.should_not be_valid
     end
  end
  
  
end
