FactoryGirl.define do
  sequence :priority do |n|
    n
  end

  factory :category do
    name      { Faker::Name.name }
    priority
  end
end
