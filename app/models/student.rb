class Student < ApplicationRecord
  belongs_to :department
  validates :name, :email, :username, presence: true
  validates :email, :username, uniqueness: true
end
