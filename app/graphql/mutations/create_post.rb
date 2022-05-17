class Mutations::CreatePost < Mutations::BaseMutation
    argument :graphql_user_id, Integer, required: true
    argument :title, String, required: true
    argument :body, String, required: true

    field :post, Types::PostType, null: true
    field :errors, [String], null: false

    def resolve(graphql_user_id:, title:, body:)
        user = GraphqlUser.find_by_id(graphql_user_id)
        if user
            post = user.posts.build(title: title, body: body)
            if post.save
                {
                    post: post,
                    errors: []
                }
            else
                {
                    post: nil,
                    errors: post.errors.full_messages
                }
            end
        else
            {
                post: nil,
                errors: ["User don't exist!"]
            }
        end
    end
end
