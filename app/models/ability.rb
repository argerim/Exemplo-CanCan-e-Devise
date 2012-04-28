class Ability
  include CanCan::Ability

  def initialize(user)
  	#user ||= User.new # guest user (not logged in)
    can :manage, :all if user.role.name == 'admin'
	user.role.permissions.each do |permission|
		can permission.action.to_sym, permission.subject_class.constantize do
	    	user.id.nil? || user.role_id?
	    end
    end
  end
end
