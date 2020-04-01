class Check < ApplicationRecord
  belongs_to :user
  belongs_to :private_topic
end
