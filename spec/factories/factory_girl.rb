require 'factory_girl_rails'

FactoryGirl.define do
  factory :manufacturer do
    sequence(:name) { |n| "Renault#{n}"}
    country 'France'
  end

  factory :vehicle do
    color 'Yellow'
    year 1931
    mileage 24567
    manufacturer
  end

end
