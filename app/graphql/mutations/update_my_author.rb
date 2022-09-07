class Mutations::UpdateMyAuthor < Mutations::BaseMutation
    argument :id, ID, required: true
    argument :name, String

    field :author, Types::MyAuthorType, null: true
    field :errors, [String], null: false

    def resolve(id:, name:)
        author = MyAuthor.find_by_id(id)
        if author
            if author.update(name: name)
                {
                    author: author,
                    errors: []
                }
            else
                {
                    author: nil,
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
