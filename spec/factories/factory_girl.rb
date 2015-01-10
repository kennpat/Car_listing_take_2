require 'factory_girl_rails'

FactoryGirl.define do
  factory :manufacturer do
    sequence(:name) { |n| "Renault#{n}"}
    country "France"

  end

end
