require 'ffaker'
FactoryBot.define do
  factory :section do
    sequence(:section_no){|n| n}
    course
  end
  factory :invalid_section, class: Section do
    section_no nil
  end
end