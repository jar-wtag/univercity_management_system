require 'ffaker'
FactoryBot.define do
  factory :semester do |f|
    f.name {FFaker::Name.name}

    sequence(:duration_in_month) { |n| n}
  end

  factory :invalid_semester, class: Semester do
    name nil
    duration_in_month nil
  end


end