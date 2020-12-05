class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :vocab
  validates :content, presence: true
end
