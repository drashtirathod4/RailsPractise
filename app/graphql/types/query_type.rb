module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # /my_authors
    field :my_authors, [Types::MyAuthorType], null: false

    def my_authors
      MyAuthor.all
    end

    # cursor type pagination
    field :my_authors_connection, Types::MyAuthorsConnection, null: false

    def my_authors_connection(**_args)
      MyAuthor.all
    end

    # /my_author/:id
    field :my_author, Types::MyAuthorType, null: false do
      argument :id, ID, required: true
    end

    def my_author(id:)
      MyAuthor.find(id)
    end

    # /my_articles
    field :my_articles, [Types::MyArticleType], null: false

    def my_articles
      MyArticle.all
    end

    # /my_article/:id
    field :my_article, Types::MyArticleType, null: false do
      argument :id, ID, required: true
    end

    def my_article(id:)
      MyArticle.find(id)
    end

    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World!"
    end
  end
end
