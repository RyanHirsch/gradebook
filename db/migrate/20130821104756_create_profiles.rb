class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :alias
      t.string :lastname
      t.string :firstname
      t.date :birthday
      t.string :streetaddress
      t.string :state
      t.string :zipcode
      t.string :city
      t.string :gender
      t.string :email

      t.timestamps
    end
  end
end
