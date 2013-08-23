class Grade < ActiveRecord::Base
  belongs_to :assignment
  belongs_to :enrollment
  has_one :profile, through: :enrollment
end
