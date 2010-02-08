class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name
      t.string :username
      t.string :email
      t.text   :address
      t.string :password
      t.string :crypted_password
      t.string :password_salt
      t.string :persistence_token
      t.timestamps
    end
    
    create_table :roles do |t|
      t.column :name, :string
    end
    
    # generate the join table
    create_table :roles_users, :id => false do |t|
      t.column :role_id, :integer
      t.column :user_id, :integer
    end
    
    # Create admin role and user
    admin_role = Role.create(:name => 'admin')
    
    user = User.create do |u|
      u.username = 'admin'
      u.password = u.password_confirmation = 'admin64'
      u.email = 'nospam@example.com'
    end
    
    #user.register!
    #user.activate!
    user.roles << admin_role

  end

 
  def self.down
    drop_table :users
    drop_table :roles
    drop_table :roles_users
  end
end



