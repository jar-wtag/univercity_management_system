require 'ffaker'
FactoryBot.define do
  factory :course do |f|
    f.name {FFaker::Name.name}
    sequence(:course_code){|n| n+100}
    department
  end

  # trait :invalid do
  #   name nil
  #   course_code nil
  # end

end