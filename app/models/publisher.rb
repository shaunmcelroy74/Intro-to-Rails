class Publisher < ApplicationRecord
  has_many :books

  validates :publisher_name, presence: true, uniqueness: true

  def self.order_by_book_count
    #     SELECT count(publishers.id) as book_count, publishers.*
    # FROM Publishers
    #   LEFT OUTER JOIN books on books.publisher_id = publishers.id
    # GROUP BY publishers.id
    # ORDER BY book_count DESC;
    self.select("publishers.*")
        .select("count(publishers.id) as book_count")
        .left_joins(:books)
        .group("publishers.id")
        .order("book_count DESC")
  end
end
