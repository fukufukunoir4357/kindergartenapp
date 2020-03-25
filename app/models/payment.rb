class Payment < ApplicationRecord
  belongs_to :user
  has_many :buys, dependent: :destroy
  has_many :pictures, through: :buys, source: :picture
  accepts_nested_attributes_for :buys, allow_destroy: true
end
