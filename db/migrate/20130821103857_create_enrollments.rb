class CreateEnrollments < ActiveRecord::Migration
  def change
    create_table :enrollments do |t|
      t.references :role, index: true
      t.references :section, index: true
      t.references :profile, index: true

      t.timestamps
    end
  end
end
