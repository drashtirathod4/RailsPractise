class Mutations::UpdateMyArticle < Mutations::BaseMutation
    argument :id, ID, required: true
    argument :title, String, required: false
    argument :description, String, required: false

    field :article, Types::MyArticleType, null: true
    field :errors, [String], null: false

    def resolve(id:, title:, description:)
        article = MyArticle.find_by_id(id)
        if article
            if article.update(title: title, description: description)
                {
                    article: article,
                    errors: []
                }
            else
                {
                    article: nil,
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
