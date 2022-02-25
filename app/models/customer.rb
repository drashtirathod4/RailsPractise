class Customer < ApplicationRecord
    validates :name, presence: true, uniqueness: true
end
