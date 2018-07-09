class Announcement < ApplicationRecord
  belongs_to :user

  validates :pet, presence: true
  validates :description, presence: true
  validates :prevalent_color, presence: true
  validates :size, presence: true

  enum pet: [:dog, :cat]
  enum size: [:puppy, :medium, :adult]
end
