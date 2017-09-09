FactoryGirl.define do
  factory :image do
    file { Faker::Avatar.image }
  end
end
