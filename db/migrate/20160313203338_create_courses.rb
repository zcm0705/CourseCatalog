class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.text :subjects
      t.string :credit
      t.string :name
      t.string :requirement
      t.text :description
      t.string :c_id
      t.string :code


      t.timestamps null: false
    end
  end
end
