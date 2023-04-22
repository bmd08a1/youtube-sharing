FactoryBot.define do
  factory :post do
    association :user
    link { 'https://www.youtube.com/watch?v=dQw4w9WgXcQ' }
    title { 'Rick Roll' }
    description { 'Rick Roll' }
  end
end
