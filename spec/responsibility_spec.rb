require 'spec_helper'

RSpec.describe "Test Create Responsibility with filled textboxes" do

    let(:email) {"adneela@hotmail.com"}
	let(:password) {"adnela"}
	let(:name) {"New respoo"}
	let(:ime) {"Adnela Cavcic"}
	let (:description) {"Descriptiooon"}
	let(:login) { Login.new(@browser)}
	let(:responsibility) {Responsibility.new(@browser)}

  context "Login page" do
	
        it "Successful login" do
	          login.login_user(email, password, ime)
	          @browser.wait_until{@browser.url=="http://ah-test.abhapp.com/profile"}
		        expect(@browser.text).to include(ime)
			  
        end

   end


   context "Resonsibilities tab" do

	   it "Switch to Responsibility Page" do

          responsibility.clickon_responsibilities
          @browser.wait_until{@browser.url == "http://ah-test.abhapp.com/responsibilities"}
		      expect(@browser.text).to include("Responsibilities")
	   end

   end


   context "Click on Create New Responsibility" do

   	   it"Textboxes to add information about Responsibility" do

   		     responsibility.clickon_create_new_responsibility
   		     expect(@browser.text).to include("Create Responsibility")

   	   end
   end

   context "Add information" do

   	  it "Name added" do
   		 
   		   responsibility.add_name(name)
   	  
      end

   	   it"Description" do

   		   responsibility.add_description(description)
   	   
       end
   
   end

   context "Click on save" do

   	   it "List of responsibilities" do
   		
   		   responsibility.clickon_save
         @browser.wait_until{@browser.url == "http://ah-test.abhapp.com/responsibilities"}
   		   expect(@browser.text).to include("Responsibilities")
   	   end
   
   end

   context "Click on circle on top right" do
 
    	it "Dropdown menu" do

           login.clickon_image
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