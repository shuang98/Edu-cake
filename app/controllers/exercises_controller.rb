class ExercisesController < ApplicationController
	def create
		@exercise = Exercise.new
		@exercise.question = params[:question]
		@exercise.answer = params[:answer]
		@exercise.section = Section.find(params[:section_id])
		@exercise.save

		respond_to do |format|
			format.html {}
			format.js {}
		end
	end

	def destroy
		@exercise = Exercise.find(params[:id])
		@exercise.destroy

		respond_to do |format|
			format.html {}
			format.js {}
		end
	end

end
