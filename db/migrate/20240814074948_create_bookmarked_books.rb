class CreateBookmarkedBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :bookmarked_books do |t|
      t.integer :user_id
      t.integer :book_id

      t.timestamps
    end
  end
end
