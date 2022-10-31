class Link < ApplicationRecord
    belongs_to :my_user

    validates :url, presence: true, length: { minimum:3 }
    validates :description, presence: true, length: { minimum:3 }
end
