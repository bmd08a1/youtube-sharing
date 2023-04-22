class Post < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :link, presence: true
  validates :title, presence: true

  validates :link, uniqueness: { scope: :user_id }
end
