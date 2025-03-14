# README

# MODELS
Author
  - id (auto incremeting PK)
  - name:string
  - rating:string

Publisher
  - id (auto incremeting PK)
  - name:string
  - revenue:string

Book

  - id (auto incremeting PK)
  - name:string
  - publishing_year:integer
  - language_code:string
  - average_rating:decimal
  - ratings_count:integer
  - genre:string
  - gross_sales:string
  - sale_price:string
  - sale_rank:integer
  - units_sold:integer
  - publisher_id:integer

# Many to Many Relationship
A Book can be written by one or many authors and one or many authors can write one or many books
A join table will be used called book_author

Book_Author
  - book_id:integer (FK)
  - author_id:integer (FK)