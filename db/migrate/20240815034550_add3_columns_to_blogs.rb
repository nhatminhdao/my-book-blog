class Add3ColumnsToBlogs < ActiveRecord::Migration[7.1]
  def change
    add_column :blogs, :book_title, :text
    add_column :blogs, :book_author, :text
    add_column :blogs, :book_url, :text
  end
end
