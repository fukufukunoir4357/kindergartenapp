class Article < ApplicationRecord
  has_many :pictures, :dependent => :destroy
end
