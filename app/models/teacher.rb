class Teacher < ApplicationRecord
  belongs_to :school

  def name_with_school
    "#{self.name} (#{self.school.name})"
  end
end
