class Profile


 def initialize (browser_init)

	 @browser=browser_init
 
 end

 def click_on_button_ADD

 	@browser.button(:class=>"btn btn-edit-info").click
 
 end

 def add_phone (phone)

 	@browser.input(:id=>"phone").set(phone)

 end

 def add_skype (skype) 

 	@browser.input(:id=>"skype").set(skype)

 end

 def click_on_button_done

 	@browser.div(:class=>"title profile-title").button(:class=>"btn btn-blue btn-edit-done").click
 
 end
end