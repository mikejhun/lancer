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

	def skill_list=(skills_string)
		skill_names = skills_string.split(",").collect{ |s| s.strip.downcase }.uniq
		new_or_found_skills = skill_names.collect { |name| Skill.find_or_create_by(name: name) }
		self.skills = new_or_found_skills
	end

	def skill_list
		self.skills.collect do |skill|
			skill.name
		end.join(", ")
	end

	def self.order_list(sort_order)
		if sort_order == "newest" || sort_order.blank?
			order(created_at: :desc)
		elsif sort_order == "name"
			order(name: :asc)
		else
			order(created_at: :asc)
		end
	end
end