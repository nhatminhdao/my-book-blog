class CreateBlogs < ActiveRecord::Migration[7.1]
  def change
    create_table :blogs do |t|
      t.integer :blogger_id
      t.text :content
      t.string :privacy_status
      t.text :book_title
      t.text :book_author
      t.text :book_url

      t.timestamps
    end
  end
end
