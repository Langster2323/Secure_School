class Student < ApplicationRecord
  validates :name, null: false

  belongs_to :teacher
end
