class Login

 def initialize browser_init

	@browser=browser_init
 end

 def login_user (email,password,ime)

	        @browser.text_field(:id,"ember592").set(email)
		    @browser.text_field(:id ,"ember593").set(password)
			@browser.button(:type ,"submit" ).click
		
 end

 def click_on_image

		 @browser.image(:class=> "img-circle").click

 end

 def logout

		@browser.button(:class, "").click

 end

	
 def browser_close

		   @browser.close

 end


 def click_on_signup
	
	@browser.b(:text=>"Sign up").click 
	
 end

end
