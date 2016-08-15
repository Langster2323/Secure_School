class Student < ApplicationRecord
  belongs_to :teacher

  def school_teachers
    Teacher.where(school_id: teacher.school_id)
  end
end
