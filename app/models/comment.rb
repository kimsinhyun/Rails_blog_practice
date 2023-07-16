class Comment < ApplicationRecord
  # action_text: rails assets:precompile
  belongs_to :post
  belongs_to :user
  has_rich_text :body
end
