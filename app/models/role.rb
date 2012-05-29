class Role < ActiveRecord::Base
	has_many :users, :dependent => :restrict
	has_and_belongs_to_many :permissions

	validates_presence_of :name#, :permissions
	validates_uniqueness_of :name
end
