class Picture < ApplicationRecord
  belongs_to :article
  
  has_attached_file :image,
                    :storage => :s3,
                    :s3_permissions => :public,
                    :s3_credentials => "#{Rails.root}/config/s3.yml",
                    :path => ":attachment/:id/:style.:extension",
                    :styles => {
                      :original => '1980*1680>',
                      :square => '100*100#',
                      :medium => '300*240>'
                    }
                    
  do_not_validate_attachment_file_type :image                  
end
