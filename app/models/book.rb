# == Schema Information
#
# Table name: books
#
#  id         :bigint           not null, primary key
#  author     :string
#  cover_url  :string
#  summary    :text
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Book < ApplicationRecord
end
