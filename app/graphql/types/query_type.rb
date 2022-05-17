module Types
  class QueryType < Types::BaseObject
    # # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # /graphql_users
    field :graphql_users, [Types::GraphqlUserType], null: false

    def graphql_users
      GraphqlUser.all
    end

    # /graphql_user/:id
    field :graphql_user, Types::GraphqlUserType, null: false do
      argument :id, ID, required: true
    end

    def graphql_user(id:)
      GraphqlUser.find(id)
    end

    # users/:id/posts
    field :posts, [Types::PostType], null: false do
      argument :graphql_user_id, Integer, required: true
    end

    def posts(graphql_user_id:)
      user = GraphqlUser.find(graphql_user_id)
      user.posts.all
    end

    # users/:id/post/:id
    field :post, Types::PostType, null: false do
      argument :graphql_user_id, Integer, required: true
      argument :id, ID, required: true
    end

    def post(graphql_user_id:, id:)
      user = GraphqlUser.find(graphql_user_id)
      user.posts.find(id)
    end
  end
end
