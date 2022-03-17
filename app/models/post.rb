require 'active_support/all'
class Post < ApplicationRecord
    belongs_to :user

    # delegate
    delegate :name, :email, to: :user, prefix: true
end
