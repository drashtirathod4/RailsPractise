module Resolvers
    class BaseResolver < GraphQL::Schema::Resolver
        def login_required!
            # Raise if you're not logged in
            raise GraphQL::ExecutionError, 'login required!!' unless context[:current_user]
        end
    end
end