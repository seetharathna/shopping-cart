class Guide < ActiveRecord::Base
has_attached_file :pdf
has_many :purchase_details

def self.secret_code
 code = self.make_token
 return code 
end  

private
  def self.secure_digest(*args)
    Digest::SHA1.hexdigest(args.flatten.join('--'))
  end

  def self.make_token
    secure_digest(Time.now, (1..10).map{ rand.to_s })
  end

end
