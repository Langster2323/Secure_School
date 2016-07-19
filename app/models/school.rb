class School < ApplicationRecord
  validates :name, length: { maximum: 25 }

  has_many :teacher
  has_many :student
end
