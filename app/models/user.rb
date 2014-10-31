class User < ActiveRecord::Base
	has_secure_password
	has_and_belongs_to_many :groups

	has_attached_file :userpic
 	validates_attachment_content_type :userpic, :content_type => /\Aimage\/.*\Z/

end



