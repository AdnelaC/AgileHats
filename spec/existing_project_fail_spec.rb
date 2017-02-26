require 'spec_helper'



RSpec.describe "Create Existing Project with empty textboxes for details" do

  let(:email) {"adneela@hotmail.com"}
	let(:password) {"adnela"}
	let (:name) {"Adnela Cavcic"}
	let(:login) { Login.new(@browser)}
	let(:project) {Project.new(@browser)}

  context "Login page" do
	
        it "Successful login" do
	       
          login.login_user(email, password, name)
	        @browser.wait_until{@browser.div(:class=>"project-space").exists?}
		      expect(@browser.text).to include(name)

        end

  end

  context "Dashboard tab" do

   	  it "Switch to Dashboard Page" do

   	  	  project.click_on_dashboard
   	  	  @browser.wait_until{@browser.div(:class=>"project-card").exists?}
   	  	  @broj=@browser.link(:href=>"/projects/funding").div(:class=>"number").text.to_i

   	  end

  end


  context "Projects tab" do

	   it "Switch to Projects Page" do

          project.click_on_project 
          @browser.wait_until{@browser.div(:class=>"container projects").exist?}
		      expect(@browser.text).to include("All projects")
	  
    end

  end


  context "Click on button Create Project button" do

	   it "Page with two options to choose type of Project" do

		     project.click_on_create_project
		     @browser.wait_until{@browser.div(:class=>"content").exist?}
		     expect(@browser.text).to include("Select type of project")
		
	   end
   
  end


  context "Click on Existing Project" do

   	  it "Page with textboxes to add information about project" do

   		  project.click_on_existing_project
   		  @browser.wait_until{@browser.div(:class=>"container new-project").exist?}
		  expect(@browser.text).to include("Create Existing Project")
   	  end
  
   end


  context "Click on Next" do

    	it "Error" do

   		   project.click_on_next
   		   expect(@browser.div(:class=>"error-msg")). to exist
   	  
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