class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :name
      t.string :abb
      t.string :sub_id
      t.text :segments

      t.timestamps null: false
    end
  end
end
