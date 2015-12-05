class Gig < ActiveRecord::Base
	has_many :proposals
	belongs_to :category
	belongs_to :user
	has_many :abilities
	has_many :skills, through: :abilities

	geocoded_by :location
	after_validation :geocode
	
	def self.search(params)
		if params[:category].present?
			gigs = Gig.where(category_id: params[:category].to_i)
			gigs = gigs.where("name like ? or description like?", "%#{params[:search]}%", "%#{params[:search]}%") if params[:search].present?
			gigs = gigs.near(params[:location], 20) if params[:location].present?
		else
			gigs = Gig.where("name like ? or description like?", "%#{params[:search]}%", "%#{params[:search]}%") if params[:search].present?	
		end	
		gigs
	end
end