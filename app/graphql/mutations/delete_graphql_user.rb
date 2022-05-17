class Mutations::DeleteGraphqlUser < Mutations::BaseMutation
    argument :id, ID, required: true

    field :user, Types::GraphqlUserType, null: true
    field :errors, [String], null: true
    field :message, String, null: true

    def resolve(id:)
        user = GraphqlUser.find_by_id(id)
        if user
            if user.destroy
                {
                    message: "User deleted Successfully!"
                }
            else
                {
                    user: user,
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
