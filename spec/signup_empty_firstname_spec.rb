require 'spec_helper'


RSpec.describe "Sign up with empty first name" do

let(:last) {"Cavcic"}
let(:password) {"password"}
let(:confirm) {"password"}
let(:login) {Login.new(@browser)}
let(:register) {Register.new(@browser)}
let(:rng) {Random.new}
let(:email){"email_"+rng.rand(100).to_s+"@hotmail.com"}



  context "Click on Sign up" do

  	it "Sign up Page" do
  			
      login.click_on_signup
  		expect(@browser.text).to include("SIGN UP")
  		
    end
  	
  end

  context "Add information" do


  	it "Last name added" do

  		register.add_lastname(last)

    end

    it "Email added" do

    	register.add_email(email)

  	end

  	it "Password" do

  		register.add_password(password)
  	    
  	end

  	it "Confirm Password" do

  	 register.add_confirmation(confirm)

  	end
  	
  end	

  context "Click on button Sign up" do

  	it "Error" do

  		register.click_on_signup
      expect{@browser.div(:class=> "error-msg").exists?}

    end

  end

  context "Close browser" do

    it "Browser closed" do
      
      login.browser_close

    end
  
  end

end
