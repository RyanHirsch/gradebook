class Section < ActiveRecord::Base
  belongs_to :course
  belongs_to :term
  belongs_to :period
end
