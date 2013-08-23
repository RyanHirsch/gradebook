class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.string :name
      t.integer :total
      t.references :section, index: true
      t.references :assignment_type, index: true

      t.timestamps
    end
  end
end
