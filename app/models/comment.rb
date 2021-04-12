class Comment < ApplicationRecord
  belongs_to :post
  #バリデーション body必須項目
  validates :body, presence: true
end
