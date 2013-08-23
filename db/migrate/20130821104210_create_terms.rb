class CreateTerms < ActiveRecord::Migration
  def change
    create_table :terms do |t|
      t.string :name
      t.date :start_date
      t.date :end_date
      t.string :code

      t.timestamps
    end
  end
end
