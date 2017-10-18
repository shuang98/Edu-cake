class SectionsController < ApplicationController
	def create
		@section = Section.new
		@section.title = params[:title]
		@section.course = Course.find(params[:course_id])
		@section.save
		@course = @section.course
		@sections = Section.all
		respond_to do |format|
			format.html {}
			format.js {}
		end
	end

	def update
		@section = Section.find(params[:id])
		@section.update(section_params)
		respond_to do |format|
			format.html {}
			format.js {}
		end
	end
	def buildvideo
		@section = Section.find(params[:section_id])
		@body = Body.new
		@body.is_video = true
		@body.section = @section
		@body.body = YouTubeRails.youtube_embed_url(params[:youtube], 500, 500);
		@body.save
		@course = @section.course
		respond_to do |format|
			format.html {}
			format.js {}
		end
	end
	def buildbody
		@section = Section.find(params[:section_id])
		@body = Body.new
		@body.section = @section
		@body.is_video = false
		@body.save
		@course = @section.course
		render partial: "courses/section_form", locals: {section: @section}
	end
	def destroybody
		@body = Body.find(params[:body_id])
		@section = @body.section
		@body.destroy
		respond_to do |format|
			format.html {}
			format.js {}
		end
	end
	def destroy
		@section = Section.find(params[:id])
		@section.destroy
	end
	private
		def section_params
			params.require(:section).permit(bodies_attributes: [:id, :body])
		end
end
