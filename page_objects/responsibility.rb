class Responsibility

 def initialize (browser_init)

	 @browser=browser_init
	
 end

 def click_on_responsibilities

	 @browser.link(:text =>"RESPONSIBILITIES").when_present(timeout=300).click
 end

 def click_on_create_new_responsibility

	 @browser.link(:text =>"Create New Responsibility").when_present.click

 end

 def add_name (name)

	 @browser.text_field(:placeholder=>"Responsibility name").set(name)

 end

 def add_description (description) 

	 @browser.textarea(:class=>"ember-view ember-text-area").set(description)

 end

 def click_on_save

	 @browser.button(:text=>"Save").click

 end

 def search (responsibility)

	 @browser.text_field(:placeholder=>"Filter by search...").set(responsibility)
 
 end

 def click_on_responsibility 

 	 @browser.div(:class=>"card role").click

 end

 def click_on_edit_responsibility

 	 @browser.link(:class=>"btn btn-gray pull-right heading-button edit-responsibility-button ember-view").click

 end

 def click_on_delete

 	 @browser.button(:class=>"btn btn-delete pull-right").click

 end
 
 def click_on_OK
		
	 @browser.alert.ok

	end


end
