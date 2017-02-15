class Responsibility

def initialize browser_init
	@browser=browser_init
	
end

def clickon_responsibilities

		@browser.link(:text =>"RESPONSIBILITIES").when_present(timeout=300).click
end

def clickon_create_new_responsibility
		@browser.link(:text =>"Create New Responsibility").when_present.click
end

def add_name name
	@browser.text_field(:placeholder=>"Responsibility name").set(name)
end

def add_description description 
	@browser.text_field(:class=>"ember-view ember-text-field").set(description)

end

def clickon_save
	@browser.button(:text=>"Save").click

end

def search responsibility
	@browser.text_field(:placeholder=>"Filter by search...").set(responsibility)
end



end
