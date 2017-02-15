class Dashboard

	def initialize 
		projekti= list<Project> ()
		responsibilities= list<Responsibility>()
	end

	def add_project(pro)
		projekti.add(pro)
	end

	def add_resp(resp)
		responsibilities.add(resp)
	end
	
	


end
