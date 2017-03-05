require 'spec_helper'




RSpec.describe "Upload photo to project" do


	let(:email) {"adneela@hotmail.com"}
	let(:password) {"adnela"}
	let(:project_name) {"Funding Project 1"}
	let(:why) {"whhhy"}
	let(:what) {"whaaaat"}
	let(:how) {"hooow"}
	let(:sponsor) {"neki@email.com"}
	let(:responsibility) {"New respoo"}
	let (:description) {"Descriptiooon"}
	let (:name) {"Adnela Cavcic"}
	let(:login) { Login.new(@browser)}
	let(:project) {Project.new(@browser)}
	let(:dashboard) {Dashboard.new(@browser)}
	let(:broj) {0}

	 
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


   context "Click on Funding Project" do

	   it "Page with textboxes to add information about project" do

         project.click_on_funding_project
		 @browser.wait_until{@browser.div(:class=>"col-lg-12 right").exists?}
		 expect(@browser.text).to include("Create Funding Project")

	   end
   end


 
   context "Add information about project" do


	    it "Name added" do

		   project.add_name(project_name)

	   end

        it "Information added" do

	      project.add_information(why, what, how)
	     
	   end

	   it "Switch to page Invite sponsors" do 

		  project.click_on_next
		  @browser.wait_until{@browser.div(:class=>"search-control sponsors").exists?}
		  expect(@browser.text).to include("Invite sponsor to backup your project initiative")
			
	   end


   end


   context "Invite sponsors" do

	   it "Email of sponsor in list" do 


          @browser.wait_until {@browser.text_field(:class, "autocomplete-input ember-view ember-text-field").exists? }
		  project.add_sponsors(sponsor)
		  expect(@browser.text.include?(sponsor)).to be true
	   
	   end

	   it "Switch to Responsibilities tab" do
  
		  project.click_on_next
		  @browser.wait_until{@browser.div(:class=>"responsibility-label").exists?}
		  expect(@browser.text).to include("List the responsibilities that are to be covered by project participants / contributors")
		
	   end
   
   end


   context "Click on button Create new" do 

		it "Form with textboxes to add information about responsibility" do 

            @browser.wait_until{@browser.button(:class, "btn btn-gray btn-vacant-responsibility pull-left").exists?}
			project.click_on_create_new
			expect(@browser.text).to include("Create New Responsibility")
		end

   end

   context "Add information about Responsibility" do 

		it "Name added" do

			project.resp_name(responsibility)
			
		end

		it "Description added" do

			project.resp_description(description)

		end
   end

   context "Click on button Save" do

		it "New responsibility in list" do

			project.click_on_save
			expect(@browser.div(:class=>"idea-responsibility-container").exists?)
	
		end

   end

  context "Click on Next" do

	   it "Switch to Attachments page" do


	      project.click_on_next
		  @browser.wait_until{(@browser.button(:class=>"btn btn-default select-file")).exists?}
		  expect(@browser.text).to include("Upload photos, documents, media and other files" )
			
	    end

   end

   context "Upload photo" do

   	it "Photo on page" do

   		project.upload_photo
   		expect(@browser.img(:alt=>"logo.jpg").exists?)


   	end
   end

   
   context "Click on Go to Project" do

		it "Switch to Project page" do

			project.click_on_go_to_project
			@browser.wait_until{@browser.span(:class=> "title project pull-left").exists?}
            expect(@browser.span(:text=>project_name))
            

		end

   end

   
   context "Click on Edit Project" do 

     	it"Menu for edit" do

   		  project.click_on_edit_project 
   	      expect(@browser.button(:class=>"btn btn-delete pull-right"))

   	   end

   end

   
   context "Click on Icon for delete" do

    	it "Pop up menu" do

    		project.click_on_delete
   		  
   	    end

   end

   
   context "Click on OK" do

   	   it "Project is deleted" do

   		  
   		  project.click_on_OK
   		  @browser.wait_until{@browser.div(:class=>"container projects").exists?}
   		  expect(@browser.text).to include("All projects")

   	  end

   end

   context "Check number of funding projects" do

   	  it "Switch to Dashboard Page" do

   	  	project.click_on_dashboard
   	  	broj2=@browser.link(:href=>"/projects/funding").div(:class=>"number").text.to_i
   	  	expect(broj).to eql(broj)
  


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



