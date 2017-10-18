class Section < ApplicationRecord
  belongs_to :course
  has_many :bodies
  has_many :exercises
  accepts_nested_attributes_for :bodies, reject_if: :all_blank, allow_destroy: true

  validates :title, presence: true
end
