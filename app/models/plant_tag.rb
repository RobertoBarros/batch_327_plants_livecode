class PlantTag < ApplicationRecord
  belongs_to :tag
  belongs_to :plant

  validates :tag, :plant, presence: true
  validates :tag, uniqueness: { scope: :plant, message: 'Already exist' }
end
