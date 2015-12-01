class Gig < ActiveRecord::Base
	has_many :proposals
	belongs_to :category
	belongs_to :user
	has_many :abilities
	has_many :skills, through: :abilities
end