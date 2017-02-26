class Register


    def initialize (browser_init)

    	@browser=browser_init
    end

	def add_firstname (first)

		@browser.text_field(:placeholder=>"First name").set(first)
	end

	def add_lastname (last)

		@browser.text_field(:placeholder=>"Last name").set(last)
	
	end

	def add_email (email)

		@browser.text_field(:placeholder=>"Email").set(email)
	end

	def add_password (password)

		@browser.text_field(:placeholder=>"Password").set(password)
	end

	def add_confirmation (confirmation)

		@browser.text_field(:placeholder=>"Confirm Password").set(confirmation)
  	end

	def click_on_signup
		
		@browser.button(:text=>"Sign up").click
	
	end

	def click_on_createnew
		
		@browser.link(:text=>"Create one").click

	end




end