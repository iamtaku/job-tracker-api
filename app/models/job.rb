class Job < ApplicationRecord
  has_many :jobs
  validates_presence_of :company
  validates_presence_of :position
end
