class GenerateListsController < ApplicationController

	def create
		hostel1=params[generatelist][rollno]
		hostel2=params[generatelist][password]

		render "<body>hostel1 hostel2</body>"
	end
end
