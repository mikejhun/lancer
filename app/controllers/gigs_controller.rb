class GigsController < ApplicationController

	def index
	end

	def new
		@gig = Gig.new
	end

	def create
		@gig = Gig.new(gig_params)
		@gig.save
		redirect_to @gig
	end

	def show
		@gig = Gig.find(params[:id])
	end

	private
		def gig_params
			params.require(:gig).permit(:name, :description, :budget, :location, :open)
		end

	end