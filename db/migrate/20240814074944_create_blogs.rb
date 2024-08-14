class CreateBlogs < ActiveRecord::Migration[7.1]
  def change
    create_table :blogs do |t|
      t.integer :blogger_id
      t.integer :book_id
      t.text :content
      t.string :privacy_status

      t.timestamps
    end
  end
end
