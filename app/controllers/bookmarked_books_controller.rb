class BookmarkedBooksController < ApplicationController
  def index
    matching_bookmarked_books = BookmarkedBook.all

    @list_of_bookmarked_books = matching_bookmarked_books.order({ :created_at => :desc })

    render({ :template => "bookmarked_books/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_bookmarked_books = BookmarkedBook.where({ :id => the_id })

    @the_bookmarked_book = matching_bookmarked_books.at(0)

    render({ :template => "bookmarked_books/show" })
  end

  def create
    the_bookmarked_book = BookmarkedBook.new
    the_bookmarked_book.user_id = params.fetch("query_user_id")
    the_bookmarked_book.book_id = params.fetch("query_book_id")

    if the_bookmarked_book.valid?
      the_bookmarked_book.save
      redirect_to("/bookmarked_books", { :notice => "Bookmarked book created successfully." })
    else
      redirect_to("/bookmarked_books", { :alert => the_bookmarked_book.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_bookmarked_book = BookmarkedBook.where({ :id => the_id }).at(0)

    the_bookmarked_book.user_id = params.fetch("query_user_id")
    the_bookmarked_book.book_id = params.fetch("query_book_id")

    if the_bookmarked_book.valid?
      the_bookmarked_book.save
      redirect_to("/bookmarked_books/#{the_bookmarked_book.id}", { :notice => "Bookmarked book updated successfully."} )
    else
      redirect_to("/bookmarked_books/#{the_bookmarked_book.id}", { :alert => the_bookmarked_book.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_bookmarked_book = BookmarkedBook.where({ :id => the_id }).at(0)

    the_bookmarked_book.destroy

    redirect_to("/bookmarked_books", { :notice => "Bookmarked book deleted successfully."} )
  end
end
