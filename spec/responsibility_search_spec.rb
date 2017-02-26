require 'spec_helper'

RSpec.describe "Test Search when Responsibility exist" do

	let(:email) {"adneela@hotmail.com"}
	let(:password) {"adnela"}
	let(:responsibility_name) {"Responsibility 1"}
	let(:name) {"Adnela Cavcic"}
	let (:description) {"Descriptiooon"}
	let(:login) { Login.new(@browser)}
	let(:responsibility) {Responsibility.new(@browser)}

	context "Login page" do
	
        it "Successful login" do

	       login.login_user(email, password, name)
	       @browser.wait_until{@browser.div(:class=>"project-space").exists?}
		     expect(@browser.text).to include(name)
			
		end

  end

  context "Resonsibilities tab" do

	   it "Switch to Responsibility Page" do

          responsibility.click_on_responsibilities
          @browser.wait_until{@browser.div(:class=>"search pull-right").exist?}
		      expect(@browser.text).to include("Responsibilities")
	  end

  end

  
  context "Click on Create New Responsibility" do

   	   it "Textboxes to add information about Responsibility" do

   		     responsibility.click_on_create_new_responsibility
   		     expect(@browser.text).to include("Create Responsibility")

   	   end
  end

  context "Add information" do

   	  it "Name added" do
   		 
   		   responsibility.add_name(responsibility_name)
   	  
      end

   	   it"Description" do

   		   responsibility.add_description(description)
   	   
       end
   
  end

  context "Click on save" do

   	   it "List of responsibilities" do
   		
   		   responsibility.click_on_save
         @browser.wait_until{@browser.div(:class=>"search pull-right").exist?}
   		   expect(@browser.text).to include("Responsibilities")
   	   
       end
   
  end

  context "Filter by search" do

   	   it "Searched responsibility stays in list" do
   		
   		  responsibility.search(responsibility_name)
   		  expect(@browser.text).to include(responsibility_name)
      
      end
   
  end



  context "Click on Responsibility" do

	    it "Responsibility details" do
		
         responsibility.click_on_responsibility
		     expect(@browser.text).to include("About Responsibility")

    	end

  end

  context "Click on Edit Responsibility" do

	    it "General info" do
		
         responsibility.click_on_edit_responsibility
		     expect(@browser.text).to include("Edit Responsibility")

       end
  end

  context "Click on delete" do

	     it "Popup message" do
		
          responsibility.click_on_delete

      end
	end


	context "Click on OK" do
		
      it "Responsibility is deleted" do
			
         responsibility.click_on_OK
		
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
