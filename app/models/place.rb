class Place < ApplicationRecord
  has_many :images, as: :picturable, dependent: :destroy
  accepts_nested_attributes_for :images
end
