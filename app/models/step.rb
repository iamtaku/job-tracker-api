class Step < ApplicationRecord
  belongs_to :job
  validates_presence_of :date
end
