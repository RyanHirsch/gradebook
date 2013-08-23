class Profile < ActiveRecord::Base
  belongs_to :user
  has_many :enrollments
  has_many :sections, through: :enrollments

  def lastfirst
    [lastname, firstname].join(", ")
  end

  def firstlast
    [firstname, lastname].join(" ")
  end

  def age
    now = Time.now.utc.to_date
    now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
  end
end
