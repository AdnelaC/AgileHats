require 'spec_helper'

RSpec.describe "Test click on Forgot password" do

	let(:email) {"adneela@hotmail.com"}
	let(:name) {"Adnela Cavcic"}
	let(:login) {Login.new(@browser)}


	context "Click on Forgot Password" do
	
    it "Textbox to add email" do
	       
	    login.click_on_forgot_password
	    expect(@browser.div(:class=>"forgot-pass-message").exist?)

    end

  end

  context "Enter email" do

    it "Email in textbox" do

   		login.enter_forgot_email(email)

   	end
   
  end

  context "Click on send" do

   	it "Message: You will recive email.." do

   		login.click_on_send
   		expect(@browser.div(:class=>"warning-modal").exist?)
   	  
   	end

  end

  context "Click on: Ok, great " do

    it "Login page" do

    	login.click_on_ok
    	expect(@browser.div(:class=>"login-container").exist?)

    end
   
  end


  context "Close browser" do

	 it "Browser close" do

	   	login.browser_close

	 end

 end

end