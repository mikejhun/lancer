class Skill < ActiveRecord::Base
	has_many :abilities
	has_many :gigs, through: :abilities
end