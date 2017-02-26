class Dashboard

	@@funding=0
	broj_existing=0
	broj_resp=0
	broj_people=0

	




def initialize browser_init
	@browser=browser_init
end

def dodaj_funding 
	funding=funding+1 

end

    def povecaj_funding

    	broj=@browser.div(:text=>"Funding Project").div(:class=>"number").text.to_i
    	@browser.div(:text=>"Funding Project").div(:class=>"number").set(broj)


	end




	
	


end
