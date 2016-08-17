class Student < ApplicationRecord
  validates :name, null: false

  belongs_to :teacher

  def school_to_teacher
    Teacher.where(school_id: teacher.school_id)
  end
end
