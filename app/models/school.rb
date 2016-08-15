class School < ApplicationRecord

  has_many :teacher
  has_many :student
end
