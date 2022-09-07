class Mutations::DeleteMyArticle < Mutations::BaseMutation
    argument :id, ID, required: true

    field :author, Types::MyArticleType, null: true
    field :errors, [String], null: true
    field :message, String, null: true

    def resolve(id:)
        article = MyArticle.find_by_id(id)
        if article
            if article.destroy
                {
                    message: "Article deleted Successfully!"
                }
            else
                {
                    article: article,
                    errors: article.errors.full_messages
                }
            end
        else
            {
                article: nil,
                errors: ["Article don't exist!"]
            }
        end
    end
end
