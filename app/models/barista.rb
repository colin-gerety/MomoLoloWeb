class Barista < ApplicationRecord
  has_many :images, as: :picturable, dependent: :destroy, inverse_of: :barista

  accepts_nested_attributes_for :images, reject_if: proc { |attributes| attributes[:image].blank? }, allow_destroy: true

  after_initialize do |barista|
    barista.currently_working ||= true
  end
end

