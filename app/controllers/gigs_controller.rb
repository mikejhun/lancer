class GigsController < ApplicationController

	def index
		@julie = Gig.all.order("created_at DESC").page(params[:page]).per(25)
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
		@proposals = @gig.proposals.order(created_at: :desc)
		@awarded_proposal = Proposal.where(id: @gig.awarded_proposal).first
	end

	def edit
		@gig = Gig.find(params[:id])
	end
	
	def update
		@gig = Gig.find(params[:id])
		@gig.update(gig_params)
		redirect_to @gig
	end

	def destroy
		@gig = Gig.find(params[:id])
		@gig.destroy
		redirect_to :mygigs
	end

	def search
		@julie = Gig.search(params).order("created_at DESC").page(params[:page]).per(25)
	end

	def mygigs
		@gigs = Gig.where(user_id: current_user).order(created_at: :asc)
	end
	
	private
		def gig_params
			params.require(:gig).permit(:name, :description, :budget, :location, :open, :category_id, :skill_list, :awarded_proposal)
		end

	end