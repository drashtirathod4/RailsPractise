class Mutations::DeletePost < Mutations::BaseMutation
    argument :id, ID, required: true

    field :post, Types::PostType, null: true
    field :errors, [String], null: true
    field :message, String, null: true

    def resolve(id:)
        post = Post.find_by_id(id)
        if post
            if post.destroy
                {
                    message: "Post deleted Successfully!"
                }
            else
                {
                    post: post,
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
