class Role < ActiveRecord::Base
  has_many :profiles, through: :enrollments
  has_many :enrollments
end
