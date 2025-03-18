class Publisher < ApplicationRecord
  has_many :books

  validates :publisher_name, presence: true, uniqueness: true

  def self.order_by_book_count
    select("publishers.*")
      .select("count(books.id) as books_count")
      .left_joins(:books)
      .group("publishers.id")
      .order("books_count DESC")
  end
end
