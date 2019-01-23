#!/bin/bash

rails generate scaffold supplier \
  name:string \
  order_info:text \
  delivery_type:string \
  payment_type:string \
  notes:text \
  maintains_stock:boolean 

rails generate scaffold contact \
  name:string \
  contact_type:string \
  phone:string \
  email:string \
  address:text \
  notes:text \
  supplier:belongs_to
  
rails generate scaffold order_item \
  name:string \
  category:string \
  item_id:string \
  description:text   

rails generate model supplier_items  supplier_id:integer order_item_id:integer rank:integer

# add ",default: 1" to order_items migration

# add to app/models/supplier_item.rb
#  belongs_to :supplier
#  belongs_to :order_item 

# add to app/models/supplier.rb
#  has_many :supplier_items
#  has_many :order_items, through: :supplier_items

# add to app/models/order_item.rb
#  has_many :supplier_items
#  has_many :suppliers, through: :supplier_items

