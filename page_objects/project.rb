class Project


	def initialize (browser_init)

		@browser=browser_init

	end


	def click_on_project

		@browser.link(:text =>"PROJECTS").when_present(timeout=300).click
	end

	def click_on_create_project

		@browser.link(:text =>"Create Project").when_present.click

	end

	def click_on_funding_project

		@browser.div(:text, "Funding Project").fire_event :click

	end

	def click_on_existing_project

		@browser.div(:text, "Existing Project").fire_event :click

	end


	def add_name (name)

		@browser.text_field(:id, "name").set(name)

	end

	def add_description (description)

		@browser.textarea(:id=>"description").set(description)
	end	

	def add_information (why, what, how)

		  @browser.textarea(:id, "description_why").set(why)
	      @browser.textarea(:id, "description_what").set(what)
	      @browser.textarea(:id, "description_how").set(how)

	end

	

	def add_sponsors (sponsor)

		  @browser.text_field(:class=>"autocomplete-input ember-view ember-text-field", :placeholder =>"Search or enter email to add people...").set(sponsor)
		  @browser.wait_until {@browser.button(:class=>"message btn-link").exists?}
		  @browser.button(:class=> "message btn-link").click
	end


	def click_on_create_new

		@browser.button(:class, "btn btn-gray btn-vacant-responsibility pull-left").click

	end

	def resp_name (responsibility)
		
		@browser.text_field(:class, "responsibility-title  error  ember-view ember-text-field").set(responsibility)

	end

	def resp_description (description)

		@browser.textarea(:id, "description").set(description)

	end

	def click_on_save
		
		@browser.button(:text, "Save").click

	end

	def click_on_next
		
		@browser.button(:text, "Next").click

	end

	def click_on_go_to_project
		
		@browser.link(:class,"btn btn-green pull-right ember-view active").when_present.click

	end

	def click_on_go_to_project_existing
		
		@browser.link(:class,"btn btn-green pull-right ember-view").when_present.click

	end

	def click_on_edit_project
		
		@browser.link(:class=>"btn btn-gray btn-edit-project pull-right heading-button ember-view").click

	end

	def click_on_delete
		
		@browser.button(:class=>"btn btn-delete pull-right").click

	end

	def click_on_OK
		
		@browser.alert.ok

	end

	def click_on_dashboard
		
		@browser.link(:text=>"DASHBOARD").click

	end

end