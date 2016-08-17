class Teacher < ApplicationRecord
  validates :name, null: false

  belongs_to :school
  has_many :students
end
