class Customer::Contact < ApplicationRecord
  belongs_to :user, class_name: 'Customer::User'
end
