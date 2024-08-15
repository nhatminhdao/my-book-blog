# == Schema Information
#
# Table name: blogs
#
#  id             :bigint           not null, primary key
#  book_author    :text
#  book_title     :text
#  book_url       :text
#  content        :text
#  privacy_status :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  blogger_id     :integer
#
class Blog < ApplicationRecord
end
