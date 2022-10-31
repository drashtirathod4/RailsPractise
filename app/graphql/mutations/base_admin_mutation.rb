class Mutations::BaseAdminMutation < Mutations::BaseMutation
    def authorized?(**args)
        raise GraphQL::ExecutionError, 'login required!!' unless context[:current_user]
        raise GraphQL::ExecutionError, 'Permission denied!!' unless context[:current_user].admin?
        
        super
    end
end
