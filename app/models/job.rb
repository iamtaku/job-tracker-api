class Job < ApplicationRecord
  has_many :steps
  validates_presence_of :company
  validates_presence_of :position
end
