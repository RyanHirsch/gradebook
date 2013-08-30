class Profile < ActiveRecord::Base
  belongs_to :user
  belongs_to :gender
  has_many :enrollments
  has_many :sections, through: :enrollments
  has_many :roles, through: :enrollments

  def last_first
    [last_name, first_name].join(", ")
  end

  def first_last
    [first_name, last_name].join(" ")
  end

  def age
    now = Time.now.utc.to_date
    now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
  end

  def active_sections
    sections.joins(:term).where("start_date <= ? AND end_date >= ?", Date.today, Date.today).includes(:course)
  end

  def previous_sections
    sections.joins(:term).where("end_date < ?", Date.today)
  end

  def future_sections
    sections.joins(:term).where("start_date > ?", Date.today)
  end
end
