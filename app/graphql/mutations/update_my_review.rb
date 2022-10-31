class Mutations::UpdateMyReview < Mutations::BaseAdminMutation
    argument :my_review_id, Int, required: true
    argument :title, String, required: false
    argument :body, String, required: false

    type Types::MyReviewType

    def resolve(my_review_id:, title:, body:)
        review = MyReview.find my_review_id
        review.title = title if title
        review.body = body if body
        review.save!

        review
    end
end
