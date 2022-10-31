class MyArticle < ApplicationRecord
    belongs_to :my_author
    validates :title, :description, presence: true
end
