class AddGenderToProfiles < ActiveRecord::Migration
  def change
    add_reference :profiles, :gender, index: true
  end
end
