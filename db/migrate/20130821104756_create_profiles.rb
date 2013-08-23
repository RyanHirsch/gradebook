class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :display_name
      t.string :last_name
      t.string :first_name
      t.date :dob
      t.string :streetaddress
      t.string :state
      t.string :zipcode
      t.string :city
      t.string :gender
      t.string :email

      t.references :user, index: true
      t.timestamps
    end
  end
end
