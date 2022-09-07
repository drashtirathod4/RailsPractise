class Mutations::CreateMyAuthor < Mutations::BaseMutation
    argument :name, String, required: true

    field :author, Types::MyAuthorType, null: true
    field :errors, [String], null: false

    def resolve(name:)
        author = MyAuthor.new(name: name)
        if author.save
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
    end
end
