class Mutations::DeleteMyAuthor < Mutations::BaseMutation
    argument :id, ID, required: true

    field :author, Types::MyAuthorType, null: true
    field :errors, [String], null: true
    field :message, String, null: true

    def resolve(id:)
        author = MyAuthor.find_by_id(id)
        if author
            if author.destroy
                if author.my_articles.destroy_all
                    {
                        message: "Author and its all articles deleted Successfully!"
                    }
                end
            else
                {
                    author: author,
                    errors: author.errors.full_messages
                }
            end
        else
            {
                author: nil,
                errors: ["Author don't exist!"]
            }
        end
    end
end
