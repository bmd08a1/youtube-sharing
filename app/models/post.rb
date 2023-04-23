class Post < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :video_id, presence: true
  validates :title, presence: true

  validates :video_id, uniqueness: { scope: :user_id }

  default_scope { order(created_at: :desc) }
end
