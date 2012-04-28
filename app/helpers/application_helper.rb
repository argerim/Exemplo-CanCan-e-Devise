module ApplicationHelper
	
  def get_model_names_sub
  	Dir['app/models/*.rb'].map {|f| File.basename(f, '.*').camelize.constantize.name }.reject!{|m| m.constantize.superclass != ActiveRecord::Base }
  end

  def roles
	Role.all
  end
end