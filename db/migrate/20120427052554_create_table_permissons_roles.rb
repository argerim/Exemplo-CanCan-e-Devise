class CreateTablePermissonsRoles < ActiveRecord::Migration
  def up
  	 create_table :permissions_roles, :id => false do |t|
    	  t.integer :permission_id
      	  t.integer :role_id
      end
  end

  def down
  end
end
