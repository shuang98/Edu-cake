class Course < ApplicationRecord
  acts_as_followable
  belongs_to :user
  has_many :sections
  validates :title, presence: true
  validates :description, presence: true

end
