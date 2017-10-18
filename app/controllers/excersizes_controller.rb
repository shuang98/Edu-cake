class ExcersizesController < ApplicationController
	def create
		@excersize = Excersize.new
		@excersize.question = params[:question]
		@excersize.answer = params[:answer]
		@excersize.section = Section.find(params[:section_id])
		@excersize.save

		respond_to do |format|
			format.html {}
			format.js {}
		end
	end

	def destroy
		@excersize = Excersize.find(params[:id])
		@excersize.destroy

		respond_to do |format|
			format.html {}
			format.js {}
		end
	end

end
