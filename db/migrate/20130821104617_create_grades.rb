class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|
      t.int :value
      t.references :assignment, index: true
      t.references :enrollment, index: true

      t.timestamps
    end
  end
end
