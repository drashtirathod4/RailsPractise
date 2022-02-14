class Account < ApplicationRecord
    validates :supplier_id, presence: true, uniqueness: true
    belongs_to :supplier
    has_one :account_history
end
