class SupplierItem < ApplicationRecord
  belongs_to :supplier
  belongs_to :order_item

  accepts_nested_attributes_for :supplier

end
