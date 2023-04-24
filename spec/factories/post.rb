FactoryBot.define do
  factory :post do
    association :user
    video_id { 'asds' }
    title { 'Rick Roll' }
    description { 'Rick Roll' }
  end
end
