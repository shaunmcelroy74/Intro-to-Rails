require "csv"

BookAuthor.destroy_all
Author.destroy_all
Book.destroy_all
Publisher.destroy_all

filename = Rails.root.join("db/bookPublishingData.csv")

puts "Reading in the file from here #{filename}"

csv_data = File.read(filename)
books = CSV.parse(csv_data, headers: true, encoding: 'utf-8')

# Process only the first 10 rows (for testing)
books[0..9].each do |row|
  # Find or create the publisher
  publisher = Publisher.find_or_create_by(publisher_name: row["Publisher"])

  if publisher.valid?
    new_book = publisher.books.create(
      book_name: row["Book_Name"],
      publishing_year: row["Publishing_Year"],
      language_code: row["Language_Code"],
      book_average_rating: row["Book_Average_Rating"],
      book_ratings_count: row["Book_Ratings_Count"],
      genre: row["Genre"],
      gross_sales: row["Gross_Sales"],
      sale_price: row["Sale_Price"],
      sale_rank: row["Sale_Rank"],
      units_sold: row["Units_Sold"]
    )

    unless new_book.valid?
      puts "Not able to create the book #{row["Book_Name"]}"
      next
    end

    # Process authors.
    # (Adjust the CSV header key "Author" if necessary.)
    if row["Author"] # ensure there's an author field
      author_names = row["Author"].split(",").map(&:strip)
      author_names.each do |author_name|
        puts author_name
        # Optionally: Create Author and BookAuthor records if you need to
        # For example:
        author = Author.find_or_create_by(author_name: author_name)
        BookAuthor.create(book: new_book, author: author)
      end
    end

    # Update the publisher's revenue.
    book_sales = row["Gross_Sales"].to_f
    current_revenue = publisher.publisher_revenue.to_f
    publisher.update(publisher_revenue: current_revenue + book_sales)
  else
    puts "Not able to create the Publisher with name #{row["Publisher"]}"
  end
end

puts "Created #{Publisher.count} Publishers"
puts "Created #{Book.count} Books"
puts "Created #{Author.count} Authors"
