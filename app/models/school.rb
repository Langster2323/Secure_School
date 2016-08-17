class School < ApplicationRecord
  validates :name, null: false

  has_many :teachers
  has_many :students
end
