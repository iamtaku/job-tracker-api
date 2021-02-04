class Job < ApplicationRecord
  has_many :steps
  belongs_to :user
  validates_presence_of :company
  validates_presence_of :position
end
