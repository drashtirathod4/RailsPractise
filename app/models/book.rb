class Book < ApplicationRecord
    validates :title, :price, :status, presence: true
    has_many :review

    # scopes
    scope :title, -> { where(title: 'book2' )}
    scope :book1_this_year, -> { title.where("year < 2022") }
    # passing in argunments in scope
    scope :price_more_than, ->(amount) { where("price > ?", amount) }
 
    def self.this_year(year)
        where("year = ?", year)
    end

    # scope using conditionals
    scope :views_more_than, ->(views) { where("views > ?", views) if views.present? }

    def self.views_more_than(views)
        where("views > ?", views) if views.present?
    end

    # Default scope
    # this will be applied on all queries of books and will return only books whose price is > 200
    # default_scope { where('price > 200') }

    # enum
    enum :status, [:published, :undisclosed]

    # method chaining example
    def self.chaining
        Book.select('books.id', 'books.title', 'books.price').joins(:review).where('review.book_id > ?', 0)
        Book.select('books.id', 'books.title', 'books.price').joins(:review).find_by(title: 'book1')
    end
end
