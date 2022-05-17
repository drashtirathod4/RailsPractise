class Mutations::EditGraphqlUser < Mutations::BaseMutation
    argument :id, ID, required: true
    argument :name, String
    argument :email, String

    field :user, Types::GraphqlUserType, null: true
    field :errors, [String], null: true

    def resolve(id:, name:, email:)
        user = GraphqlUser.find_by_id(id)
        if user
            if user.update(name: name, email: email)
                {
                    user: user,
                    errors: []
                }
            else
                {
                    user: nil,
                    errors: user.errors.full_messages
                }
            end
        else
            {
                user: nil,
                errors: ["User don't exist!"]
            }
        end
    end
end
