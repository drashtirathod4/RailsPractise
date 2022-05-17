class Mutations::EditPost < Mutations::BaseMutation
    argument :id, ID, required: true
    argument :title, String
    argument :body, String

    field :post, Types::PostType, null: true
    field :errors, [String], null: true

    def resolve(id:, title:, body:)
        post = Post.find_by_id(id)
        if post
            if post.update(title: title, body: body)
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
                errors: ["Post don't exist!"]
            }
        end
    end
end
