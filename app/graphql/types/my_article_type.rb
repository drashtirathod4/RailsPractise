module Types
    class MyArticleType < Types::BaseObject
        field :id, ID, null: false
        field :title, String, null: false
        field :description, String, null: false
        field :my_author_id, ID, null: false
    end
end
