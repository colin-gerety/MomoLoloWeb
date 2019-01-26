class OrderItem < ApplicationRecord
  default_scope { order(name: :asc) }

  has_many :supplier_items
  has_many :suppliers, through: :supplier_items

  accepts_nested_attributes_for :supplier_items, allow_destroy: true, reject_if: proc { |attributes| attributes['supplier_id'].blank? }
end

