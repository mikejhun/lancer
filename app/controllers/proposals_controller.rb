class ProposalsController < ApplicationController
	def create
		@gig = Gig.find(params[:gig_id])
		@proposal = @gig.proposals.build(proposal_params)
		@proposal.save
		redirect_to @proposal.gig
	end

	private
		def proposal_params
			params.require(:proposal).permit(:bid, :description)
		end
end