class Supplier < ApplicationRecord
  has_many :contacts
  has_many :supplier_items
  has_many :order_items, -> { order 'order_items.name'}, through: :supplier_items

  accepts_nested_attributes_for :contacts, allow_destroy: true, reject_if: proc { |attributes| attributes['name'].blank? }


end
