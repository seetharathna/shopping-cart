class Guide < ActiveRecord::Base
has_attached_file :pdf
has_many :purchase_details
end
