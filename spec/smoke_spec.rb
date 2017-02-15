require 'spec_helper'




RSpec.describe "Smoke test" do


	let(:email) {"adneela@hotmail.com"}
	let(:password) {"adnela"}
	let(:project) {"Automatizacija Izbrisi mee"}
	let(:why) {"whhhy"}
	let(:what) {"whaaaat"}
	let(:how) {"hooow"}
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


   context "Click on Funding Project" do

	   it "Page with textboxes to add information about project" do

         projekat.clickon_funding_project
		 @browser.wait_until{@browser.url == "http://ah-test.abhapp.com/projects/new/funding"}
		 expect(@browser.text).to include("Create Funding Project")

	   end
   end


 
   context "Add information about project" do


	    it "Name added" do

		   projekat.add_name(project)

	   end

        it "Information added" do

	      projekat.add_information(why, what, how)
	     
	   end

	   it "Switch to page Invite sponsors" do 

		  projekat.clickon_next
		  @browser.wait_until{@browser.div(:class=>"search-control sponsors").exists?}
		  expect(@browser.text).to include("Invite sponsor to backup your project initiative")
			
	   end


   end


   context "Invite sponsors" do

	   it "Email of sponsor in list" do 


          @browser.wait_until {@browser.text_field(:class, "autocomplete-input ember-view ember-text-field").exists? }
		  projekat.add_sponsors(sponsor)
		  expect(@browser.text.include?(sponsor)).to be true
	   
	   end

	   it "Switch to Responsibilities tab" do
  
		  projekat.clickon_next
		  @browser.wait_until{@browser.div(:class=>"responsibility-label").exists?}
		  expect(@browser.text).to include("List the responsibilities that are to be covered by project participants / contributors")
		
	   end
   
   end


   context "Click on button Create new" do 

		it "Form with textboxes to add information about responsibility" do 

            @browser.wait_until{@browser.button(:class, "btn btn-gray btn-vacant-responsibility pull-left").exists?}
			projekat.clickon_create_new
			expect(@browser.text).to include("Create New Responsibility")
		end

   end

   context "Add information about Responsibility" do 

		it "Name added" do

			projekat.resp_name(responsibility)
			
		end

		it "Description added" do

			projekat.resp_description(description)

		end
   end

   context "Click on button Save" do

		it "New responsibility in list" do

			projekat.clickon_save
			expect(@browser.div(:class=>"idea-responsibility-container").exists?)
	
		end

   end

  context "Click on Next" do

	   it "Switch to Attachments page" do

	      @browser.wait_until{@browser.button(:class, 'btn btn-green pull-right').exists? }
		  projekat.clickon_next
		  @browser.wait_until{(@browser.button(:class=>"btn btn-default select-file")).exists?}
		  expect(@browser.text).to include("Upload photos, documents, media and other files" )
			
	    end

   end

   
   context "Click on Go to Project" do

		it "Switch to Project page" do

			projekat.clickon_go_to_project
			@browser.wait_until{@browser.span(:class=> "title project pull-left").exists?}
            expect(@browser.span(:text=>project))

		end

   end

   
   context "Click on Edit Project" do 

     	it"Menu for edit" do

   		  projekat.clickon_edit_project 
   	      expect(@browser.button(:class=>"btn btn-delete pull-right"))

   	   end

   end

   
   context "Click on Icon for delete" do

    	it "Pop up menu" do
    		projekat.clickon_delete

   		   
   		  
   	    end

   end

   
   context "Click on OK" do

   	   it "Project is deleted" do

   		  
   		  projekat.clickon_OK
   		  @browser.wait_until{@browser.url == "http://ah-test.abhapp.com/projects"}
   		  expect(@browser.text).to include("All projects")

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



