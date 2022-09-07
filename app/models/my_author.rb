class MyAuthor < ApplicationRecord
    has_many :my_articles
    validates :name, presence: true
end
