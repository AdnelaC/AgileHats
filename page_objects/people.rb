class People



  def initialize browser_init
		@browser=browser_init
  end

  def clickon_people

		@browser.link(:text =>"PEOPLE").when_present(timeout=300).click
  end

  def search email

	  @browser.text_field(:placeholder=>"Search people...").set(email)
  end



end