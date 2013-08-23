class Section < ActiveRecord::Base
  belongs_to :course
  belongs_to :term
  # belongs_to :period
  has_many :enrollments
  has_many :profiles, through: :enrollments
end
