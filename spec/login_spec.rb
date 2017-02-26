require 'spec_helper'

RSpec.describe "Test Login with correct username and password" do

	let(:email) {"adneela@hotmail.com"}
	let(:password) {"adnela"}
	let(:name) {"Adnela Cavcic"}
	let(:login) {Login.new(@browser)}

	context "Login page" do
	
        it "Successful login" do
	       login.login_user(email, password, name)
	       @browser.wait_until{@browser.div(:class=>"project-space").exists?}
		   expect(@browser.text).to include(name)
			
		
		end

   end

    context "Click on circle on top right" do
 
    	it "Dropdown menu" do

           login.click_on_image
   		   expect(@browser.button(:class, ""))

    	end
   end


   context "Click on Logout item from dropdown menu" do

	   it "User is logged out" do

		  login.logout
		  expect(@browser.div(:class=>"header"))

	   end

	   it "Browser close" do

		   login.browser_close

	   end


   end

end