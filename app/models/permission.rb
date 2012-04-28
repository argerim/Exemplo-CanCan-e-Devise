class Permission < ActiveRecord::Base
	has_and_belongs_to_many :roles

	validates_uniqueness_of :action, :scope => :subject_class
	validates_presence_of :action, :subject_class
end
