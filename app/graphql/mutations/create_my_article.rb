class Mutations::CreateMyArticle < Mutations::BaseMutation
    argument :title, String, required: true
    argument :description, String, required: true
    argument :my_author_id, Integer, required: true

    field :article, Types::MyArticleType, null: true
    field :errors, [String], null: false

    def resolve(title:, description:, my_author_id:)
        author = MyAuthor.find_by_id(my_author_id)
        if author
            article = author.my_articles.build(title: title, description: description)
            if article.save
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
                errors: ["Author don't exist!"]
            }
        end
    end
end
