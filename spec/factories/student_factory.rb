require 'ffaker'
FactoryBot.define do
  factory :student do
    department
    sequence(:name) { |n| "Shohan #{n}" }
    sequence(:age) { |n| 22+n}
    sequence(:roll) { |n| n}

  end
  # factory :invalid_student, class: Student do
  #   name nil
  #   age nil
  #   roll nil
  # end
end
