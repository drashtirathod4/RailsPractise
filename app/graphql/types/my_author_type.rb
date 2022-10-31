# frozen_string_literal: true

module Types
  class MyAuthorType < Types::BaseObject
    field :id, ID, null: false
    field :name, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :my_articles, [Types::MyArticleType], null: true
    field :my_articles_count, Integer, null: true

    def my_articles_count
      object.my_articles.size
    end
  end
end
