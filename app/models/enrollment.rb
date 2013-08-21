class Enrollment < ActiveRecord::Base
  belongs_to :role
  belongs_to :section
  belongs_to :profile
end
