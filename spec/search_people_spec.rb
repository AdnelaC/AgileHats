require 'spec_helper'

RSpec.describe "Test Search when user exist" do


	let(:email) {"adneela@hotmail.com"}
	let(:password) {"adnela"}
	let (:ime) {"Adnela Cavcic"}
	let(:trazi) {"fakultetski mail"}
	let(:traziemail) {"acavcic1@etf.unsa.ba"}
	let(:login) { Login.new(@browser)}
	let(:people) {People.new(@browser)}


	context "Login page" do
	
        it "Successful login" do
	       login.login_user(email, password, ime)
	       @browser.wait_until{@browser.url=="http://ah-test.abhapp.com/profile"}
		   expect(@browser.text).to include(ime)
			
		
		end

  end


  context "People tab" do

   	  it "Switch to People tab" do

   		  people.clickon_people
   		  @browser.wait_until{@browser.url=="http://ah-test.abhapp.com/users"}
   		  expect(@browser.text).to include("Current Users")
   	  end

  end

  context "Search people" do

   	  it "Searched user in list" do
   		  
   		  people.search(trazi)
   		  expect(@browser.text).to include(traziemail)
   	   end
  end

  context "Click on circle on top right" do
 
    	it "Dropdown menu" do

          login.clickon_image
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