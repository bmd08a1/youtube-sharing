class Post < ApplicationRecord
  validates :user_id, presence: true
  validates :video_id, presence: true

  validates :video_id, uniqueness: { scope: :user_id }

  default_scope { order(created_at: :desc) }

  belongs_to :user
end
