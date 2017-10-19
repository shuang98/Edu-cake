class Exercise < ApplicationRecord
  belongs_to :section
  validates :question, presence: true
  validates :answer, presence: true
end
