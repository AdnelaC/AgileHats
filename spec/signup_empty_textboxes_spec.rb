require 'spec_helper'


RSpec.describe "Sign up with empty textboxes" do

let(:login) {Login.new(@browser)}
let(:register) {Register.new(@browser)}

  context "Click on Sign up" do

  	it "Sign up Page" do
  			
      login.click_on_signup
  		expect(@browser.text).to include("SIGN UP")
  		
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
