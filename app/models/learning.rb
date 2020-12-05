class Learning < ApplicationRecord
  belongs_to :user
  belongs_to :vocab

  scope :recent, -> { order(created_at: :desc)}
end
