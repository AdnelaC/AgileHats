require 'spec_helper'
require 'watir-webdriver'


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
	


	before(:all){
  			@browser = Watir::Browser.new :firefox
  			@browser.goto "http://ah-test.abhapp.com/login" 
  		}

	


		 
    context "Login page" do
	
        it "Successful login" do
			@browser.text_field(:id,"ember592").set(email)
		    @browser.text_field(:id ,"ember593").set(password)
			@browser.button(:type ,"submit" ).click
			@browser.wait_until{@browser.url=="http://ah-test.abhapp.com/profile"}
			expect(@browser.text).to include(ime)
			
		
		end

   end

   



    context "Projects tab" do

	   it "Switch to Projects Page" do

	   	  @browser.link(:text =>"PROJECTS").when_present(timeout=300).click
		  @browser.wait_until{@browser.url == "http://ah-test.abhapp.com/projects"}
		  expect(@browser.text).to include("All projects")
	  end

   end


   context "Click on button Create Project button" do

	   it "Page with two options to choose type of Project" do

		  @browser.link(:text =>"Create Project").when_present.click
		  @browser.wait_until{@browser.url == "http://ah-test.abhapp.com/projects/new"}
		  expect(@browser.text).to include("Select type of project")
		
	   end
   end


   context "Click on Funding Project" do

	   it "Page with textboxes to add information about project" do

		 @browser.div(:text, "Funding Project").fire_event :click
		 @browser.wait_until{@browser.url == "http://ah-test.abhapp.com/projects/new/funding"}
		 expect(@browser.text).to include("Create Funding Project")
	   end
   end


  

   context "Add information about project" do

	    it "Name added" do

		   @browser.text_field(:id, "name").set(project)

	   end

        it "Information added" do

	      @browser.textarea(:id, "description_why").set(why)
	      @browser.textarea(:id, "description_what").set(what)
	      @browser.textarea(:id, "description_how").set(how)
	   
	   end

	   it "Switch to page Invite sponsors" do 

		  @browser.button(:text => "Next").click
		  @browser.wait_until{@browser.div(:class=>"search-control sponsors").exists?}
		  expect(@browser.text).to include("Invite sponsor to backup your project initiative")
			
	   end

   end


   context "Invite sponsors" do

	   it "Email of sponsor in list" do 


          @browser.wait_until {@browser.text_field(:class, "autocomplete-input ember-view ember-text-field").exists? }
		  @browser.text_field(:class=>"autocomplete-input ember-view ember-text-field", :placeholder =>"Search or enter email to add people...").set(sponsor)
		  @browser.wait_until {@browser.button(:class=>"message btn-link").exists?}
		  @browser.button(:class=> "message btn-link").click
		  expect(@browser.text.include?(sponsor)).to be true

	   end

	   it "Switch to Responsibilities tab" do
  
		  @browser.button(:text, "Next").click
		  @browser.wait_until{@browser.div(:class=>"responsibility-label").exists?}
		  expect(@browser.text).to include("List the responsibilities that are to be covered by project participants / contributors")
		
	   end
   end

   context "Click on button Create new" do 

		it "Form with textboxes to add information about responsibility" do 

            @browser.wait_until{@browser.button(:class, "btn btn-gray btn-vacant-responsibility pull-left").exists?}
			@browser.button(:class, "btn btn-gray btn-vacant-responsibility pull-left").click
			expect(@browser.text).to include("Create New Responsibility")
		end

   end

   context "Add information about Responsibility" do 

		it "Name added" do

			@browser.text_field(:class, "responsibility-title  error  ember-view ember-text-field").set(responsibility)
			
		end

		it "Description added" do

			@browser.textarea(:id, "description").set(description)
			
		end
   end

   context "Click on button Save" do

		it "New responsibility in list" do

			@browser.button(:text, "Save").click
			expect(@browser.div(:class=>"idea-responsibility-container").exists?)
	
		end

   end

  context "Click on Next" do

	   it "Switch to Attachments page" do

	      @browser.wait_until{@browser.button(:class, 'btn btn-green pull-right').exists? }
		  @browser.button(:class=>"btn btn-green pull-right", :text => "Next").when_present.click
		  @browser.wait_until{(@browser.button(:class=>"btn btn-default select-file")).exists?}
		  expect(@browser.text).to include("Upload photos, documents, media and other files" )
			
	    end

   end

   


   context "Click on Go to Project" do

		it "Switch to Project page" do

			@browser.link(:class,"btn btn-green pull-right ember-view active").when_present.click
			@browser.wait_until{@browser.span(:class=> "title project pull-left").exists?}
            expect(@browser.span(:text=>project))

		end

   end

   context "Click on Edit Project" do 

     	it"Menu for edit" do

   		  @browser.link(:class=>"btn btn-gray btn-edit-project pull-right heading-button ember-view").click 
   	      expect(@browser.button(:class=>"btn btn-delete pull-right"))

   	   end

   end

   context "Click on Icon for delete" do

    	it "Pop up menu" do

   		   @browser.button(:class=>"btn btn-delete pull-right").click
   		  
   	    end

   end

   context "Click on OK" do

   	   it "Project is deleted" do

   		  @browser.alert.ok
   		  @browser.wait_until{@browser.url == "http://ah-test.abhapp.com/projects"}
   		  expect(@browser.text).to include("All projects")

   	  end

   end

  
  	
   context "Click on circle on top right" do
 
    	it "Dropdown menu" do

   		   @browser.image(:class=> "img-circle").click
   		   expect(@browser.button(:class, ""))

    	end


   end

   context "Click on Logout item from dropdown menu" do

	   it"User is logged out" do

		  @browser.button(:class, "").click
		  expect(@browser.div(:class=>"header"))

	   end

	   it "Browser close" do

		   @browser.close

	   end


   end


end 



