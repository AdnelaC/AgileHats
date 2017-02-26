class People



  def initialize (browser_init)

		 @browser=browser_init
  
  end

  def click_on_people

		@browser.link(:text =>"PEOPLE").when_present(timeout=300).click
  end

  def search (email)

	  @browser.text_field(:placeholder=>"Search people...").set(email)
  end

  def click_on_invite_people

  	  @browser.button(:text=>"Invite people").click
  end

  def enter_email(email)
      
     # rng= Random.new
      #email="neki_"+rng.rand(100).to_s+"@hotmail.com"
      @browser.text_field(:type=>"email").set(email)

  end

  def click_on_ADD

  	@browser.button(:text=>"ADD").click

  end

  def click_on_invite_num_people

  	@browser.button(:class=>"btn btn-primary btn-invite pull-left").click

  end

  def click_on_tab_invited_users
    @browser.div(:class=>"right").div(:class=>"row").div(:class=>"menu-item menu-item-inactive").click
  end

end