class RemoveBookIdFromBlogs < ActiveRecord::Migration[7.1]
  def change
    remove_column :blogs, :book_id
  end
end
