class Contact < ApplicationRecord
  
  validates :content, presence: true
  
end
