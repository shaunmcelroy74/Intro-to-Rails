require "csv"

Book.destroy_all
Publisher.destroy_all

filename = Rails.root.join "db/bookPublishingData.csv"

puts "Reading in the file from here #{filename}"

csv_data = File.read(filename)
books = CSV.parse(csv_data, headers: true, encoding: 'utf-8')

books.each do |book|
  publisher = Publisher.find_or_create_by(publisher_name: book["Publisher"])

  if publisher.valid?
  else
    puts "Not able to create the Publishers name #{book["Publisher"]}"
  end
end

puts "Created #{Publisher.count} Publishers"
