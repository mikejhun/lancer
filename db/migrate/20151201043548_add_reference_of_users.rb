class AddReferenceOfUsers < ActiveRecord::Migration
  def change
  	add_reference :gigs, :user, index: true
  	add_reference :proposals, :user, index: true
  end
end
