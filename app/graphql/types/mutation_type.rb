module Types
  class MutationType < Types::BaseObject
    field :create_my_author, mutation: Mutations::CreateMyAuthor
    field :create_my_article, mutation: Mutations::CreateMyArticle
    field :update_my_author, mutation: Mutations::UpdateMyAuthor
    field :update_my_article, mutation: Mutations::UpdateMyArticle
    field :delete_my_author, mutation: Mutations::DeleteMyAuthor
    field :delete_my_article, mutation: Mutations::DeleteMyArticle
    field :create_my_user, mutation: Mutations::CreateMyUser
    field :sign_in_my_user, mutation: Mutations::SignInMyUser
    field :create_link, mutation: Mutations::CreateLink
    # field :sign_out_my_user, mutation: Mutations::SignOutMyUser
    field :update_my_review, mutation: Mutations::UpdateMyReview
  end
end
