require 'spec_helper'

RSpec.describe "Test Login with incorrect email and incorrect password" do

	let(:email) {"adneelav@hotmail.com"}
	let(:password) {"password"}
	let(:name) {"Adnela Cavcic"}
	let(:login) {Login.new(@browser)}


	context "Login page" do
	
        it "Error" do
        	
	       login.login_user(email, password, name)
	       @browser.wait_until{@browser.div(:class=> "error-msg").exists?}
		   expect(@browser.div(:class=>"error-msg")).to exist
			
		
		end

   end

   context "Close browser" do

	   it "Browser close" do

		   login.browser_close

	   end


   end

end