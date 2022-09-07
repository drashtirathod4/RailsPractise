module Types
  class MutationType < Types::BaseObject
    field :create_my_author, mutation: Mutations::CreateMyAuthor
    field :create_my_article, mutation: Mutations::CreateMyArticle
    field :update_my_author, mutation: Mutations::UpdateMyAuthor
    field :update_my_article, mutation: Mutations::UpdateMyArticle
    field :delete_my_author, mutation: Mutations::DeleteMyAuthor
    field :delete_my_article, mutation: Mutations::DeleteMyArticle
  end
end