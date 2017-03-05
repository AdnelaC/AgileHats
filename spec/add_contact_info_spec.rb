require 'spec_helper'

RSpec.describe "Add contact info" do

	let(:email) {"novipokusaj@hotmail.com"}
	let(:password) {"password"}
	let(:name) {"Novi Novi"}
	let(:login) {Login.new(@browser)}
	let(:profile) {profile.new(@browser)}
	let(:tel) {"033111222"}
	let(:skype) {"skype_name"}

	context "Login page" do
	
        it "Successful login" do
	       login.login_user(email, password, name)
	       @browser.wait_until{@browser.div(:class=>"project-space").exists?}
		   expect(@browser.text).to include(name)
			
		
		end

   end

   context "Click on button ADD" do

    	it "Textboxes to add information" do

   		  profile.click_on_button_ADD
   		  expect(@browser.input(:id=>"phone").exists?)

   		end


   end

   context "Add phone number" do

    	it "Phone number in textbox" do

   		   profile.add_phone(tel)

   		end

   end

   context "Add skype name" do

   	   it "Skype name in textbox" do

   		   profile.add_skype(skype)

   		end
   end

   context "Click on button Done" do

    	it "Contac info on Profile" do

   		   profile.click_on_button_done
   		   expect(@browser.label(:class=>"info").exists?)

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