class EntryTopic < ApplicationRecord
  validates :term, presence: true
  validates :reception_day, presence: true
  validates :information, presence: true
end
