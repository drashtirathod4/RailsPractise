module Types
  class MutationType < Types::BaseObject
    field :create_graphql_user, mutation: Mutations::CreateGraphqlUser
    field :edit_graphql_user, mutation: Mutations::EditGraphqlUser
    field :delete_graphql_user, mutation: Mutations::DeleteGraphqlUser
    field :create_post, mutation: Mutations::CreatePost
    field :edit_post, mutation: Mutations::EditPost
    field :delete_post, mutation: Mutations::DeletePost
  end
end
