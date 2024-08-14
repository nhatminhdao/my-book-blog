# == Schema Information
#
# Table name: bookmarked_books
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  book_id    :integer
#  user_id    :integer
#
class BookmarkedBook < ApplicationRecord
end
