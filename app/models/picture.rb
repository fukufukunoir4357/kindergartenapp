class Picture < ApplicationRecord
  belongs_to :article
  
  has_attached_file :image,
                    :storage => :s3,
                    :s3_permissions => :public,
                    :s3_credentials => "#{Rails.root}/config/strage.yml",
                    :path => ":attachment/:id/:style.:extension"
                    
  do_not_validate_attachment_file_type :image                  
end
