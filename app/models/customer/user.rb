class Customer::User < ApplicationRecord
  has_many :addresses, :class_name => 'Customer::Address'
  has_one :contact, :class_name => 'Customer::Contact'
end