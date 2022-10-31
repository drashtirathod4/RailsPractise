class AddAuthorToArticle < ActiveRecord::Migration[7.0]
  def change
    add_reference :my_articles, :my_author
  end
end
