class PrivateTopic < ApplicationRecord
  default_scope -> { order(created_at: :desc)}
  has_many :checks
  has_many :users, through: :checks, source: :user
end
