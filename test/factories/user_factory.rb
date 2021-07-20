FactoryBot.define do
  factory :user do
    first_name { 'Test' }
    last_name { 'Person' }
    sequence(:email) { |n| "test-#{n}@person.com" }
    password { 'password' }
  end
end
