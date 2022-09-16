# frozen_string_literal: true

module Types
  class MyReviewType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: true
    field :body, String, null: true
    field :my_user_id, Integer, null: false
    field :secret, String, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    # Called when defining a method with field name
    def secret
      # If the logged-in user and the user who wrote the review are different, return nil
      return if object.my_user_id != context[:current_user].id

      object.secret
    end
  end
end
