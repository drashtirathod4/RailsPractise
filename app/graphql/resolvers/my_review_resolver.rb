module Resolvers
    class MyReviewResolver < BaseResolver
        type Types::MyReviewType, null: true
  
        argument :my_review_id, Int, required: true

        def resolve(my_review_id:)
            # Perform a login check at the beginning of the process
            login_required!
            
            review = MyReview.find_by(id: my_review_id)
            # To authorize user : if the user owns the review or not
            raise GraphQL::ExecutionError, 'Permission denied!!' if context[:current_user].id != review.my_user_id
            
            review
        end
    end
end
