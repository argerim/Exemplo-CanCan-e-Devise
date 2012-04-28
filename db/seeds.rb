# encoding: utf-8
def get_model_names_sub
  	Dir['app/models/*.rb'].map {|f| File.basename(f, '.*').camelize.constantize.name }.reject!{|m| m.constantize.superclass != ActiveRecord::Base }
end

puts "# --- Populando o Banco de Dados --- #"

puts "--- Inserindo Permissões ---"
get_model_names_sub.each do |models_names|
	%w{index create update new show edit destroy search}.each do |action|
		puts "Criando permissão para acessar #{action} em #{models_names}"
		Permission.find_or_create_by_action_and_subject_class(action, models_names)
	end
end

puts "--- Inserindo Usuário Com Role e Permissão ---"
user_permissions = Permission.where(:subject_class => 'User')
puts '--- Inserindo Role ---'
role = Role.find_or_create_by_name('user')
role.permissions.destroy_all
role.permissions << user_permissions
role.save
role_admin = Role.find_or_create_by_name('admin')
puts '--- Inserindo Usuários ---'
User.destroy_all
User.create(:email => 'user@user.com.br', :password => '123456', :role_id => role.id)

User.create(:email => 'admin@admin.com.br', :password => '123456', :role_id => role_admin.id)
puts "# --- Fim --- #"