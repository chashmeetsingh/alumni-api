require 'ffaker'

FactoryGirl.define do
  factory :user do
    name                  FFaker::Name.name
    sequence(:email)      { |n| "user#{n}@example.com"}
    password              'password'
    password_confirmation 'password'
    bio                   'Hello world'
  end
end
