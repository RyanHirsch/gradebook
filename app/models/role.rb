class Role < ActiveRecord::Base
  has_many :profiles, through: :enrollments
end
