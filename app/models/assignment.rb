class Assignment < ActiveRecord::Base
  belongs_to :section
  belongs_to :assignment_type
  has_many :grades
end
