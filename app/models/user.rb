class User < ActiveRecord::Base
  acts_as_authentic

has_and_belongs_to_many :roles


def has_role?(role)
    list ||= self.roles.collect(&:name)
    list.include?(role.to_s) || list.include?('admin')
end

def User.send_mail
 user = User.find(2)
 UserMailer.deliver_message(user)
end



#Validations
#--------------------------------------------------------
 #validates_presence_of :first_name,:last_name
#--------------------------------------------------------


end
