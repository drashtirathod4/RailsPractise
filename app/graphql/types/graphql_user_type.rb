# frozen_string_literal: true

module Types
  class GraphqlUserType < Types::BaseObject
    field :id, ID, null: false
    field :email, String
    field :name, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :posts, [Types::PostType], null: true
    field :posts_count, Integer, null: true
    
    def posts_count
      object.posts.size
    end
  end
end
