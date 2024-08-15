class BlogsController < ApplicationController
  def index
    matching_blogs = Blog.all

    @list_of_blogs = matching_blogs.order({ :created_at => :desc })

    render({ :template => "blogs/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_blogs = Blog.where({ :id => the_id })

    @the_blog = matching_blogs.at(0)

    render({ :template => "blogs/show" })
  end

  def create
    the_blog = Blog.new
    the_blog.blogger_id = params.fetch("query_blogger_id")
    the_blog.content = params.fetch("query_content")
    the_blog.privacy_status = params.fetch("query_privacy_status")
    the_blog.book_title = params.fetch("query_book_title")
    the_blog.book_author = params.fetch("query_book_author")
    the_blog.book_url = params.fetch("query_book_url")

    if the_blog.valid?
      the_blog.save
      redirect_to("/blogs", { :notice => "Blog created successfully." })
    else
      redirect_to("/blogs", { :alert => the_blog.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_blog = Blog.where({ :id => the_id }).at(0)

    the_blog.blogger_id = params.fetch("query_blogger_id")
    the_blog.content = params.fetch("query_content")
    the_blog.privacy_status = params.fetch("query_privacy_status")
    the_blog.book_title = params.fetch("query_book_title")
    the_blog.book_author = params.fetch("query_book_author")
    the_blog.book_url = params.fetch("query_book_url")

    if the_blog.valid?
      the_blog.save
      redirect_to("/blogs/#{the_blog.id}", { :notice => "Blog updated successfully."} )
    else
      redirect_to("/blogs/#{the_blog.id}", { :alert => the_blog.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_blog = Blog.where({ :id => the_id }).at(0)

    the_blog.destroy

    redirect_to("/blogs", { :notice => "Blog deleted successfully."} )
  end
end
