class Grade < ActiveRecord::Base
  validates :value, presence: true, numericality: { greater_than: 0 }

  belongs_to :assignment
  belongs_to :enrollment
  has_one :profile, through: :enrollment

  def percentage
    (value.to_f/assignment.total.to_f) * 100
  end
end
