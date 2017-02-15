 $LOAD_PATH.unshift(File.join(File.dirname(__FILE__),'..','page_objects'))

 require 'rubygems'
 require 'watir-webdriver'
 require 'require_all'


 require_all 'page_objects'
 


RSpec.configure do |config|
	

 	config.expect_with :rspec do |c|
  		c.syntax = [:should, :expect]
  		

  		config.before(:all){
		
  			@browser=Watir::Browser.new :firefox
  			@browser.goto "http://ah-test.abhapp.com/login"
  			
  			

  		
  		}
  	


end
end

	



