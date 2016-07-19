class Teacher < ApplicationRecord
  validates :name, null: false

  belongs_to :school
end
