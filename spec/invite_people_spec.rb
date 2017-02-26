require 'spec_helper'

RSpec.describe "Test Invite people with valid name" do

	let(:email) {"adneela@hotmail.com"}
	let(:password) {"adnela"}
	let (:name) {"Adnela Cavcic"}
	let(:invite) {"fakultetski mail"}
	let(:login) { Login.new(@browser)}
	let(:people) {People.new(@browser)}
   let(:rng) {Random.new}
   let(:email_invite){"neki_"+rng.rand(100).to_s+"@hotmail.com"}

	context "Login page" do
	
        it "Successful login" do
	       
           login.login_user(email, password, name)
	        @browser.wait_until{@browser.url=="http://ah-test.abhapp.com/profile"}
		     expect(@browser.text).to include(name)
			
         end

   end

   context "People tab" do

   	  it "Switch to People tab" do

   		  people.click_on_people
   		  @browser.wait_until{@browser.div(:class=>"content").exist?}
   		  expect(@browser.text).to include("People")
   	  end

   end


   context "Click on button Invite people" do

   	it "New window with textbox to enter email" do

   		@browser.wait_until{@browser.button(:class=>"btn btn-green pull-right heading-button").exist?}
         people.click_on_invite_people

   	end
   end


   context "Enter email" do

   	it "Email in textbox" do

   		people.enter_email(email_invite)
   	
      end
   
   end

   
   context "Click on button ADD" do
   
   	it "Email under textbox" do
   		
         people.click_on_ADD
   	
      end

   end

   
   context "Clik on button Invite 1 pople" do
   	
      it "Invited email in list invite users" do
   	
      	people.click_on_invite_num_people
   	
      end
   
   end

   
   context "Go to tab Invited users" do

   	it "Check is invited user in list" do
   
   		people.click_on_tab_invited_users
         #@browser.wait_until{@browser.div(:class=>"invitation-container").exist?}
         #expect(@browser.div(:class=>"invitation-container").text).to include(email_invite)

   	end
   end

   
   context "Click on circle on top right" do
 
      it "Dropdown menu" do

           login.click_on_image
            expect(@browser.button(:class, ""))

      end


   end


   context "Click on Logout item from dropdown menu" do

      it"User is logged out" do

        login.logout
        expect(@browser.div(:class=>"header"))

      end

      it "Browser close" do

         login.browser_close

      end


   end


end