class Department < ApplicationRecord
  # validations
  validates :name, presence: true, uniqueness: true
  validates :cover, presence: true

  # Active Storage
  has_one_attached :cover

  # Asociation
  has_many :employees
end
