class Barista < ApplicationRecord
  has_many :images, as: :picturable, dependent: :destroy

  accepts_nested_attributes_for :images

  after_initialize do |barista|
    barista.currently_working ||= true
  end
end

