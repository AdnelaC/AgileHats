class Login

 def initialize (browser_init)

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

 def click_on_forgot_password

		@browser.link(:text=>"Forgot Password?").click

  end

	def enter_forgot_email (email)

		@browser.text_field(:type =>"email").set(email)
	end

	def click_on_send

		@browser.button(:text=>"Send").click

	end

	def click_on_ok

		@browser.div(:class=>"buttons text-center").button(:class=>"btn btn-green").click

	end


end
