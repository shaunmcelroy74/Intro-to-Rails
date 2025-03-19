class Author < ApplicationRecord
  has_many :book_authors
  has_many :books, through: :book_authors

  validates :author_name, :author_rating, uniqueness: true
end
