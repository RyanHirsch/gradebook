class Assignment < ActiveRecord::Base
  validates :name, presence: true
  validates :total, presence: true, numericality: { greater_than: 0 }
  validates :section, presence: true
  validates :assignment_type, presence: true

  belongs_to :section
  belongs_to :assignment_type
  has_many :grades

  def average_percentage
    average_score/total.to_f
  end

  def average_score
    running_total = 0.0
    grades.each do |g|
      running_total = running_total + g.value
    end

    running_total/grades.count
  end
end
