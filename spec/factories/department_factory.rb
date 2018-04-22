require 'ffaker'
FactoryBot.define do
  factory :department do |f|
    #f.name {FFaker::Name.name}
     sequence(:name) { |n| "CSSE#{n}"}
  end

end