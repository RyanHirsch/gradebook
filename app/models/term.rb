class Term < ActiveRecord::Base
  has_many :sections

  def current?
    now = Time.now.utc.to_date
    (start_date..end_date) === now
  end
end
