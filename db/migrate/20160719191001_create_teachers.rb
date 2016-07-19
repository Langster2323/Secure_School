class CreateTeachers < ActiveRecord::Migration[5.0]
  def change
    create_table :teachers do |t|
      t.school :belongs_to
      has_many :students
      
      t.string :name

      t.timestamps
    end
  end
end
