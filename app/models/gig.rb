class Gig < ActiveRecord::Base
	has_many :proposals
	belongs_to :category
	belongs_to :user
	has_many :abilities
	has_many :skills, through: :abilities

	def self.search(params)
		gigs = Gig.where("name like ? or description like?", "%#{params[:search]}%", "%#{params[:search]}%") if params[:search].present?
		gigs
	end
end