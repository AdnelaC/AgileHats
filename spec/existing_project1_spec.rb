require 'spec_helper'



RSpec.describe "Create Existing Project with empty textboxes for details" do

    let(:email) {"adneela@hotmail.com"}
	let(:password) {"adnela"}
	let(:project) {"Pro pro pro"}
	let(:description) {"whhhy"}
	let(:sponsor) {"neki@email.com"}
	let(:responsibility) {"New respoo"}
	let (:description) {"Descriptiooon"}
	let (:ime) {"Adnela Cavcic"}
	let(:login) { Login.new(@browser)}
	let(:projekat) {Project.new(@browser)}




	 
    context "Login page" do
	
        it "Successful login" do
	       login.login_user(email, password, ime)
	       @browser.wait_until{@browser.url=="http://ah-test.abhapp.com/profile"}
		   expect(@browser.text).to include(ime)
			
		
		end

   end

   



    context "Projects tab" do

	   it "Switch to Projects Page" do

          projekat.clickon_project 
          @browser.wait_until{@browser.url == "http://ah-test.abhapp.com/projects"}
		  expect(@browser.text).to include("All projects")
	  end

   end
   context "Click on button Create Project button" do

	   it "Page with two options to choose type of Project" do

		  projekat.clickon_create_project
		  @browser.wait_until{@browser.url == "http://ah-test.abhapp.com/projects/new"}
		  expect(@browser.text).to include("Select type of project")
		
	   end
   end


   context "Click on Existing Project" do

   	  it "Page with textboxes to add information about project" do

   		projekat.clickon_existing_project
   		@browser.wait_until{@browser.url == "http://ah-test.abhapp.com/projects/new/active"}
		expect(@browser.text).to include("Create Existing Project")
   	  end
   end


   context "Click on Next" do
   	it "Error" do
   		projekat.clickon_next
   		expect(@browser.div(:class=>"error-msg")). to exist
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