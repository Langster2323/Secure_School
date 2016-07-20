class School < ApplicationRecord
  validates :name, presence: true

  has_many :teacher
  has_many :student
end
